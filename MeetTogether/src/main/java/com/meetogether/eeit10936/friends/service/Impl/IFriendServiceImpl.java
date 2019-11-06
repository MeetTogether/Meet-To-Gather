package com.meetogether.eeit10936.friends.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meetogether.eeit10936.friends.dao.IFriendDao;
import com.meetogether.eeit10936.friends.model.FriendList;
import com.meetogether.eeit10936.friends.service.IFriendService;

@Service
public class IFriendServiceImpl implements IFriendService {
	@Autowired
	private IFriendDao dao;

	@Transactional
	@Override
	public List<FriendList> findFriendsById(Integer id) {
		return dao.findFriendsById(id);
	}

	@Override
	public void addFriendList(Integer id, Integer f2) {
		dao.addFriendList(id, f2);
	}

}
