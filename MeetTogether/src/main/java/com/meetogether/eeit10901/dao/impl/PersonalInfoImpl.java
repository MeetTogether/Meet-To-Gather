package com.meetogether.eeit10901.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.dao.IPersonalInfoDao;
import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.model.PersonalInfoBean;
import com.meetogether.eeit10936.pairs.model.MemberInfo;
import com.meetogether.eeit10936.pairs.model.MemberInterest;

@Repository
public class PersonalInfoImpl implements IPersonalInfoDao {
	@Autowired
	SessionFactory factory;
	
	
	@Override
	public
	void addPersonalInfo(MemberInfo mm) {
		Session session = factory.getCurrentSession();
		MemberBean mb = getMemberById(mm.getMemberId());
		
		session.save(mm);
		
	}


	@Override
	public MemberBean getMemberById(Integer memberId) {
		Session session = factory.getCurrentSession();
		MemberBean result = session.get(MemberBean.class, memberId);
		return result;
	}





	@Override
	public List<MemberInfo> getMemberList() {
		String hql="form MemberBean";
		Session session = factory.getCurrentSession();
		 List<MemberInfo> list = session.createQuery(hql).getResultList();
		return list;
		
	}


}
