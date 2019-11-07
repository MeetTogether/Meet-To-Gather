package com.meetogether.eeit10913.dao;

import java.util.List;


import com.meetogether.eeit10913.model.ReviewBean;

public interface ProductDao {
	
	public ReviewBean getReviewById(Integer reviewId);

	public List<ReviewBean> selectALL();

	void update(ReviewBean review, ReviewBean reviewId);

	void add(ReviewBean review);
	
	void delete(ReviewBean review);
} 