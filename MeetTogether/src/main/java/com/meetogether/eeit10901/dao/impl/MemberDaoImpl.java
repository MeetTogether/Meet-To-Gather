package com.meetogether.eeit10901.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.dao.MemberDao;
import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10936.pairs.model.MemberAlbum;
import com.meetogether.eeit10936.pairs.model.MemberAlbumPk;

@Repository
public class MemberDaoImpl implements MemberDao {
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public MemberBean findByEmail(MemberBean member) {

		String hql = "from MemberBean m WHERE m.memberEmail = ?0";
		return (MemberBean) factory.getCurrentSession().createQuery(hql).setParameter(0, member.getMemberEmail())
				.uniqueResult();

	}

	@Override
	public boolean verifyAccount(MemberBean member) {
		String hql = "from MemberBean m WHERE m.memberEmail = ?0 and m.memberPassword = ?1";
		boolean check = false;
		try {
			MemberBean result = (MemberBean) factory.getCurrentSession().createQuery(hql)
					.setParameter(0, member.getMemberEmail()).setParameter(1, member.getMemberPassword())
					.uniqueResult();
			if (result != null) {
				check = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public int add(MemberBean member) {
		System.out.println("member Birth: " + member.getMemberBirth());
		member.setAdminTag(0);
		member.setDeleteTag(0);
		factory.getCurrentSession().save(member);
		int memberId = member.getMemberId();
		System.out.println("dao add memberId: " + memberId);		
		return memberId;
	}
	@Override
	public void addAlbum(Integer memberId) {
		System.out.println("dao memberId: " + memberId);
		MemberBean member = getMemberById(memberId);
		System.out.println("dao memberName: " + member.getMemberName());
		MemberAlbumPk mpk=new MemberAlbumPk();
		mpk.setMemberId(member.getMemberId());
		mpk.setFileName(member.getFileName());
		MemberAlbum ma = new MemberAlbum(mpk);
		ma.setPhoto(member.getPhoto());
		ma.setDeleteTag(0);
		ma.setStatus(1);
		factory.getCurrentSession().save(ma);
	}
	
	@Override
	public void synchAlbum(Integer memberId) {
		MemberBean member = getMemberById(memberId);
		MemberAlbumPk mpk=new MemberAlbumPk();
		mpk.setMemberId(member.getMemberId());
		mpk.setFileName("headShot");
		MemberAlbum ma = new MemberAlbum(mpk);
		ma.setPhoto(member.getPhoto());
		ma.setDeleteTag(0);
		ma.setStatus(1);
		
		factory.getCurrentSession().persist(ma);
		
	}

	@Override

		public void update(MemberBean m) {
			 Session session = factory.getCurrentSession();
			 String hql = "from MemberBean WHERE memberId = ?0";
			 MemberBean result = (MemberBean) session.createQuery(hql).setParameter(0, m.getMemberId()).uniqueResult();
			 result.setMemberPassword(m.getMemberPassword());
			 result.setMemberEmail(m.getMemberEmail());
			 result.setMemberName(m.getMemberName());
			 result.setMemberBirth(m.getMemberBirth());
			 result.setMemberCity(m.getMemberCity());
			 result.setMemberSex(m.getMemberSex());
//			 session.update(m);
		
			 
//			 System.out.println("password"+m.getMemberPassword());
//			 System.out.println("eMAIL"+m.getMemberEmail());
//			 System.out.println("生日"+m.getMemberBirth());
//			 System.out.println("縣市"+m.getMemberCity());
			 
			 
	}

	@Override
	public void delete(MemberBean m) {
		// TODO Auto-generated method stub

	}
	// 註解

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
	public boolean mEmailExist(MemberBean member) {
		String hql = "from MemberBean m WHERE m.memberEmail = ?0";
		boolean exist = false;
		MemberBean result = (MemberBean) factory.getCurrentSession().createQuery(hql)
				.setParameter(0, member.getMemberEmail()).uniqueResult();
		if (result != null) {
			exist = true;
		}
		return exist;
	}

	@Override
	public MemberBean getMemberById(Integer memberId) {
		Session session = factory.getCurrentSession();
		MemberBean result = session.get(MemberBean.class, memberId);
		return result;

	}

	public Integer updeatVerifyMail(Integer memberId) {
		String hql = "update MemberBean set verifyMail= 1 where memberId =?0";
		Integer result = factory.getCurrentSession().createQuery(hql).setParameter(0, memberId).executeUpdate();
		return result;
	}

	public Session getSession() {
		return factory.getCurrentSession();
	}
}
