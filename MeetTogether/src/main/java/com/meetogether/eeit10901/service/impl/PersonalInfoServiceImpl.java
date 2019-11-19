package com.meetogether.eeit10901.service.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meetogether.eeit10901.dao.IPersonalInfoDao;
import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.model.PersonalInfoBean;
import com.meetogether.eeit10901.service.PersonalInfoService;
import com.meetogether.eeit10908.dao.impl.ActDao;
import com.meetogether.eeit10936.pairs.model.MemberInfo;

@Service
public class PersonalInfoServiceImpl implements PersonalInfoService {
	@Autowired
	private IPersonalInfoDao infoDao;
	
	@Autowired
	public void setInfoDao(IPersonalInfoDao infoDao) {
		this.infoDao = infoDao;
	}
	
	@Transactional
	@Override
	public MemberBean getMemberById(Integer memberId) {
		
		return infoDao.getMemberById(memberId);
	}
	
	@Transactional
	@Override
	public List<MemberInfo> addPersonalInfo(MemberInfo personalinfo) {
		infoDao.addPersonalInfo(personalinfo);
		return null;
	}
	@Transactional
	@Override
	public List<MemberInfo> getAllInfo() {
		
		return infoDao.getAllInfo();
	}

}
