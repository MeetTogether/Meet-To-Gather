package com.meetogether.eeit10936.pairs.dao.impl;

import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10936.pairs.dao.IMemberDao;
import com.meetogether.eeit10936.pairs.model.IMember;
import com.meetogether.eeit10936.pairs.model.Interest;
import com.meetogether.eeit10936.pairs.model.MemberAlbum;
import com.meetogether.eeit10936.pairs.model.MemberHope;
import com.meetogether.eeit10936.pairs.model.MemberInfo;
import com.meetogether.eeit10936.pairs.model.MemberModel;
import com.meetogether.eeit10936.pairs.model.Pair;
import com.meetogether.eeit10936.pairs.model.PairPK;
import com.meetogether.eeit10936.pairs.model.VipStatus;

@Repository("dao")
public class IMemberDaoHibernatempl implements IMemberDao {
	@Autowired
	private SessionFactory factory;

	@Override
	public IMember findByMemberId(Integer id) {
		IMember member = new MemberModel();
		List<String> al = new ArrayList<String>();
		MemberBean mb = factory.getCurrentSession().find(MemberBean.class, id);
		member.setMemberBasic(mb);
		member.setMemberInfo(factory.getCurrentSession().find(MemberInfo.class, id));
		member.setMemberHope(factory.getCurrentSession().find(MemberHope.class, id));
		findInterestByMemberId(id).forEach((i) -> {
			al.add(findInteretByInterestId(i));
		});
		member.setMemberInterestList(al);
		return member;
	}

	@Override
	public List<IMember> findAllMember() {
		TypedQuery<IMember> query = factory.getCurrentSession()
				.createQuery("SELECT NEW com.meetogether.eeit10936.pairs.model.MemberModel(mb,mh,mi) "
						+ "From MemberBean mb JOIN MemberHope mh ON mb.memberId = mh.memberId "
						+ "JOIN MemberInfo mi ON mb.memberId = mi.memberId", IMember.class);
		List<IMember> list = query.getResultList();
		return list;
	}
	@Override
	public IMember findMemberByChoice(Integer id,Integer sex,String city,Date stdate,Date eddate) {
		List<String> interList = new ArrayList<String>();
		String hql="SELECT NEW com.meetogether.eeit10936.pairs.model.MemberModel(mb,mh,mi) "
					+ "From MemberBean mb JOIN MemberHope mh ON mb.memberId = mh.memberId "
					+"JOIN MemberInfo mi ON mb.memberId = mi.memberId WHERE mb.memberId = ?0 ";
		if (sex != null)
			hql += "AND mb.memberSex = ?1 ";
		if (city != null)
			hql += "AND mb.memberCity = ?2 ";
		if (stdate != null)
			hql += "AND mb.memberBirth BETWEEN ?3 AND ?4";
		
		TypedQuery<IMember> query = factory.getCurrentSession()
									.createQuery(hql , IMember.class).setParameter(0, id);
		
		if(sex != null || city != null || stdate != null)
			query.setParameter(1, sex).setParameter(2, city).setParameter(3, stdate).setParameter(4, eddate);
		
		IMember member = query.getSingleResult();
		findInterestByMemberId(id).forEach((i) -> {
			interList.add(findInteretByInterestId(i));
		});
		member.setMemberInterestList(interList);
		return member;
	}
	
	

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> findByCity(String city) {

		TypedQuery<Integer> query = (TypedQuery<Integer>) factory.getCurrentSession()
				.createQuery("SELECT mb.memberId FROM MemberBasic mb WHERE mb.memberCity = ?1");
		query.setParameter(1, city);
		return query.getResultList();
	}

	@Override
	public void insertPairList(Integer currentUserId, Integer daterId, Integer status) {

		PairPK ppk = new PairPK(currentUserId, daterId);
		Pair pair = new Pair();
		pair.setPairPK(ppk);
		pair.setStatus(status);
		factory.getCurrentSession().persist(pair);

	}

	@Override
	public IMember lastDontLike(Integer currentUserId) {

		Query query = factory.getCurrentSession().createQuery(
				"SELECT p.pairPK.pairMemberId FROM Pair p WHERE p.pairPK.memberId = ?1 AND pairStatus='0' AND p.pairTime = (SELECT max(p2.pairTime) from Pair p2 where p2.pairPK.memberId = ?1)");
		query.setParameter(1, currentUserId);
		Integer pairMemberId = (Integer) query.getSingleResult();
		return findByMemberId(pairMemberId);
	}

	@Override
	public void deletePairList(Pair pair) {

		Pair p = factory.getCurrentSession().find(Pair.class, pair.getPairPK());
		factory.getCurrentSession().remove(p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> findInterestByMemberId(Integer currentUserId) {

		TypedQuery<Integer> query = (TypedQuery<Integer>) factory.getCurrentSession().createQuery(
				"SELECT m.memberInterestPK.interestId FROM MemberInterest m WHERE m.memberInterestPK.memberId = ?1");
		query.setParameter(1, currentUserId);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> findMemberByInterestId(Integer currentUserInterest) {

		TypedQuery<Integer> query = (TypedQuery<Integer>) factory.getCurrentSession().createQuery(
				"SELECT m.memberInterestPK.memberId FROM MemberInterest m WHERE m.memberInterestPK.interestId = ?1");
		query.setParameter(1, currentUserInterest);
		return query.getResultList();
	}

	@Override
	public String findInteretByInterestId(Integer interestId) {
		return factory.getCurrentSession().find(Interest.class, interestId).getInterest();
	}

	@Override
	public Blob getPhotosById(Integer id,int status) {
		
		 MemberAlbum result = factory.getCurrentSession()
				.createQuery("FROM MemberAlbum ma WHERE ma.pk.memberId = ?1 AND ma.deleteTag =?2 AND ma.status = ?3", MemberAlbum.class)
				.setParameter(1, id).setParameter(2, 0).setParameter(3, status).uniqueResult();
		
		return result.getPhoto();
	}

	@Override
	public boolean checkVip(Integer id) {
//		String hql = "From VipStatus v WHERE v.memberId = ?0 AND v.startTime >= ?1 AND v.endTime <= ?1";
		String hql = "From VipStatus v WHERE v.member.memberId = ?0 AND v.startTime <= ?1 AND v.endTime >= ?1 AND v.vipStatus = 1";
		VipStatus result = factory.getCurrentSession().createQuery(hql, VipStatus.class).setParameter(0, id)
				.setParameter(1, new Timestamp(System.currentTimeMillis())).uniqueResult();
		if (result != null) {
			return true;
		}
		return false;
	}

}
