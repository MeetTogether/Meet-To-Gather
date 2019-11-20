package com.meetogether.eeit10901.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.dao.IPersonalHopeDao;
import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10936.pairs.model.MemberHope;



@Repository
public class PersonalHopeImpl implements IPersonalHopeDao {
	
	@Autowired
	SessionFactory factory;

	@Override
	public MemberBean getMemberById(Integer mm) {
		Session session = factory.getCurrentSession();
		MemberBean result = session.get(MemberBean.class, mm);
		return result;
	}

	@Override
	public void addPersonalHope(MemberHope mm) {
		Session session = factory.getCurrentSession();
		MemberBean mb = getMemberById(mm.getMemberId());
		
		session.save(mm);
	}

	@Override
	public List<MemberHope> getMemberList() {
		String hql="form MemberBean";
		Session session = factory.getCurrentSession();
		 List<MemberHope> list = session.createQuery(hql).getResultList();
		return list;
	}

}
