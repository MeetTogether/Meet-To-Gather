package com.meetogether.eeit10908.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.meetogether.eeit10908.dao.impl.ActDao;
import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10908.model.ActJoinBean;
import com.meetogether.eeit10908.model.CatBean;



@Transactional
@EnableTransactionManagement
@Service
public class ActServiceImpl implements ActService {

	
	ActDao custDao;
	
	
	
	@Autowired
	public void setCustDao(ActDao custDao) {
		this.custDao = custDao;
	}


	@Override
	public List<ActBean> getAllAct() {
		
		return custDao.getAllAct();
	}

	@Override
	public void addActivity(ActBean activ) {
		custDao.addActivity(activ);
		
	}

	@Override
	public CatBean getCatById(int CatId) {
		return custDao.getCatById(CatId);
	}

	@Override
	public List<CatBean> getCatList() {
		return custDao.getCatList();
	}

	@Override
	public void deleteActivity(int key) {
		custDao.deleteActivityByPrimaryKey(key);
		
	}

	@Override
	public void updateActivity(ActBean act) {
		custDao.updateActivity(act);
		
	}

	@Override
	public ActBean getActivityById(int actId) {
		return custDao.getActivityById(actId);
		
	}


	@Override
	public List<ActBean> getActivityByCat(int catId) {
		return custDao.getActivityByCat(catId);
	}


	@Override
	public void updateActImageFilename(Integer actId, String filename) {
		custDao.updateActImageFilename(actId, filename);
		
	}


	@Override
	public void addActJoin(ActJoinBean actJ) {
		custDao.addActJoinx(actJ);
		
	}


	@Override
	public List<ActJoinBean> CheckJoinPersons(Integer memberId) {
			
		return custDao.CheckJoinPerson(memberId);
	}


	@Override
	public void updatenoImageActivity(ActBean act) {
		custDao.updateActivityNoimage(act);
		
	}


	@Override
	public void addJoinPerson(ActBean aBean) {
		custDao.addActJoinPeoson(aBean);
		
	}


	@Override
	public List<ActJoinBean> getAllActJoinPeople() {
		return custDao.getAllActJoinPeople();
	}

}
