package com.meetogether.eeit10927.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meetogether.eeit10927.dao.IMemberDao;
import com.meetogether.eeit10927.model.Member;
import com.meetogether.eeit10927.service.IMemberService;


@Service
public class MemberServiceImpl implements IMemberService {
	
	IMemberDao dao;
	
	@Autowired
	public void setDao(IMemberDao dao) {
		this.dao = dao;
	}
	
	public MemberServiceImpl() {
		
	}
	
	@Transactional
	@Override
	public boolean verifyAccount(Member member) {
		return dao.verifyAccount(member);
	}

	@Transactional
	@Override
	public int add(Member member) {
		return dao.add(member);
	}

	@Transactional
	@Override
	public void delete(Member member) {
		dao.delete(member);
	}

	@Transactional
	@Override
	public void update(Member member) {
		dao.update(member);
	}

	@Transactional
	@Override
	public boolean mEmailExist(Member member) {
		return dao.mEmailExist(member);
	}

	@Transactional
	@Override
	public Member findByEmail(Member member) {
		return dao.findByEmail(member);
	}

	@Transactional
	@Override
	public void renew(Member member) {
		dao.renew(member);
	}

	@Transactional
	@Override
	public Member getMemberById(int memberId) {
		return dao.getMemberById(memberId);
	}

	@Transactional
	@Override
	public void updateMemberImageFilename(Integer memberId, String filename) {
		dao.updateMemberImageFilename(memberId, filename);
	}

	@Override
	public List<Member> getAllMember() {
		return dao.getAllMember();
	}

}
