package com.meetogether.eeit10901.service;

import java.util.List;

import com.meetogether.eeit10936.pairs.model.MemberAlbum;

public interface AlbumService {
	List<MemberAlbum>  getAllAlbum();
	void updateAlbum(Integer memberId);
	

	public MemberAlbum getMemberById(Integer memberId);
	void  addAlbum(MemberAlbum album);

	List<MemberAlbum>  getAlbumList();

	void deleteAlbum(Integer memberId);
}
