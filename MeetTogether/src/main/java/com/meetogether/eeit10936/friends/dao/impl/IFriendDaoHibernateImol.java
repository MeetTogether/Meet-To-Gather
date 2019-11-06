package com.meetogether.eeit10936.friends.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10936.friends.dao.IFriendDao;
import com.meetogether.eeit10936.friends.model.FriendList;
import com.meetogether.eeit10936.pairs.model.Pair;

@Repository
public class IFriendDaoHibernateImol implements IFriendDao {
	@Autowired
	private SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<FriendList> findFriendsById(Integer id) {
		String hql = "from FriendList f WHERE f.memberId = ?0 OR f.friendId = ?1";
		TypedQuery<FriendList> result = factory.getCurrentSession().createQuery(hql).setParameter(0, id).setParameter(1,
				id);
		return result.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public void addFriendList(Integer id, Integer f2) {

		String hql = "SELECT p.pairPk.pairMemberId FROM Pair p WHERE p.pairPk.memberId = ?0 AND p.status = '1'";
		TypedQuery<Integer> result = factory.getCurrentSession().createQuery(hql).setParameter(0, id).setParameter(1,
				id);
		List<Integer> f1Likes = result.getResultList();
		TypedQuery<Integer> result2 = factory.getCurrentSession().createQuery(hql).setParameter(0, f2).setParameter(1,
				f2);
		List<Integer> f2Likes = result2.getResultList();

		f1Likes.forEach((i) -> {
			f2Likes.forEach((j) -> {
				if (i == j) {
					FriendList fl = new FriendList();
					fl.setMemberId(id);
					fl.setFriendId(f2);
					fl.setFriendStatus(1);
					factory.getCurrentSession().persist(fl);
				}
			});
		});
	}

}
