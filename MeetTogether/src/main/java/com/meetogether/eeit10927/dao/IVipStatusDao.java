package com.meetogether.eeit10927.dao;

import java.sql.Timestamp;

import com.meetogether.eeit10936.pairs.model.VipStatus;

public interface IVipStatusDao {

	String add(VipStatus vip);
	
	void vipUpgradeSuccess(String tradeNo);
	
	Timestamp vipEndTime(Integer userId);
}