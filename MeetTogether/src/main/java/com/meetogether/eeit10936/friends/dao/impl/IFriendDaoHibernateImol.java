package com.meetogether.eeit10936.friends.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.service.MemberService;
import com.meetogether.eeit10936.friends.dao.IFriendDao;
import com.meetogether.eeit10936.friends.model.AddFriend;
import com.meetogether.eeit10936.friends.model.FriendList;
import com.meetogether.eeit10936.pairs.model.Pair;

@Repository
public class IFriendDaoHibernateImol implements IFriendDao {
	@Autowired
	private SessionFactory factory;
	@Autowired
	private MemberService mService;
	
	@Override
	public void deleteFriends(Integer id,Integer fid) {
		String hql = "from FriendList f WHERE f.memberId = ?0 AND f.friendId = ?1";
		FriendList result = factory.getCurrentSession().createQuery(hql,FriendList.class)
							.setParameter(0, id).setParameter(1, fid).uniqueResult();
		FriendList result2 = factory.getCurrentSession().createQuery(hql,FriendList.class)
					.setParameter(0, fid).setParameter(1, id).uniqueResult();
		if(result!=null) {
			factory.getCurrentSession().delete(result);
		}else if(result2!=null) {
			factory.getCurrentSession().delete(result2);
		}
		String hql2="FROM AddFriend a WHERE a.f1Id = ?0 AND a.f2Id = ?1";
		AddFriend result3 = factory.getCurrentSession().createQuery(hql2,AddFriend.class)
		            .setParameter(0, id).setParameter(1, fid).uniqueResult();
		AddFriend result4 = factory.getCurrentSession().createQuery(hql2,AddFriend.class)
	            .setParameter(0, fid).setParameter(1, id).uniqueResult();
		if(result3!=null) {
			factory.getCurrentSession().delete(result3);
		}else if(result4!=null) {
			factory.getCurrentSession().delete(result4);
		}
		
	}

	@Override
	public List<FriendList> findFriendsById(Integer id) {
		String hql = "from FriendList f WHERE f.memberId = ?0 OR f.friendId = ?0";
		TypedQuery<FriendList> result = factory.getCurrentSession().createQuery(hql, FriendList.class).setParameter(0,
				id);
		return result.getResultList();
	}

	@Override
	public void addFriendList(Integer id, Integer f2) {

		String hql = "FROM Pair p WHERE p.pairPk.memberId = ?0 AND p.pairPk.pairMemberId = ?1 AND p.status = '1'";
		Pair result = factory.getCurrentSession().createQuery(hql,Pair.class).setParameter(0, f2).setParameter(1, id)
				.uniqueResult();
		if (result != null) {
			FriendList fl = new FriendList();
			fl.setMemberId(id);
			fl.setFriendId(f2);
			fl.setFriendStatus(1);
			factory.getCurrentSession().persist(fl);
		}
	}

	@Override
	public Map<Integer, String> findFriendsByName(Integer id, String fName) {
		Map<Integer, String> mp = new HashMap<Integer, String>();
		String hql1 = "FROM MemberBean mb WHERE mb.memberId "
				+ "IN(SELECT fl.friendId FROM FriendList fl Where fl.memberId = ?0) " 
				+ "And mb.memberName LIKE ?1";
		List<MemberBean> rs1 = factory.getCurrentSession().createQuery(hql1, MemberBean.class).setParameter(0, id)
				.setParameter(1, "%" + fName + "%").getResultList();
		
		String hql2 = "FROM MemberBean mb WHERE mb.memberId "
				+ "IN(SELECT fl.memberId FROM FriendList fl Where fl.friendId = ?0) " 
				+ "And mb.memberName LIKE ?1";
		List<MemberBean> rs2 = factory.getCurrentSession().createQuery(hql2, MemberBean.class).setParameter(0, id)
				.setParameter(1, "%" + fName + "%").getResultList();
		rs1.forEach((i) -> {
			mp.put(i.getMemberId(), i.getMemberName());
		});
		rs2.forEach((i) -> {
			mp.put(i.getMemberId(), i.getMemberName());
		});
		return mp;

	}
	
	@Override
	public void response(Integer f1id,Integer f2id,Integer status) {
		String hql="FROM AddFriend a WHERE a.f1Id = ?0 AND a.f2Id = ?1";
		AddFriend result = factory.getCurrentSession().createQuery(hql,AddFriend.class)
	            .setParameter(0, f2id).setParameter(1, f1id).uniqueResult();
		if(result!=null) {
			if(status==1) {
				addFriendList(f1id, f2id);
			}
			result.setF2IdAllow(status);
			factory.getCurrentSession().update(result);
			
		}
		
	}
	@Override
	public boolean checkAddFriend(Integer f1id,Integer f2id) {
		String hql="FROM AddFriend a WHERE a.f1Id = ?0 AND a.f2Id = ?1";
		AddFriend result = factory.getCurrentSession().createQuery(hql,AddFriend.class)
		            .setParameter(0, f1id).setParameter(1, f2id).uniqueResult();
		if(result != null) {
			if(result.getF2IdAllow() == null) {
				return true;
			}
		}
		
		return false;
	}
	
	@Override
	public boolean checkResponse(Integer f1id,Integer f2id) {
		String hql2="FROM AddFriend a WHERE a.f1Id = ?0 AND a.f2Id = ?1";
		AddFriend result4 = factory.getCurrentSession().createQuery(hql2,AddFriend.class)
	            .setParameter(0, f2id).setParameter(1, f1id).uniqueResult();
		if(result4 != null) {
			if(result4.getF2IdAllow() == null) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public boolean checkFriendList(Integer f1id,Integer f2id) {
		String hql = "from FriendList f WHERE f.memberId = ?0 AND f.friendId = ?1";
		FriendList result = factory.getCurrentSession().createQuery(hql,FriendList.class)
							.setParameter(0, f1id).setParameter(1, f2id).uniqueResult();
		FriendList result2 = factory.getCurrentSession().createQuery(hql,FriendList.class)
					.setParameter(0, f2id).setParameter(1, f1id).uniqueResult();
		if(result != null || result2 != null) {
			return true;
		}
		return false;
	}
	private boolean checkFriend(Integer f1id,Integer f2id) {
		String hql = "from FriendList f WHERE f.memberId = ?0 AND f.friendId = ?1";
		FriendList result = factory.getCurrentSession().createQuery(hql,FriendList.class)
							.setParameter(0, f1id).setParameter(1, f2id).uniqueResult();
		FriendList result2 = factory.getCurrentSession().createQuery(hql,FriendList.class)
					.setParameter(0, f2id).setParameter(1, f1id).uniqueResult();
		String hql2="FROM AddFriend a WHERE a.f1Id = ?0 AND a.f2Id = ?1";
		AddFriend result3 = factory.getCurrentSession().createQuery(hql2,AddFriend.class)
		            .setParameter(0, f1id).setParameter(1, f2id).uniqueResult();
		AddFriend result4 = factory.getCurrentSession().createQuery(hql2,AddFriend.class)
	            .setParameter(0, f2id).setParameter(1, f1id).uniqueResult();
		if (result == null && result2 == null) {
			if (result3 == null && result4 == null) {
				return false;
			}
		}
		return true;
	}

	@Override
	public void invite(Integer f1id,Integer f2id) {		
		if(!checkFriend(f1id,f2id)) {
			AddFriend inviteAddFriend=new AddFriend();
			inviteAddFriend.setF1Id(f1id);
			inviteAddFriend.setF1IdAllow(1);
			inviteAddFriend.setF2Id(f2id);
			factory.getCurrentSession().persist(inviteAddFriend);
		}
	}
	
	@Override
	public Map<Integer, String> responseList(Integer id){
		Map<Integer, String> map =new HashMap<Integer, String>();
		String hql="FROM AddFriend a WHERE a.f1Id = ?0 AND a.f1IdAllow IS NULL AND a.f2IdAllow = 1";
		List<AddFriend> result = factory.getCurrentSession().createQuery(hql,AddFriend.class)
		            .setParameter(0, id).getResultList();
		if(result!=null) {
			result.forEach((i)->{
				MemberBean member = mService.getMemberById(i.getF2Id());
				map.put(member.getMemberId(), member.getMemberName());
			});
		}
		
		
		String hql1="FROM AddFriend a WHERE a.f2Id = ?0 AND a.f2IdAllow IS NULL AND a.f1IdAllow = 1";
		List<AddFriend> result1 = factory.getCurrentSession().createQuery(hql1,AddFriend.class)
		            .setParameter(0, id).getResultList();
		if(result1!=null) {
			result1.forEach((i)->{
				MemberBean member = mService.getMemberById(i.getF1Id());
				map.put(member.getMemberId(), member.getMemberName());
			});
			
		}
		
		return map;
		
	}
}
