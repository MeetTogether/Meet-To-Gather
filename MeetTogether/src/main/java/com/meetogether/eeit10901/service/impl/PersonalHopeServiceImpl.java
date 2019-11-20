package com.meetogether.eeit10901.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meetogether.eeit10901.dao.IPersonalHopeDao;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.service.IPersonalHopeService;
import com.meetogether.eeit10936.pairs.model.MemberHope;

@Service
public class PersonalHopeServiceImpl implements IPersonalHopeService {

	@Autowired
	private IPersonalHopeDao hopeDao;
	

	@Autowired
	public void setHopeDao(IPersonalHopeDao hopeDao) {
		this.hopeDao = hopeDao;
	}
	
	@Transactional
	@Override
	public MemberBean getMemberById(Integer memberId) {
		return hopeDao.getMemberById(memberId);
	}
	@Transactional
	@Override
	public void addPersonalHope(MemberHope mm) {
		hopeDao.addPersonalHope(mm);

	}
	@Transactional
	@Override
	public List<MemberHope> getHopeList() {
		
		return hopeDao.getMemberList();
	}

}
