package com.meetogether.eeit10901.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meetogether.eeit10901.dao.IPersonalInterestDao;
import com.meetogether.eeit10901.service.IPersonalInterestService;
import com.meetogether.eeit10936.pairs.model.MemberInterest;

@Service
public class PersonalInterestServiceImpl implements IPersonalInterestService {

	@Autowired
	IPersonalInterestDao interestDao;
	
	@Transactional
	@Override
	public void addPersonalInfo(MemberInterest mi) {
		interestDao.addPersonalInfo(mi);
	}

}
