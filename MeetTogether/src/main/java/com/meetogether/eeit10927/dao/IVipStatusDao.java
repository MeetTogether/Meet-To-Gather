package com.meetogether.eeit10927.dao;

import com.meetogether.eeit10936.pairs.model.VipStatus;

public interface IVipStatusDao {

	String add(VipStatus vip);
	
	void vipUpgradeSuccess(String tradeNo);

}