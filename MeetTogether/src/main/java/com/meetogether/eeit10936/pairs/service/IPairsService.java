package com.meetogether.eeit10936.pairs.service;

import java.sql.Blob;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.meetogether.eeit10936.pairs.model.IMember;

public interface IPairsService {

	public IMember getMemberById(int id);

	public List<IMember> getAllMember();

	public Map<Integer, Integer> cityScore(String currentUserCity);

	public void likeOrDont(Integer currentUserId, Integer daterId, Integer status);

	public IMember back(Integer currentUserId);

	public Map<Integer, Integer> interestScore(Integer currentUserId);

	public Map<Integer, Integer> memberHopeScore(Integer currentUserId);

	public Map<Integer, Integer> finalscoreMap(String currentUserCity, Integer currentUserId);

	public List<Integer> sortByDESValue(Map<Integer, Integer> unsorted);

	public Blob getPhotosById(Integer id, int status);

	public boolean checkVip(Integer id);
	
	public IMember findMemberByChoice(Integer id,Integer sex,String city,Date stdate,Date eddate);

}
