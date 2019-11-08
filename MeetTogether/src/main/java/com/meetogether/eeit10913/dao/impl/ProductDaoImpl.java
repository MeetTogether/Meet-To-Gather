package com.meetogether.eeit10913.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10913.dao.ProductDao;
import com.meetogether.eeit10913.model.ReviewBean;

@Repository
public class ProductDaoImpl implements ProductDao {
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
 	
 	
	@Override
	public void add(ReviewBean review) {
		factory.getCurrentSession().save(review);
	}
	

	@Override
	public ReviewBean getReviewById(Integer reviewId) {
		return null;
	}

	@Override
	public void delete(ReviewBean review) {
		
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<ReviewBean> selectALL() {
		String hql = "FROM ReviewBean";
		Session session = null;
		List<ReviewBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}


	@Override
	public void update(ReviewBean review, ReviewBean reviewId) {
		// TODO Auto-generated method stub
		
	}


}
