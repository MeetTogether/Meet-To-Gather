package com.meetogether.eeit10936.friends.service.Impl;

import java.util.List;
import java.util.Map;

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
	@Transactional
	@Override
	public void addFriendList(Integer id, Integer f2) {
		dao.addFriendList(id, f2);
	}
	@Transactional
	@Override
	public Map<Integer, String> findFriendsByName(Integer id,String fName) {
		// TODO Auto-generated method stub
		return dao.findFriendsByName(id,fName);
	}
	@Transactional
	@Override
	public void invite(Integer f1id, Integer f2id) {
		// TODO Auto-generated method stub
		dao.invite(f1id, f2id);
		
	}
	
	@Transactional
	@Override
	public void response(Integer f1id, Integer f2id,Integer status) {
		// TODO Auto-generated method stub
		dao.response(f1id, f2id,status);
		
	}
	@Transactional
	@Override
	public boolean checkAddFriend(Integer f1id, Integer f2id) {
		// TODO Auto-generated method stub
		return dao.checkAddFriend(f1id, f2id);
	}
	@Transactional
	@Override
	public boolean checkFriendList(Integer f1id, Integer f2id) {
		// TODO Auto-generated method stub
		return dao.checkFriendList(f1id, f2id);
	}
	@Transactional
	@Override
	public boolean checkResponse(Integer f1id, Integer f2id) {
		// TODO Auto-generated method stub
		return dao.checkResponse(f1id, f2id);
	}
	@Transactional
	@Override
	public void deleteFriends(Integer id,Integer fid) {
		dao.deleteFriends(id, fid);
	}
	
	
	

}
