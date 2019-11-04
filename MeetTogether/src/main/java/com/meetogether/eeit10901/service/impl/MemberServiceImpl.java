package com.meetogether.eeit10901.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public void add(MemberBean member) {
		dao.add(member);
	}

	@Transactional
	@Override
	public void update(MemberBean m) {
		dao.update(m, m);
	}

	@Transactional
	@Override
	public void delete(MemberBean m) {
		// TODO Auto-generated method stub
		dao.update(m, m);
	}

	@Transactional
	@Override
	public MemberBean loging(MemberBean m) {
		// TODO Auto-generated method stub
		return dao.loging(m);
	}

	@Transactional
	@Override
	public MemberBean getMemberById(Integer memberId) {
		// TODO Auto-generated method stub
		return dao.getMemberById(memberId);
	}

	@Transactional
	@Override
	public List<MemberBean> selectALL() {
		return dao.selectALL();

	}

	@Override
	public boolean mEmailExist(MemberBean member) {
		// TODO Auto-generated method stub
		return false;
	}

}
