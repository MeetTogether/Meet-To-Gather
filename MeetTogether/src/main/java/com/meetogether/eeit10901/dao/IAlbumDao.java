package com.meetogether.eeit10901.dao;

import java.sql.Blob;
import java.util.List;

import com.meetogether.eeit10936.pairs.model.MemberAlbum;

public interface IAlbumDao {
	List<MemberAlbum>  getAllAlbum();
	void updateAlbum(Integer productId);
	

	public MemberAlbum getMemberById(Integer memberId);
	void  addAlbum(MemberAlbum product);

	List<MemberAlbum>  getCompanyList();

	void deleteAlbum(Integer memberId);
	public Blob getPhotosById(Integer id, int status);
	
	public int countMemberPhoto(Integer memberId);
}
