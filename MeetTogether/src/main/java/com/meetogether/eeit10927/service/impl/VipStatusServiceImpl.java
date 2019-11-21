package com.meetogether.eeit10927.service.impl;

import java.sql.Timestamp;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meetogether.eeit10927.dao.IVipStatusDao;
import com.meetogether.eeit10927.service.IVipStatusService;
import com.meetogether.eeit10936.pairs.model.VipStatus;

@Service
public class VipStatusServiceImpl implements IVipStatusService {
	
	private IVipStatusDao vipDao;
	@Autowired
	public void setVipDao(IVipStatusDao vipDao) {
		this.vipDao = vipDao;
	}

	@Transactional
	@Override
	public String add(VipStatus vip) {
		return vipDao.add(vip);
	}

	@Transactional
	@Override
	public void vipUpgradeSuccess(String tradeNo) {
		vipDao.vipUpgradeSuccess(tradeNo);
	}

	@Transactional
	@Override
	public Timestamp vipEndTime(Integer userId) {
		return vipDao.vipEndTime(userId);
	}

}
