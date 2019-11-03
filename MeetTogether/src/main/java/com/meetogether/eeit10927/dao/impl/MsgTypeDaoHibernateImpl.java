package com.meetogether.eeit10927.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10927.dao.IMsgTypeDao;
import com.meetogether.eeit10927.model.MsgType;

@Repository
public class MsgTypeDaoHibernateImpl implements IMsgTypeDao {
	
private SessionFactory factory;
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	public MsgTypeDaoHibernateImpl() {
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<MsgType> getMsgTypeList() {
		String hql = "FROM MsgType";
		List<MsgType> result = factory.getCurrentSession().createQuery(hql).getResultList();
		return result;
	}
	
	@Override
	public MsgType getMsgTypeById(int msgTypeId) {
		MsgType mt = null;
		Session session = factory.getCurrentSession();
		mt = session.get(MsgType.class, msgTypeId);
		return mt;
	}
	
	@Override
	public MsgType getMsgTypeByName(String msgTypeName) {
		String hql = "from MsgType WHERE typeName = ?0";
		MsgType result = (MsgType) factory.getCurrentSession().createQuery(hql).setParameter(0, msgTypeName).uniqueResult();
		return result;
	}

}
