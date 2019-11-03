package com.meetogether.eeit10927.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10927.dao.IMemberDao;
import com.meetogether.eeit10927.model.Member;


@Repository
public class MemberDaoHibernateImpl implements IMemberDao {

	private SessionFactory factory;
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public MemberDaoHibernateImpl() {
	}
	
	// ok 已確認需使用
	@Override
	public boolean mEmailExist(Member member) {
		String hql = "from Member m WHERE m.memberEmail = ?0";
		boolean exist = false;
		Member result = (Member) factory.getCurrentSession().createQuery(hql)
				.setParameter(0, member.getMemberEmail()).uniqueResult();
		if (result != null) {
			exist = true;
		}
		return exist;
	}

	// ok 已確認需使用
	@Override
	public boolean verifyAccount(Member member) {
		String hql = "from Member m WHERE m.memberEmail = ?0 and m.memberPassword = ?1";
		boolean check = false;
		try {
			Member result = (Member) factory.getCurrentSession().createQuery(hql)
					.setParameter(0, member.getMemberEmail())
					.setParameter(1, member.getMemberPassword()).uniqueResult();
			if (result != null) {
				check = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	
	// ok 已確認需使用
	@Override
	public Member getMemberById(int memberId) {
		Session session = factory.getCurrentSession();
		Member result = session.get(Member.class, memberId);
		return result;
	}

	// ok 已確認需使用
	@Override
	public Member findByEmail(Member member) {
		String hql = "from Member m WHERE m.memberEmail = ?0";
		return (Member) factory.getCurrentSession().createQuery(hql)
				.setParameter(0, member.getMemberEmail()).uniqueResult();
	}
	
	// ok 已確認需使用
	@Override
	public int add(Member member) {
		factory.getCurrentSession().save(member);
		int memberId = member.getMemberId();
		return memberId;
	}
	
	// ok 已確認需使用
	@Override
	public void updateMemberImageFilename(Integer memberId, String filename) {
		String hql = "from Member m WHERE m.memberId = ?0";
		Member result = (Member) factory.getCurrentSession().createQuery(hql)
				.setParameter(0, memberId).uniqueResult();
		result.setFileName(filename);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Member> getAllMember() {
		String hql = "from Member WHERE adminTag IS NULL";
		List<Member> result = (List<Member>) factory.getCurrentSession().createQuery(hql).getResultList();

		return result;
	}
	
	@Override
	public void update(Member member) {
		String hql = "from Member WHERE memberEmail = ?0";
		Member result = (Member) factory.getCurrentSession().createQuery(hql)
				.setParameter(0, member.getMemberEmail()).uniqueResult();

		result.setMemberName(member.getMemberName());
		result.setMemberPassword(member.getMemberPassword());
		result.setFileName(member.getFileName());
	}

	@Override
	public void delete(Member member) {
		String hql = "from Member WHERE memberId = ?0";
		Member result = (Member) factory.getCurrentSession().createQuery(hql)
				.setParameter(0, member.getMemberId()).uniqueResult();
		
		result.setDeleteTag("1");
	}
	
	@Override
	public void renew(Member member) {
		String hql = "from Member WHERE memberId = ?0";
		Member result = (Member) factory.getCurrentSession().createQuery(hql)
				.setParameter(0, member.getMemberId()).uniqueResult();
		
		result.setDeleteTag("");
		
	}

}
