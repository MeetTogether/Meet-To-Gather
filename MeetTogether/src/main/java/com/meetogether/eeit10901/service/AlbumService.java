package com.meetogether.eeit10901.service;

import java.util.List;

import com.meetogether.eeit10936.pairs.model.MemberAlbum;

public interface AlbumService {
	List<MemberAlbum>  getAllAlbum();
	void updateAlbum(Integer productId);
	

	public MemberAlbum getMemberById(Integer memberId);
	void  addAlbum(MemberAlbum product);

	List<MemberAlbum>  getCompanyList();
	// ==================== Product CRUD ===================	
	void deleteAlbum(Integer memberId);
}
