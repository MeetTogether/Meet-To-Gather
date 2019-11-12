package com.meetogether.eeit10927.service;

import com.meetogether.eeit10936.pairs.model.VipStatus;

public interface IVipStatusService {

	String add(VipStatus vip);
	
	void vipUpgradeSuccess(String tradeNo);

}