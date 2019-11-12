package com.meetogether.eeit10913.service;

import java.util.List;

import com.meetogether.eeit10913.model.ReviewBean;

public interface ProductService {
	public void add(ReviewBean review);

	void update(ReviewBean rev);

	public void delete(Integer review);
	
	public List<ReviewBean> selectALL();
	
	public ReviewBean getReviewById(Integer reviewId);

}
