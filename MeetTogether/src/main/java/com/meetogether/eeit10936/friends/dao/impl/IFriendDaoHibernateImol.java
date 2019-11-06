package com.meetogether.eeit10936.friends.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10936.friends.dao.IFriendDao;
import com.meetogether.eeit10936.friends.model.FriendList;
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

}
