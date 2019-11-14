package com.meetogether.eeit10901.service;

import java.util.List;

import org.springframework.ui.Model;

import com.meetogether.eeit10901.model.MemberBean;

public interface MemberService {

	public int add(MemberBean member);

	public void update(MemberBean m);

	public void delete(MemberBean m);

	public List<MemberBean> selectALL();

	public boolean mEmailExist(MemberBean member);

	public boolean verifyAccount(MemberBean member);

	public MemberBean findByEmail(MemberBean member);

	public MemberBean getMemberById(Integer memberId);

	Integer updeatVerifyMail(Integer memberId);

}
