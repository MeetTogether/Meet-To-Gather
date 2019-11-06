package com.meetogether.eeit10936.friends.dao;

import java.util.List;

import com.meetogether.eeit10936.friends.model.FriendList;

public interface IFriendDao {

	List<FriendList> findFriendsById(Integer id);

	void addFriendList(Integer id, Integer f2);

}
