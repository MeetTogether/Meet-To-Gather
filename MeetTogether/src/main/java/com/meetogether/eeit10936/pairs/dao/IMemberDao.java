package com.meetogether.eeit10936.pairs.dao;

import java.sql.Blob;
import java.sql.Date;
import java.util.List;

import com.meetogether.eeit10936.pairs.model.IMember;
import com.meetogether.eeit10936.pairs.model.Pair;

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

	public Blob getPhotosById(Integer id, int status);

	public boolean checkVip(Integer id);
	
	public IMember findMemberByChoice(Integer id,Integer sex,String city,Date stdate,Date eddate);

}
