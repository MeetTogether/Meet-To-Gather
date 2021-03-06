package com.meetogether.eeit10901.dao;

import java.util.List;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10927.model.Member;

public interface MemberDao {

	public void delete(MemberBean m);

	public MemberBean loging(MemberBean m);

	public MemberBean getMemberById(Integer memberId);

	public List<MemberBean> selectALL();

	void update(MemberBean m, MemberBean memberId);

	void add(MemberBean member);

	public boolean verifyAccount(MemberBean member);

	public MemberBean findByEmail(MemberBean member);

}
