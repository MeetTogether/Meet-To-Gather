package com.meetogether.eeit10913.dao;

import java.sql.Blob;
import java.util.List;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10913.model.ReviewBean;

public interface ProductDao {
	
	public ReviewBean getReviewById(Integer reviewId);

	public List<ReviewBean> selectALL();

	int add(ReviewBean review);
	
	void delete(Integer review);

	void update(ReviewBean rev);

	MemberBean getMemberById(int memberId);

	Blob getphotoById(Integer id);

	ActBean getActivityById(int actId);

	public List<ReviewBean> selectALLByEventId(Integer eventId);
} 