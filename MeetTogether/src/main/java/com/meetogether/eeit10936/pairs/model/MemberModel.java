package com.meetogether.eeit10936.pairs.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.List;

import com.meetogether.eeit10901.model.MemberBean;

public class MemberModel implements IMember, Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private MemberBean mb;
	private MemberHope mh;
	private MemberInfo mi;
	private List<String> mil;
	private List<Blob> photoList;

	public MemberModel() {

	}

	public MemberModel(MemberBean mb, MemberHope mh, MemberInfo mi) {
		this.mb = mb;
		this.mh = mh;
		this.mi = mi;
	}

	@Override
	public MemberInfo getMemberInfo() {
		// TODO Auto-generated method stub
		return mi;
	}

	@Override
	public void setMemberInfo(MemberInfo mi) {
		// TODO Auto-generated method stub
		this.mi = mi;

	}

	@Override
	public MemberHope getMemberHope() {
		// TODO Auto-generated method stub
		return mh;
	}

	@Override
	public void setMemberHope(MemberHope mh) {
		// TODO Auto-generated method stub
		this.mh = mh;

	}

	@Override
	public MemberBean getMemberBasic() {
		// TODO Auto-generated method stub
		return mb;
	}

	@Override
	public void setMemberBasic(MemberBean mb) {
		// TODO Auto-generated method stub
		this.mb = mb;

	}

	@Override
	public List<String> getMemberInterestList() {
		// TODO Auto-generated method stub
		return mil;
	}

	@Override
	public void setMemberInterestList(List<String> mil) {
		// TODO Auto-generated method stub
		this.mil = mil;
	}

	@Override
	public List<Blob> getPhotos() {
		// TODO Auto-generated method stub
		return photoList;
	}

	@Override
	public void getPhotos(List<Blob> photoList) {
		// TODO Auto-generated method stub
		this.photoList = photoList;

	}

}
