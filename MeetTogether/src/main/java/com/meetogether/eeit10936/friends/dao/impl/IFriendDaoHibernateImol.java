package com.meetogether.eeit10936.friends.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
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

	@Override
	public void addFriendList(Integer id, Integer f2) {

		String hql = "FROM Pair p WHERE p.pairPk.memberId = ?0 AND p.pairPk.pairMemberId = ?1 AND p.status = '1'";
		Pair result = (Pair) factory.getCurrentSession().createQuery(hql).setParameter(0, f2).setParameter(1, id).uniqueResult();
		if (result != null) {
			FriendList fl = new FriendList();
			fl.setMemberId(id);
			fl.setFriendId(f2);
			fl.setFriendStatus(1);
			factory.getCurrentSession().persist(fl);
		}
	}

}
