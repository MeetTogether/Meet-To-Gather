package com.meetogether.eeit10908.dao.impl;

import java.util.List;

import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10908.model.ActJoinBean;
import com.meetogether.eeit10908.model.CatBean;


public interface ActDao {
	
	List<ActBean> getAllAct();
	
	
	void addActivity(ActBean activity);
	
	CatBean getCatById(int catId);
	
	List<CatBean> getCatList();
	
	void deleteActivityByPrimaryKey(int key);
	
	void updateActivity(ActBean act);
	
	void updateActivityNoimage(ActBean act);
	
	public ActBean getActivityById(int actId);
	
	public List<ActBean> getActivityByCat(int catId);
	
	public void updateActImageFilename(Integer actId, String filename);


	public void addActJoinx(ActJoinBean actJ);
	
	public List<ActJoinBean> CheckJoinPerson(Integer memberId);
	
	public void addActJoinPeoson(ActBean aBean);
	
	List<ActJoinBean> getAllActJoinPeople();
}
