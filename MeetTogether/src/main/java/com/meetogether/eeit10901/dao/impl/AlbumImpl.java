package com.meetogether.eeit10901.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.meetogether.eeit10901.dao.IAlbumDao;
import com.meetogether.eeit10901.model.PersonalInfoBean;
import com.meetogether.eeit10936.pairs.model.MemberAlbum;


public class AlbumImpl implements IAlbumDao {
	@Autowired
	SessionFactory factory;
	
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

	@Override
	public void addAlbum(MemberAlbum product) {
	
	}

	@Override
	public List<MemberAlbum> getCompanyList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteAlbum(Integer memberId) {
		// TODO Auto-generated method stub

	}

}
