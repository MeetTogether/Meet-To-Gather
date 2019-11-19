package com.meetogether.eeit10927.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10927.dao.IMessageDao;
import com.meetogether.eeit10927.dao.IMsgtagDao;
import com.meetogether.eeit10927.model.Message;
import com.meetogether.eeit10927.model.Msgtag;

@Repository
public class MsgtagDaoHibernateImpl implements IMsgtagDao {

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
	
	public MsgtagDaoHibernateImpl() {
	}
	
	@Override
	public void add(Msgtag tag) {
		Session session = factory.getCurrentSession();
		Message msg = msgDao.getMsgByMsgId(tag.getMessageId());
		MemberBean member = msgDao.getMemberById(tag.getMemberId());
		tag.setMessage(msg);
		tag.setMember(member);
		session.save(tag);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Msgtag> getMsgtagByMsgId(Integer msgId) {
		String hql = "from Msgtag WHERE msgId = ?0 and deleteTag = 'False'";
		return (List<Msgtag>) factory.getCurrentSession().createQuery(hql).setParameter(0, msgId).getResultList();
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Msgtag> getAllMsgtag() {
		String hql = "from Msgtag where deleteTag = 'False'";
//		String hql = "select tagName, count(tagName) from Msgtag group by tagName order by count(tagName) DESC";
		List<Msgtag> tags = (List<Msgtag>) factory.getCurrentSession().createQuery(hql).getResultList();
		return tags;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Message> getMsgByTagName(String tagName) {
		String hql = "select a from Message as a,Msgtag as b where a.msgId=b.message.msgId and b.tagName = ?0 and b.deleteTag = 'False'";
		return (List<Message>) factory.getCurrentSession().createQuery(hql).setParameter(0, tagName).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void deleteMsgTagByMsgId(Integer msgId) {
		Session session = factory.getCurrentSession();
		String hql1 = "from Msgtag where msgId = ?0 and deleteTag = 'False'";
		List<Msgtag> list = (List<Msgtag>) session.createQuery(hql1).setParameter(0, msgId).getResultList();
		if (!list.isEmpty()) {
			for (Msgtag tag : list) {
				tag.setDeleteTag(true);
				tag.setMessage(null);
			}
		}
//		String hql = "delete from Msgtag where msgId = ?0";
//		session.createQuery(hql).setParameter(0, msgId).executeUpdate();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Msgtag> getMsgtagByQuery(String query) {
		String hql = "from Msgtag where deleteTag = 'False' and tagName like ?0";
		String tagQuery = query + "%";
		List<Msgtag> tags = (List<Msgtag>) factory.getCurrentSession().createQuery(hql)
				.setParameter(0, tagQuery).getResultList();
		Map<String, Integer> tagMap = new HashMap<String, Integer>();
		for (Msgtag tag : tags) {
			tagMap.put(tag.getTagName(), 1);
		}
		System.out.println("----------tagMap: " + tagMap);
		return tags;
	}
	
}
