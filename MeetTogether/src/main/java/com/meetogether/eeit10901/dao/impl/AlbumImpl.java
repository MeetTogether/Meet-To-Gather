package com.meetogether.eeit10901.dao.impl;

import java.sql.Blob;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.dao.IAlbumDao;
import com.meetogether.eeit10901.model.PersonalInfoBean;
import com.meetogether.eeit10936.pairs.model.MemberAlbum;

@Repository
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
	public void addAlbum(MemberAlbum album) {
		album.setDeleteTag(0);
		factory.getCurrentSession().save(album);
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

	@Override
	public Blob getPhotosById(Integer id, int status) {
		 MemberAlbum result = factory.getCurrentSession()
					.createQuery("FROM MemberAlbum ma WHERE ma.pk.memberId = ?1 AND ma.deleteTag =?2 AND ma.status = ?3", MemberAlbum.class)
					.setParameter(1, id).setParameter(2, 0).setParameter(3, status).uniqueResult();
			
			return result.getPhoto();
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public int countMemberPhoto(Integer memberId) {
		String hql = "FROM MemberAlbum ma WHERE ma.pk.memberId = ?1";
		List<MemberAlbum> result = factory.getCurrentSession().createQuery(hql)
				.setParameter(1, memberId).getResultList();
		System.out.println("dao photo count: " + result.size());
		System.out.println("dao photo list: " + result);
		return result.size();
	}

}
