package com.meetogether.eeit10901.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.dao.IPersonalInterestDao;
import com.meetogether.eeit10936.pairs.model.MemberInterest;

@Repository
public class PersonalInterestImpl implements IPersonalInterestDao {
	@Autowired
	SessionFactory factory;
	
	
	@Override
	public
	void addPersonalInfo(MemberInterest mi) {
		Session session = factory.getCurrentSession();
		session.save(mi);
		
	}



}
