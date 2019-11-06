package com.meetogether.eeit10936.friends.service;

import java.util.List;

import com.meetogether.eeit10936.friends.model.FriendList;

public interface IFriendService {

	List<FriendList> findFriendsById(Integer id);

	void addFriendList(Integer id, Integer f2);
}
