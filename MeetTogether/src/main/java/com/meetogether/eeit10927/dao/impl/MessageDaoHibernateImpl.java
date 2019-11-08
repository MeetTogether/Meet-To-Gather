package com.meetogether.eeit10927.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.dao.MemberDao;
import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10927.dao.IMessageDao;
import com.meetogether.eeit10927.dao.IMsgTypeDao;
import com.meetogether.eeit10927.model.Member;
import com.meetogether.eeit10927.model.Message;
import com.meetogether.eeit10927.model.MsgType;

@Repository
public class MessageDaoHibernateImpl implements IMessageDao {
	
	private int pageNo = 0;			// 存放目前顯示頁面的編號
	private int recordsPerPage = 2;	// 每頁3筆
	private int totalPages = -1;	// 總頁數
	
	private SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	private MemberDao mDao;
	@Autowired
	public void setMDao(MemberDao mDao) {
		this.mDao = mDao;
	}
	
	private IMsgTypeDao mtDao;
	@Autowired
	public void setMtDaoService(IMsgTypeDao mtDao) {
		this.mtDao = mtDao;
	}
	
	public MessageDaoHibernateImpl() {
	}
	
	// ok 已確認需使用
	@Override
	public Message getMsgByMsgId(Integer msgId) {
		String hql = "from Message WHERE msgId = ?0";
		Message result = (Message) factory.getCurrentSession().createQuery(hql).setParameter(0, msgId).uniqueResult();
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getAllMessage() {
		String hql = "from Message ORDER BY createTime DESC";
		List<Message> result = (List<Message>) factory.getCurrentSession().createQuery(hql).getResultList();
		return result;
	}
	
	// ok 已確認需使用
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getAllMessageActive() {
		String hql = "from Message WHERE deleteTag = 'False' OR deleteTag IS NULL ORDER BY createTime DESC";
		List<Message> result = (List<Message>) factory.getCurrentSession().createQuery(hql).getResultList();
		return result;
	}
	
	// ok 已確認需使用
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getUserMessage(Integer memberId) {
		String hql = "from Message WHERE memberId = ?0 AND (deleteTag = 'False' OR deleteTag IS NULL) ORDER BY createTime DESC";
		List<Message> result = (List<Message>) factory.getCurrentSession().createQuery(hql).setParameter(0, memberId).getResultList();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> SearchPost(String qStr) {
		String qStr2 = "%" + qStr + "%";
		String hql = "from Message WHERE msgTitle Like ?0 or msgText Like ?1";
		List<Message> result = (List<Message>) factory.getCurrentSession().createQuery(hql).setParameter(0, qStr2).setParameter(1, qStr2).getResultList();
		return result;
	}
	
	// ok 已確認需使用
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> SearchPostActive(String qStr) {
		String qStr2 = "%" + qStr + "%";
		String hql = "from Message WHERE (msgTitle Like ?0 or msgText Like ?1) AND (deleteTag = 'False' OR deleteTag IS NULL)";
		List<Message> result = (List<Message>) factory.getCurrentSession().createQuery(hql).setParameter(0, qStr2).setParameter(1, qStr2).getResultList();
		return result;
	}
	
	// ok 已確認需使用
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> SearchPostByTypeActive(Integer categoryId) {
		String hql = "from Message WHERE (msgTypeId = ?0) AND (deleteTag = 'False' OR deleteTag IS NULL)";
		List<Message> result = (List<Message>) factory.getCurrentSession().createQuery(hql).setParameter(0, categoryId).getResultList();
		return result;
	}

	// ok 已確認需使用
	@Override
	public int add(Message msg) {
		Session session = factory.getCurrentSession();
		MsgType mt = mtDao.getMsgTypeById(msg.getMtId());
		MemberBean mb = getMemberById(msg.getMbId());
		msg.setMsgType(mt);
		msg.setMember(mb);
		session.save(msg);
		int msgId = msg.getMsgId();
		return msgId;
	}
	
	// ok 已確認需使用
	@Override
	public MemberBean getMemberById(int memberId) {
		Session session = factory.getCurrentSession();
		MemberBean result = session.get(MemberBean.class, memberId);
		return result;
	}
	
	// ok 已確認需使用
	@Override
	public void delete(Message msg) {
		String hql = "from Message WHERE msgId = ?0";
		Message result = (Message) factory.getCurrentSession().createQuery(hql).setParameter(0, msg.getMsgId()).uniqueResult();
		result.setDeleteTag("1");
	}
	
	@Override
	public void updateMsgStatus(Message msg) {
		String hql = "from Message WHERE msgId = ?0";
		Message result = (Message) factory.getCurrentSession().createQuery(hql).setParameter(0, msg.getMsgId()).uniqueResult();
		result.setDeleteTag("");
	}

	// ok 已確認需使用
	@Override
	public void update(Message msg) {
		Date updateTime = new Date();
		String hql = "from Message WHERE msgId = ?0";
		Message result = (Message) factory.getCurrentSession().createQuery(hql).setParameter(0, msg.getMsgId()).uniqueResult();
		
		MsgType mt = mtDao.getMsgTypeByName(msg.getMtName());
		result.setMsgType(mt);
		result.setMsgTitle(msg.getMsgTitle());
		result.setMsgText(msg.getMsgText());
		result.setMsgFilename(msg.getMsgFilename());
		result.setMsgPhoto(msg.getMsgPhoto());
		result.setUpdateTime(updateTime);
	}
	
	// ok 已確認需使用
	@Override
	public void updateText(Message msg) {
		Date updateTime = new Date();
		String hql = "from Message WHERE msgId = ?0";
		Message result = (Message) factory.getCurrentSession().createQuery(hql).setParameter(0, msg.getMsgId()).uniqueResult();
		
		MsgType mt = mtDao.getMsgTypeByName(msg.getMtName());
		result.setMsgType(mt);
		result.setMsgTitle(msg.getMsgTitle());
		result.setMsgText(msg.getMsgText());
		result.setUpdateTime(updateTime);
	}
	
	// ok 已確認需使用
	@Override
	public void updateMsgImageFilename(Integer msgId, String filename) {
		String hql = "from Message WHERE msgId = ?0";
		Message result = (Message) factory.getCurrentSession().createQuery(hql).setParameter(0, msgId).uniqueResult();
		result.setMsgFilename(filename);
	}
	
	// ok 已確認需使用
	@Override
	public int replyCount(Message msg) {
		String hql = "from Message WHERE msgId = ?0";
		Message msg2 = (Message) factory.getCurrentSession().createQuery(hql).setParameter(0, msg.getMsgId()).uniqueResult();
		if (msg2.getReplyCount() != null) {
			int reCnt = msg2.getReplyCount();
			return reCnt;
		} else {
			return 0;
		}
	}
	
	// ok 已確認需使用
	@Override
	public void updateReCnt(Message msg) {
		String hql = "from Message WHERE msgId = ?0";
		Message result = (Message) factory.getCurrentSession().createQuery(hql).setParameter(0, msg.getMsgId()).uniqueResult();
		
		result.setReplyCount(msg.getReplyCount());
	}
	
	// ok 已確認需使用
	@Override
	public void updatelikeCnt(Message msg) {
		String hql = "from Message WHERE msgId = ?0";
		Message result = (Message) factory.getCurrentSession().createQuery(hql).setParameter(0, msg.getMsgId()).uniqueResult();
		
		result.setLikeCount(msg.getLikeCount());
	}
	
	// ok 已確認需使用
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getMsgType() {
		String hql = "FROM Message";
		List<Message> result = factory.getCurrentSession().createQuery(hql).getResultList();
		return result;
	}
	
	// ok 已確認需使用
	@Override
	public int getTotalPages() {
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return totalPages;
	}
	
	// ok 已確認需使用
	@SuppressWarnings("unchecked")
	@Override
	public long getRecordCounts() {
		long count = 0;
		String hql = "SELECT count(*) FROM Message";
		Session session = factory.getCurrentSession();
		List<Long> list = session.createQuery(hql).list();
		if (list.size() > 0) {
			count = list.get(0);
		}
		return count;
	}
	
	// ok 已確認需使用
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getPageMessages() {
		List<Message> list = new ArrayList<Message>();
		String hql = "FROM Message ORDER BY createTime DESC";
		Session session = factory.getCurrentSession();
		int startRecordNo = 1;
		if (pageNo < 1) {
			startRecordNo = pageNo * recordsPerPage;
		} else {
			startRecordNo = (pageNo - 1) * recordsPerPage;
		}
		
		list = session.createQuery(hql)
				.setFirstResult(startRecordNo)
				.setMaxResults(recordsPerPage)
                .list();
		return list;
	}
	@Override
	public int getPageNo() {
		return pageNo;
	}
	@Override
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	@Override
	public int getRecordsPerPage() {
		return recordsPerPage;
	}
	@Override
	public void setRecordsPerPage(int recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}
	@Override
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	
	
}
