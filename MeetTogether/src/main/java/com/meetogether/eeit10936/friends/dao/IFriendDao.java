package com.meetogether.eeit10936.friends.dao;

import java.util.List;
import java.util.Map;

import com.meetogether.eeit10936.friends.model.FriendList;

public interface IFriendDao {

	List<FriendList> findFriendsById(Integer id);

	void addFriendList(Integer id, Integer f2);
	
	public Map<Integer, String> findFriendsByName(Integer id,String fName);

	void invite(Integer f1id, Integer f2id);

	void response(Integer f1id, Integer f2id,Integer status);

	boolean checkAddFriend(Integer f1id, Integer f2id);

	boolean checkFriendList(Integer f1id, Integer f2id);

	boolean checkResponse(Integer f1id, Integer f2id);

	void deleteFriends(Integer id, Integer fid);

	


}
