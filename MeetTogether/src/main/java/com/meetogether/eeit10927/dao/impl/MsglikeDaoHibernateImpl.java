package com.meetogether.eeit10927.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.dao.MemberDao;
import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10927.dao.IMessageDao;
import com.meetogether.eeit10927.dao.IMsglikeDao;
import com.meetogether.eeit10927.model.Message;
import com.meetogether.eeit10927.model.Msglike;

@Repository
public class MsglikeDaoHibernateImpl implements IMsglikeDao {

	private SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	private IMessageDao msgDao;
	@Autowired
	public void setMsgDao(IMessageDao msgDao) {
		this.msgDao = msgDao;
	}

	private MemberDao mDao;
	@Autowired
	public void setMDao(MemberDao mDao) {
		this.mDao = mDao;
	}

	public MsglikeDaoHibernateImpl() {
	}

	// ok 已確認需使用
	@Override
	public void addMsglike(Msglike mlike) {
		Session session = factory.getCurrentSession();
		Message msg = msgDao.getMsgByMsgId(mlike.getMessageId());
		MemberBean member = msgDao.getMemberById(mlike.getMemberId());

		String hql = "from Msglike WHERE msgId = ?0 AND mId = ?1";
		Msglike result = (Msglike) factory.getCurrentSession().createQuery(hql).setParameter(0, mlike.getMessageId())
				.setParameter(1, mlike.getMemberId()).uniqueResult();
		if (result == null) {
			mlike.setMessage(msg);
			mlike.setMember(member);
			session.save(mlike);
		} else {
			result.setDeleteTag("0");
		}
		msg.setLikeCount(msg.getLikeCount() + 1);
		msgDao.updatelikeCnt(msg);
	}

	// ok 已確認需使用
	@Override
	public void deleteMsglike(Msglike mlike) {
		String hql = "from Msglike WHERE msgId = ?0 AND mId = ?1";
		Msglike result = (Msglike) factory.getCurrentSession().createQuery(hql).setParameter(0, mlike.getMessageId())
				.setParameter(1, mlike.getMemberId()).uniqueResult();
		result.setDeleteTag("1");
		Message msg = msgDao.getMsgByMsgId(mlike.getMessageId());
		msg.setLikeCount(msg.getLikeCount() - 1);
		msgDao.updatelikeCnt(msg);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Msglike> getAllMsgLike(Msglike mlike) {
		String hql = "from Msglike WHERE msgId = ?0 AND deleteTag = 0 ORDER BY createTime DESC";
		return (List<Msglike>) factory.getCurrentSession().createQuery(hql).setParameter(0, mlike.getMessageId())
				.getResultList();
	}

	// ok 已確認需使用
	@Override
	public String findMsglikeByMsgAndMember(Msglike mlike) {
		String hql = "from Msglike WHERE msgId = ?0 AND mId = ?1 and deleteTag = 'False'";
		Msglike result = (Msglike) factory.getCurrentSession().createQuery(hql).setParameter(0, mlike.getMessageId())
				.setParameter(1, mlike.getMemberId()).uniqueResult();
		if (result != null) {
			return result.getDeleteTag();
		} else {
			return "N/A";
		}
	}

	// ok 已確認需使用
	@SuppressWarnings("unchecked")
	@Override
	public List<Msglike> findMsglikeByMember(Integer memberId) {
		String hql = "from Msglike WHERE mId = ?0 AND deleteTag = 0";
		List<Msglike> list = factory.getCurrentSession().createQuery(hql).setParameter(0, memberId).getResultList();
		return list;
	}

}
