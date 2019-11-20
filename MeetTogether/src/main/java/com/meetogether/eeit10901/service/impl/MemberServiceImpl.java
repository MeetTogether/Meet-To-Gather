package com.meetogether.eeit10901.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.meetogether.eeit10901.dao.MemberDao;
import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	MemberDao dao;

	@Autowired
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	@Transactional
	@Override
	public int add(MemberBean member) {
		return dao.add(member);
	}

	@Transactional
	@Override
	public void update(MemberBean m) {
		dao.update(m);
	}
	@Transactional
	@Override
	public void delete(MemberBean m) {
	}



	@Transactional
	@Override
	public MemberBean getMemberById(Integer memberId) {
		return dao.getMemberById(memberId);
	}

	@Transactional
	@Override
	public List<MemberBean> selectALL() {
		return dao.selectALL();

	}
	@Transactional
	@Override
	public boolean mEmailExist(MemberBean member) {
		return dao.mEmailExist(member);
	}
	@Transactional
	@Override
	public boolean verifyAccount(MemberBean member) {
		return dao.verifyAccount(member);
	}
	@Transactional
	@Override
	public MemberBean findByEmail(MemberBean member) {
		return dao.findByEmail(member);
	}
	@Transactional
	@Override
	public Integer updeatVerifyMail(Integer memberId) {
		return dao.updeatVerifyMail(memberId);
	}
	
	@Transactional
	@Override
	public void synchAlbum(Integer memberId) {
		// TODO Auto-generated method stub
		dao.synchAlbum(memberId);
		
	}

	@Transactional
	@Override
	public void addAlbum(Integer memberId) {
		dao.addAlbum(memberId);
	}
	


}
