package com.meetogether.eeit10936.dao;

import java.sql.Blob;
import java.util.List;

import com.meetogether.eeit10936.model.IMember;
import com.meetogether.eeit10936.model.Pair;

public interface IMemberDao {
	public IMember findByMemberId(Integer id);

	public List<IMember> findAllMember();

	public List<Integer> findByCity(String city);

	public void insertPairList(Integer currentUserId, Integer daterId, Integer status);

	public IMember lastDontLike(Integer currentUserId);

	public void deletePairList(Pair pair);

	public List<Integer> findInterestByMemberId(Integer currentUserId);
	
	public List<Integer> findMemberByInterestId(Integer currentUserInterest);
	
	public String findInteretByInterestId(Integer interestId);

	public List<Blob> getPhotosById(IMember member);

}
