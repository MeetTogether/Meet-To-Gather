package com.meetogether.eeit10936.pairs.dao.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.sql.rowset.serial.SerialBlob;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10936.pairs.dao.IMemberDao;
import com.meetogether.eeit10936.pairs.model.IMember;
import com.meetogether.eeit10936.pairs.model.Interest;
import com.meetogether.eeit10936.pairs.model.MemberHope;
import com.meetogether.eeit10936.pairs.model.MemberInfo;
import com.meetogether.eeit10936.pairs.model.MemberModel;
import com.meetogether.eeit10936.pairs.model.Pair;
import com.meetogether.eeit10936.pairs.model.PairPK;

@Repository("dao")
public class IMemberDaoHibernatempl implements IMemberDao {
	@Autowired
	private SessionFactory factory;

	@Override
	public IMember findByMemberId(Integer id) {
		IMember member = new MemberModel();
		List<String> al = new ArrayList<String>();
		member.setMemberBasic(factory.getCurrentSession().find(MemberBean.class, id));
		member.setMemberInfo(factory.getCurrentSession().find(MemberInfo.class, id));
		member.setMemberHope(factory.getCurrentSession().find(MemberHope.class, id));
		findInterestByMemberId(id).forEach((i) -> {
			al.add(findInteretByInterestId(i));
		});
		member.setMemberInterestList(al);
		return member;
	}

	@Override
	public List<IMember> findAllMember() {
		TypedQuery<IMember> query = factory.getCurrentSession()
				.createQuery("SELECT NEW com.meetogether.eeit10936.pairs.model.MemberModel(mb,mh,mi) "
						+ "From MemberBean mb JOIN MemberHope mh ON mb.memberId = mh.memberId "
						+ "JOIN MemberInfo mi ON mb.memberId = mi.memberId", IMember.class);
		List<IMember> list = query.getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> findByCity(String city) {

		TypedQuery<Integer> query = (TypedQuery<Integer>) factory.getCurrentSession()
				.createQuery("SELECT mb.memberId FROM MemberBasic mb WHERE mb.memberCity = ?1");
		query.setParameter(1, city);
		return query.getResultList();
	}

	@Override
	public void insertPairList(Integer currentUserId, Integer daterId, Integer status) {

		PairPK ppk = new PairPK(currentUserId, daterId);
		Pair pair = new Pair();
		pair.setPairPK(ppk);
		pair.setStatus(status);
		factory.getCurrentSession().persist(pair);

	}

	@Override
	public IMember lastDontLike(Integer currentUserId) {

		Query query = factory.getCurrentSession().createQuery(
				"SELECT p.pairPK.pairMemberId FROM Pair p WHERE p.pairPK.memberId = ?1 AND pairStatus='0' AND p.pairTime = (SELECT max(p2.pairTime) from Pair p2 where p2.pairPK.memberId = ?1)");
		query.setParameter(1, currentUserId);
		Integer pairMemberId = (Integer) query.getSingleResult();
		return findByMemberId(pairMemberId);
	}

	@Override
	public void deletePairList(Pair pair) {

		Pair p = factory.getCurrentSession().find(Pair.class, pair.getPairPK());
		factory.getCurrentSession().remove(p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> findInterestByMemberId(Integer currentUserId) {

		TypedQuery<Integer> query = (TypedQuery<Integer>) factory.getCurrentSession().createQuery(
				"SELECT m.memberInterestPK.interestId FROM MemberInterest m WHERE m.memberInterestPK.memberId = ?1");
		query.setParameter(1, currentUserId);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> findMemberByInterestId(Integer currentUserInterest) {

		TypedQuery<Integer> query = (TypedQuery<Integer>) factory.getCurrentSession().createQuery(
				"SELECT m.memberInterestPK.memberId FROM MemberInterest m WHERE m.memberInterestPK.interestId = ?1");
		query.setParameter(1, currentUserInterest);
		return query.getResultList();
	}

	@Override
	public String findInteretByInterestId(Integer interestId) {
		return factory.getCurrentSession().find(Interest.class, interestId).getInterest();
	}

//	@SuppressWarnings("unchecked")
//	@Override
//	public List<Blob> getPhotosById(IMember member) {
//		List<Blob> pal = new ArrayList<>();
//		Integer userId = member.getMemberBasic().getMemberId();
//		TypedQuery<MemberAlbum> query = (TypedQuery<MemberAlbum>) factory.getCurrentSession()
//				.createQuery("SELECT ma FROM MemberAlbum ma WHERE ma.pk.memberId = ?1 AND ma.deleteTag =?2");
//		query.setParameter(1, userId);
//		query.setParameter(2, 0);
//		List<MemberAlbum> filenames = query.getResultList();
//		if (member.getMemberBasic().getVipStatus() == 1) {
//			filenames.forEach((file) -> {
//				for (int i = 1; i < 6; i++) {
//					if (file.getStatus() == i) {
//						pal.add(imgToBlob(userId, file.getPk().getFileName()));
//					}
//				}
//			});
//		} else {
//			filenames.forEach((file) -> {
//				for (int i = 1; i < 4; i++) {
//					if (file.getStatus() == i) {
//						pal.add(imgToBlob(userId, file.getPk().getFileName()));
//					}
//				}
//			});
//		}
//
//		return pal;
//	}

	private Blob imgToBlob(int userId, String imgName) {
		File imgFile = new File("src/main/webapp/data/imgs/" + userId + imgName + ".png");
		System.out.println(imgFile.getAbsolutePath());
		long size = imgFile.length();
		byte[] b = new byte[(int) size];
		SerialBlob sb = null;
		try (FileInputStream fis = new FileInputStream(imgFile);) {
			fis.read(b);
			sb = new SerialBlob(b);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sb;

	}

}
