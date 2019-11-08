package com.meetogether.eeit10913.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.meetogether.eeit10913.dao.ProductDao;
import com.meetogether.eeit10913.model.ReviewBean;

public class ProductServiceImpl implements ProductService {
	ProductDao dao;
	
	@Autowired
	public void setDao(ProductDao dao) {
		this.dao = dao;
	}
	
	@Transactional
	@Override
	public void add(ReviewBean review) {
		dao.add(review);
		
	}
	
	@Transactional
	@Override
	public void update(ReviewBean m) {
		dao.update(m, m);	
	}
	@Transactional
	@Override
	public void delete(ReviewBean m) {
		dao.update(m, m);
	}
	
	@Transactional
	@Override
	public ReviewBean getReviewById(Integer reviewId) {
		return dao.getReviewById(reviewId);
	}
	@Transactional
	@Override
	public List<ReviewBean> selectALL() {
		return dao.selectALL();
	}

}
