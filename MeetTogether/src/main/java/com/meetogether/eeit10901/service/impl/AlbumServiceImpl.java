package com.meetogether.eeit10901.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meetogether.eeit10901.dao.IAlbumDao;
import com.meetogether.eeit10901.dao.MemberDao;
import com.meetogether.eeit10901.service.AlbumService;

import com.meetogether.eeit10936.pairs.model.MemberAlbum;

@Service
public class AlbumServiceImpl implements AlbumService {
	@Autowired
	private IAlbumDao album;
	

	
	@Override
	public List<MemberAlbum> getAllAlbum() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateAlbum(Integer productId) {
		// TODO Auto-generated method stub

	}

	@Override
	public MemberAlbum getMemberById(Integer memberId) {
		// TODO Auto-generated method stub
		return null;
	}
@Transactional
	@Override
	public void addAlbum(MemberAlbum addalbum) {
		
		album.addAlbum(addalbum);
	}

	@Override
	public List<MemberAlbum> getAlbumList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteAlbum(Integer memberId) {
		// TODO Auto-generated method stub

	}

}
