package com.meetogether.eeit10908.service;

import java.util.List;

import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10908.model.CatBean;



public interface ActService {
	List<ActBean> getAllAct();
	
	void addActivity(ActBean activ);
	
	CatBean getCatById(int CatId);
	
	List<CatBean> getCatList();
	
	void deleteActivity(int key);
	
	void updateActivity(ActBean act);
	
	public ActBean getActivityById(int actId);
}
