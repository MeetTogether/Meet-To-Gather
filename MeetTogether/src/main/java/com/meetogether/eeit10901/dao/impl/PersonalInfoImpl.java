package com.meetogether.eeit10901.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.dao.IPersonalInfoDao;
import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.model.PersonalInfoBean;





@Repository
public class PersonalInfoImpl implements IPersonalInfoDao {
	@Autowired
	SessionFactory factory;
	
	
	@Override
	public void addPersonalInfo(PersonalInfoBean personalinfo) {
		Session session = factory.getCurrentSession();
		MemberBean mb = getMemberById(personalinfo.getMemberBean().getMemberId());
		personalinfo.setMemberBean(mb);
		session.save(personalinfo);
	}


	@Override
	public MemberBean getMemberById(Integer memberId) {
		Session session = factory.getCurrentSession();
		MemberBean result = session.get(MemberBean.class, memberId);
		return result;
	}


}
