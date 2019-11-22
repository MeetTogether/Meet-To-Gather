package com.meetogether.eeit10901.service;

import java.sql.Blob;
import java.util.List;

import com.meetogether.eeit10936.pairs.model.MemberAlbum;

public interface AlbumService {
	List<MemberAlbum>  getAllAlbum();
	void updateAlbum(Integer memberId);
	

	public MemberAlbum getMemberById(Integer memberId);
	void  addAlbum(MemberAlbum album);

	List<MemberAlbum>  getAlbumList();
	public Blob getPhotosById(Integer id, int status);
	void deleteAlbum(Integer memberId);
	
	public int countMemberPhoto(Integer memberId);
}
