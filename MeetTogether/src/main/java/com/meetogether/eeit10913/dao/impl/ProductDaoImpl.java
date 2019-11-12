package com.meetogether.eeit10913.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10908.model.CatBean;
import com.meetogether.eeit10913.dao.ProductDao;
import com.meetogether.eeit10913.model.ReviewBean;
import com.meetogether.eeit10927.model.Member;

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
		Session session = factory.getCurrentSession();
		ReviewBean rr = session.get(ReviewBean.class, reviewId);
		return rr;
	}

	@Override
	public void delete(Integer review) {
		Session session = factory.getCurrentSession();
		ReviewBean review1 = new ReviewBean();
		review1.setReviewId(review);
		session.delete(review);
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
	public void update(ReviewBean rev) {
//		String hql = "from eventReview WHERE reviewId = ?";
//		ReviewBean result = (ReviewBean) factory.getCurrentSession().createQuery(hql)
//				.setParameter(0, rev.getReviewId()).uniqueResult();
//
//		result.setEventComment(rev.getEventComment());
//		result.setEventStars(rev.getEventStars());
		Session session=factory.getCurrentSession();
		session.update(rev);
		
	}




}
