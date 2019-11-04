package com.meetogether.eeit10901.service;

import java.util.List;

import com.meetogether.eeit10927.model.Member;


public interface IMemberService {
	public boolean verifyAccount(Member member);
	
	public Member getMemberById(int memberId);

	public int add(Member member);

	public void delete(Member member);

	public void update(Member member);

	public List<Member> getAllMember();

	public boolean mEmailExist(Member member);

	public Member findByEmail(Member member);
	
	public void renew(Member member);
	
	public void updateMemberImageFilename(Integer memberId, String filename);
}
