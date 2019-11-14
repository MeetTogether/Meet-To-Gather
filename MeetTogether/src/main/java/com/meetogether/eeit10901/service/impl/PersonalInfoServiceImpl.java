package com.meetogether.eeit10901.service.impl;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.model.PersonalInfoBean;
import com.meetogether.eeit10901.service.PersonalInfoService;
import com.meetogether.eeit10936.pairs.model.MemberInfo;

@Service
public class PersonalInfoServiceImpl implements PersonalInfoService {
	@Autowired
	private PersonalInfoService personal;
	
	@Transactional
	@Override
	public void addPersonalInfo(MemberInfo personalinfo) {
	personal.addPersonalInfo(personalinfo);
	}
	@Transactional
	@Override
	public MemberBean getMemberById(Integer memberId) {
		
		return personal.getMemberById(memberId);
	}

}
