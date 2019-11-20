package com.meetogether.eeit10913.dao.impl;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10913.dao.ProductDao;
import com.meetogether.eeit10913.model.ReviewBean;
import com.meetogether.eeit10913.service.ProductService;
import com.meetogether.eeit10927.service.IMessageService;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	@Autowired
	IMessageService msgService;
	@Autowired
	ProductService pService;
 	
	@Override
	public int add(ReviewBean review) {
//		factory.getCurrentSession().save(review);
		Session session = factory.getCurrentSession();
		System.out.println("review=============================="+review);
		MemberBean mb = msgService.getMemberById(review.getMbId());
		ActBean actBean = pService.getActivityById(review.getEventId());
//		MemberBean mb = getMemberById(review.getMember().getMemberId());
//		System.out.println("=============================="+review.getMember().getMemberId());
		review.setMember(mb);
		review.setEvent(actBean);
		session.save(review);
		return review.getEventId();
	}
	

	@Override
	public ReviewBean getReviewById(Integer reviewId) {
		Session session = factory.getCurrentSession();
		ReviewBean rr = session.get(ReviewBean.class, reviewId);
		
		System.out.println("memberID 是誰 :" + rr.getMbId());
		System.out.println("member物件ID 是誰 :" + rr.getMember().getMemberId());

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
		Session session=factory.getCurrentSession();
		session.update(rev);
		
	}
	
	@Override
	public MemberBean getMemberById(int memberId) {
		Session session = factory.getCurrentSession();
		MemberBean result = session.get(MemberBean.class, memberId);
		return result;
	}
	
	@Override
	public Blob getphotoById(Integer id) {
	Session session = factory.getCurrentSession();
	Blob b=(Blob) session.createQuery("SELECT mb.photo FROM MemberBean mb WHERE mb.memberId = ?1")
	.setParameter(1, id).uniqueResult();
	return b;
	}
	
	@Override
	public ActBean getActivityById(int actId) {
		Session session = factory.getCurrentSession();
		ActBean aa = session.get(ActBean.class, actId);	
		return aa;
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public List<ReviewBean> selectALLByEventId(Integer eventId) {
		System.out.println("eventId================="+eventId);
		String hql = "FROM ReviewBean where eventId = eventId";
		Session session = null;
		List<ReviewBean> list = new ArrayList<>();

		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		
		return list;
	}




}
