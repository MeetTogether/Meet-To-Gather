package com.meetogether.eeit10908.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10908.model.ActJoinBean;
import com.meetogether.eeit10908.model.CatBean;



@Repository
public class ActDaoImpl implements ActDao {

	SessionFactory factory;
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public ActDaoImpl() { 	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ActBean> getAllAct() {
		Session session = factory.getCurrentSession();
		String hql ="FROM ActBean";
		List<ActBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		
		return list;
	}

	@Override
	public void addActivity(ActBean activity) {
		System.out.println(activity.getEventCat());
		System.out.println(activity.getEventPlace());
		System.out.println(activity.getMemberId());
		Session session = factory.getCurrentSession();
		CatBean cb =getCatById(activity.getEventCat());
		activity.setCatbean(cb);
		session.save(activity);
	}

	@Override
	public CatBean getCatById(int catId) {
		CatBean cb = null;
		Session session = factory.getCurrentSession();
		cb = session.get(CatBean.class, catId);
		
		return cb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CatBean> getCatList() {
		String hql = "FROM eventCat";
		Session session = factory.getCurrentSession();
		List<CatBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public void deleteActivityByPrimaryKey(int key) {
		Session session = factory.getCurrentSession();
		ActBean activ = new ActBean();
		activ.setEventId(key);
		session.delete(activ);
		
	}

	@Override
	public void updateActivity(ActBean act) {
		Session session = factory.getCurrentSession();
		 String hql = "from ActBean WHERE eventId = ?0";
		ActBean result = (ActBean) session.createQuery(hql).setParameter(0, act.getEventId()).uniqueResult();
		System.out.println("actID :"+act.getEventId());
		
		
		result.setEventName(act.getEventName());
		result.setEventTime(act.getEventTime());
		result.setActContent(act.getActContent());
		result.setGroupNum(act.getGroupNum());
		result.setBudget(act.getBudget());
		result.setEventPlace(act.getEventPlace());
		result.setActPhoto(act.getActPhoto());
	
		CatBean cb=getCatById(act.getEventCat());
		
		result.setEventCat(cb.getEventCat());
		
		
		
//		session.update(act);
		
	}

	@Override
	public ActBean getActivityById(int actId) {
		Session session = factory.getCurrentSession();
		ActBean aa = session.get(ActBean.class, actId);	
		return aa;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ActBean> getActivityByCat(int catId) {
		String hql = "FROM ActBean A WHERE A.eventCat ="+catId;
		Session session = factory.getCurrentSession();
		List<ActBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public void updateActImageFilename(Integer actId, String filename) {
		String hql = "from ActBean WHERE eventId = ?0";
		ActBean result = (ActBean) factory.getCurrentSession().createQuery(hql).setParameter(0, actId).uniqueResult();
		result.setActFilename(filename);
		
	}

	@Override
	public void addActJoinx(ActJoinBean actJ) {	
		Session session = factory.getCurrentSession();

		session.save(actJ);
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ActJoinBean> CheckJoinPerson(Integer memberId){
		String hql="from ActJoinBean WHERE memberId = ?0";
		List<ActJoinBean> list = factory.getCurrentSession().createQuery(hql).setParameter(0, memberId).getResultList();
		return list;
	}
	
	
	
}
