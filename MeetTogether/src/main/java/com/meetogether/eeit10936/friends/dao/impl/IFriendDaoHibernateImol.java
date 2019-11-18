package com.meetogether.eeit10936.friends.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10936.friends.dao.IFriendDao;
import com.meetogether.eeit10936.friends.model.FriendList;
import com.meetogether.eeit10936.pairs.model.Pair;

@Repository
public class IFriendDaoHibernateImol implements IFriendDao {
	@Autowired
	private SessionFactory factory;

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

}
