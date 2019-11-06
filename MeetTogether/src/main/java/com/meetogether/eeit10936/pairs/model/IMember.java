package com.meetogether.eeit10936.pairs.model;

import java.sql.Blob;
import java.util.List;

import com.meetogether.eeit10901.model.MemberBean;

public interface IMember {

	public MemberInfo getMemberInfo();

	public void setMemberInfo(MemberInfo mi);

	public MemberHope getMemberHope();

	public void setMemberHope(MemberHope mh);

	public MemberBean getMemberBasic();

	public void setMemberBasic(MemberBean mb);

	public List<String> getMemberInterestList();

	public void setMemberInterestList(List<String> mil);
	
	public List<Blob> getPhotos();

	public void getPhotos(List<Blob> photoList);

}
