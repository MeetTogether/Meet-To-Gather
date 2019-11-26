package com.meetogether.eeit10927.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.dao.MemberDao;
import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10927.dao.IMessageDao;
import com.meetogether.eeit10927.dao.IMsgreplyDao;
import com.meetogether.eeit10927.model.Message;
import com.meetogether.eeit10927.model.Msgreply;

@Repository
public class MsgreplyDaoHibernateImpl implements IMsgreplyDao {

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

	public MsgreplyDaoHibernateImpl() {
	}
	
	// ok 已確認需使用
	@Override
	public void add(Msgreply re) {
		Session session = factory.getCurrentSession();
		Message msg = msgDao.getMsgByMsgId(re.getMessageId());
		MemberBean member = msgDao.getMemberById(re.getMemberId());
		re.setMessage(msg);
		re.setMember(member);
		session.save(re);
		
		int reCnt = msgDao.replyCount(msg);
		msg.setReplyCount(reCnt+1);
		msgDao.updateReCnt(msg);
	}
	
	// ok 已確認需使用
	@SuppressWarnings("unchecked")
	@Override
	public List<Msgreply> getAllMsgreply(Integer msgId) {
		String hql = "from Msgreply WHERE msgId = ?0 ORDER BY createTime DESC";
		return (List<Msgreply>) factory.getCurrentSession().createQuery(hql).setParameter(0, msgId).getResultList();
	}
	
	@Override
	public List<Msgreply> getMsgReplySta(Integer memberId) {
		String hql = "from Msgreply WHERE msgId IN (SELECT msgId from Message WHERE memberId = ?0)";
		List<Msgreply> list = factory.getCurrentSession().createQuery(hql, Msgreply.class)
									.setParameter(0, memberId).getResultList();
		return list;
	}
	
}
