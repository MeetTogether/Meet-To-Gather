package com.meetogether.eeit10913.service;

import java.sql.Blob;
import java.util.List;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10913.model.ReviewBean;

public interface ProductService {
	public int add(ReviewBean review);

	void update(ReviewBean rev);

	public void delete(Integer review);
	
	public List<ReviewBean> selectALL();
	
	public ReviewBean getReviewById(Integer reviewId);

	MemberBean getMemberById(int memberId);

	Blob getphotoById(Integer id);

	ActBean getActivityById(int actId);

	public List<ReviewBean> selectALLByEventId(Integer eventId);

}
