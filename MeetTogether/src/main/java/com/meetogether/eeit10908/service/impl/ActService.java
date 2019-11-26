package com.meetogether.eeit10908.service.impl;

import java.util.List;

import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10908.model.ActJoinBean;
import com.meetogether.eeit10908.model.CatBean;


public interface ActService {
	List<ActBean> getAllAct();
	
	void addActivity(ActBean activ);
	
	CatBean getCatById(int CatId);
	
	List<CatBean> getCatList();
	
	void deleteActivity(int key);
	
	void updateActivity(ActBean act);
	
	void updatenoImageActivity(ActBean act);
	
	public ActBean getActivityById(int actId);
	
	public List<ActBean> getActivityByCat(int catId);
	
	public void updateActImageFilename(Integer actId, String filename);

    public void addActJoin(ActJoinBean actJ);
    
    public List<ActJoinBean> CheckJoinPersons(Integer memberId);
    
    public void addJoinPerson(ActBean abean);
    
    List<ActJoinBean> getAllActJoinPeople();
}
