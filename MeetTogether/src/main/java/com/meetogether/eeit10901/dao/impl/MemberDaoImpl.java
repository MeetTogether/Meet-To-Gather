package com.meetogether.eeit10901.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.dao.MemberDao;
import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10927.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
 	
 	
	@Override
	public void add(MemberBean member) {
		System.out.println("member Birth: " + member.getMemberBirth());
		member.setAdminTag(0);
		member.setDeleteTag(0);
		factory.getCurrentSession().save(member);
		int memberId = member.getMemberId();
	}
	
	  
	@Override
	public void update(MemberBean m,MemberBean memberId) {
		String hql = "UPDATE MemberBean b SET b.member = :member WHERE memberId = :id";
		Session session = factory.getCurrentSession();

		int n = session.createQuery(hql).setParameter("member", m).setParameter("id", memberId)
				.executeUpdate();
		
	}

	@Override
	public void delete(MemberBean m) {
		// TODO Auto-generated method stub
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> selectALL() {
		String hql = "FROM MemberBean";
		Session session = null;
		List<MemberBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	
	@Override
	public MemberBean loging(MemberBean m) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public MemberBean getMemberById(Integer memberId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	 
 
	

	
	
}
