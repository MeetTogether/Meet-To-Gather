package com.meetogether.eeit10936.friends.service;

import java.util.List;
import java.util.Map;

import com.meetogether.eeit10936.friends.model.FriendList;

public interface IFriendService {

	List<FriendList> findFriendsById(Integer id);

	void addFriendList(Integer id, Integer f2);
	
	public Map<Integer, String> findFriendsByName(Integer id,String fName);
}
