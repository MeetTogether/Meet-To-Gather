package com.meetogether.eeit10936.model;

import java.sql.Blob;
import java.util.List;

public interface IMember {

	public MemberInfo getMemberInfo();

	public void setMemberInfo(MemberInfo mi);

	public MemberHope getMemberHope();

	public void setMemberHope(MemberHope mh);

	public MemberBasic getMemberBasic();

	public void setMemberBasic(MemberBasic mb);

	public List<String> getMemberInterestList();

	public void setMemberInterestList(List<String> mil);
	
	public List<Blob> getPhotos();

	public void getPhotos(List<Blob> photoList);

}
