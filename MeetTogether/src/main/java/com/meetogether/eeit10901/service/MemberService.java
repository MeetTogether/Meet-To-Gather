package com.meetogether.eeit10901.service;

import java.util.List;

import com.meetogether.eeit10901.model.MemberBean;

public interface MemberService {

	public void add(MemberBean member);

	public void update(MemberBean m);

	public void delete(MemberBean m);

	public MemberBean loging(MemberBean m);

	public MemberBean getMemberById(Integer memberId);

	public List<MemberBean> selectALL();

	public boolean mEmailExist(MemberBean member);

}
