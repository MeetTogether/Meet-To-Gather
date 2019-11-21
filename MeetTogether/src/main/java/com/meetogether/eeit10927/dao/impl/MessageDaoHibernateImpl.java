 package com.meetogether.eeit10927.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.service.MemberService;
import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10927.dao.IMessageDao;
import com.meetogether.eeit10927.dao.IMsgTypeDao;
import com.meetogether.eeit10927.dao.IMsgtagDao;
import com.meetogether.eeit10927.model.Message;
import com.meetogether.eeit10927.model.MsgType;
import com.meetogether.eeit10927.model.Msgtag;

@Repository
public class MessageDaoHibernateImpl implements IMessageDao {
	
	private int pageNo = 0;			// 存放目前顯示頁面的編號
	private int recordsPerPage = 3;	// 每頁3筆
	private int totalPages = -1;	// 總頁數
	private int textLength = 50;	// 顯示部份文章的字數
	
	private SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	private IMsgTypeDao mtDao;
	@Autowired
	public void setMtDaoService(IMsgTypeDao mtDao) {
		this.mtDao = mtDao;
	}
	
	private IMsgtagDao mTagDao;
	@Autowired
	public void setmTagDao(IMsgtagDao mTagDao) {
		this.mTagDao = mTagDao;
	}
	
	@Autowired
	MemberService memberService;
	
	public MessageDaoHibernateImpl() {
	}
	
	// ok 已確認需使用
	@Override
	public Message getMsgByMsgId(Integer msgId) {
		String hql = "from Message WHERE msgId = ?0";
		Message result = (Message) factory.getCurrentSession().createQuery(hql).setParameter(0, msgId).uniqueResult();
//		result.setMsgText(result.getMsgText().replace("\n", "<br>"));
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getAllMessage() {
		String hql = "from Message ORDER BY createTime DESC";
		List<Message> list = (List<Message>) factory.getCurrentSession().createQuery(hql).getResultList();
		for (Message msg : list) {
			msg.setMsgText(msg.getMsgText().replace("\n", "<br>"));
			if (msg.getMsgText().length() > textLength) {
				msg.setMsgTextShort(msg.getMsgText().substring(0, textLength));
			} else {
				msg.setMsgTextShort(msg.getMsgText());
			}
		}
		return list;
	}
	
	// ok 已確認需使用
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getAllMessageActive() {
		String hql = "from Message WHERE deleteTag = 'False' OR deleteTag IS NULL ORDER BY createTime DESC";
		List<Message> list = (List<Message>) factory.getCurrentSession().createQuery(hql).getResultList();
		for (Message msg : list) {
			msg.setMsgText(msg.getMsgText().replace("\n", "<br>"));
			if (msg.getMsgText().length() > textLength) {
				msg.setMsgTextShort(msg.getMsgText().substring(0, textLength));
			} else {
				msg.setMsgTextShort(msg.getMsgText());
			}
		}
		return list;
	}
	
	// ok 已確認需使用
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getUserMessage(Integer memberId) {
		String hql = "from Message WHERE memberId = ?0 AND (deleteTag = 'False' OR deleteTag IS NULL) ORDER BY createTime DESC";
		List<Message> list = (List<Message>) factory.getCurrentSession().createQuery(hql).setParameter(0, memberId).getResultList();
		for (Message msg : list) {
			msg.setMsgText(msg.getMsgText().replace("\n", "<br>"));
			if (msg.getMsgText().length() > textLength) {
				msg.setMsgTextShort(msg.getMsgText().substring(0, textLength));
			} else {
				msg.setMsgTextShort(msg.getMsgText());
			}
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> SearchPost(String qStr) {
		String qStr2 = "%" + qStr + "%";
		String hql = "from Message WHERE msgTitle Like ?0 or msgText Like ?1";
		List<Message> list = (List<Message>) factory.getCurrentSession().createQuery(hql).setParameter(0, qStr2).setParameter(1, qStr2).getResultList();
		for (Message msg : list) {
			msg.setMsgText(msg.getMsgText().replace("\n", "<br>"));
			if (msg.getMsgText().length() > textLength) {
				msg.setMsgTextShort(msg.getMsgText().substring(0, textLength));
			} else {
				msg.setMsgTextShort(msg.getMsgText());
			}
		}
		return list;
	}
	
	// ok 已確認需使用
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> SearchPostActive(String qStr) {
		String qStr2 = "%" + qStr + "%";
		String hql = "from Message WHERE (msgTitle Like ?0 or msgText Like ?1) AND (deleteTag = 'False' OR deleteTag IS NULL)";
		List<Message> list = (List<Message>) factory.getCurrentSession().createQuery(hql).setParameter(0, qStr2).setParameter(1, qStr2).getResultList();
		for (Message msg : list) {
			msg.setMsgText(msg.getMsgText().replace("\n", "<br>"));
			if (msg.getMsgText().length() > textLength) {
				msg.setMsgTextShort(msg.getMsgText().substring(0, textLength));
			} else {
				msg.setMsgTextShort(msg.getMsgText());
			}
		}
		return list;
	}
	
	// ok 已確認需使用
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> SearchPostByTypeActive(Integer typeId) {
		String hql = "from Message WHERE (msgTypeId = ?0) AND (deleteTag = 'False' OR deleteTag IS NULL)";
		List<Message> list = (List<Message>) factory.getCurrentSession().createQuery(hql).setParameter(0, typeId).getResultList();
		for (Message msg : list) {
			msg.setMsgText(msg.getMsgText().replace("\n", "<br>"));
			if (msg.getMsgText().length() > textLength) {
				msg.setMsgTextShort(msg.getMsgText().substring(0, textLength));
			} else {
				msg.setMsgTextShort(msg.getMsgText());
			}
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public int getMsgCntByType(Integer typeId) {
		String hql = "from Message WHERE (msgTypeId = ?0) AND (deleteTag = 'False' OR deleteTag IS NULL)";
		List<Message> list = (List<Message>) factory.getCurrentSession().createQuery(hql).setParameter(0, typeId).getResultList();
		if (list.size() > 0) {
			return list.size();
		} else {
			return 0;
		}
	}
	
//	同上	
//	public int getMsgTypeCount(Integer typeId) {
//		Map<Integer, Integer> msgTypeMap = new HashMap<>();
//		String hql = "SELECT DISTINCT COUNT(*) AS Count, msgTypeId AS [Type] "
//				+ "FROM message WHERE deleteTag = 0 and msgTypeId = ?0 GROUP by msgTypeId";
//		int cnt = (int) factory.getCurrentSession().createQuery(hql).setParameter(0, typeId).uniqueResult();
//		return cnt;
//	}

	// ok 已確認需使用
	@Override
	public int add(Message msg) {
		Session session = factory.getCurrentSession();
		msg.setMsgText(msg.getMsgText().replace("<script>", "＜script＞").replace("</script>", "＜/script＞"));
		MsgType mt = mtDao.getMsgTypeById(msg.getMtId());
		MemberBean mb = getMemberById(msg.getMbId());
		msg.setMsgType(mt);
		msg.setMember(mb);
		session.save(msg);
		
		List<String> tags = msg.getMsgTagName();
//		System.out.println("-------------tags size: " + tags.size());
		for (String tagname : tags) {
			if (tagname.length() > 0) {
				Msgtag tag = new Msgtag();
				tag.setMember(mb);
				tag.setMessage(msg);
				tag.setTagName(tagname);
				session.save(tag);
			}
		}
		
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
		Session session = factory.getCurrentSession();
		Date updateTime = new Date();
		String hql = "from Message WHERE msgId = ?0";
		Message result = (Message) session.createQuery(hql).setParameter(0, msg.getMsgId()).uniqueResult();
		
		MemberBean mb = getMemberById(msg.getMbId());
		MsgType mt = mtDao.getMsgTypeByName(msg.getMtName());
		result.setMsgId(msg.getMsgId());
		result.setMsgType(mt);
		result.setMsgTitle(msg.getMsgTitle());
		result.setMsgText(msg.getMsgText());
		result.setMsgFilename(msg.getMsgFilename());
		result.setMsgPhoto(msg.getMsgPhoto());
		result.setUpdateTime(updateTime);
		result.setMsgText(msg.getMsgText().replace("<script>", "＜script＞").replace("</script>", "＜/script＞"));
		mTagDao.deleteMsgTagByMsgId(msg.getMsgId());
		List<String> tags = msg.getMsgTagName();
		for (String tagname : tags) {
			if (tagname.length() > 0) {
				Msgtag tag = new Msgtag();
				tag.setMember(mb);
				tag.setMessage(result);
				tag.setTagName(tagname);
				session.save(tag);
			}
		}
	}
	
	// ok 已確認需使用
	@Override
	public void updateText(Message msg) {
		Session session = factory.getCurrentSession();
		Date updateTime = new Date();
		String hql = "from Message WHERE msgId = ?0";
		Message result = (Message) session.createQuery(hql).setParameter(0, msg.getMsgId()).uniqueResult();
		
		MemberBean mb = getMemberById(msg.getMbId());
		MsgType mt = mtDao.getMsgTypeByName(msg.getMtName());
		result.setMsgId(msg.getMsgId());
		result.setMsgType(mt);
		result.setMsgTitle(msg.getMsgTitle());
		result.setMsgText(msg.getMsgText());
		result.setUpdateTime(updateTime);
		result.setMsgText(msg.getMsgText().replace("<script>", "＜script＞").replace("</script>", "＜/script＞"));
		mTagDao.deleteMsgTagByMsgId(msg.getMsgId());
		List<String> tags = msg.getMsgTagName();
		for (String tagname : tags) {
			if (tagname.length() > 0) {
				Msgtag tag = new Msgtag();
				tag.setMember(mb);
				tag.setMessage(result);
				tag.setTagName(tagname);
				session.save(tag);
			}
		}
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
		List<Message> list = factory.getCurrentSession().createQuery(hql).getResultList();
		return list;
	}
	
	// ok 已確認需使用
	@Override
	public int getTotalPages(Integer userId) {
		totalPages = (int) (Math.ceil(getRecordCounts(userId) / (double) recordsPerPage));
		return totalPages;
	}
	
	// ok 已確認需使用
	@SuppressWarnings("unchecked")
	@Override
	public long getRecordCounts(Integer userId) {
		long count = 0;
		String hql = "SELECT count(*) FROM Message WHERE memberId = ?0 AND (deleteTag = 'False' OR deleteTag IS NULL)";
		Session session = factory.getCurrentSession();
		List<Long> list = session.createQuery(hql)
				.setParameter(0, userId).getResultList();
		if (list.size() > 0) {
			count = list.get(0);
		}
		return count;
	}
	
	// ok 已確認需使用
	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getPageMessages(Integer userId) {
		List<Message> list = new ArrayList<Message>();
		String hql = "FROM Message WHERE memberId = ?0 AND (deleteTag = 'False' OR deleteTag IS NULL) ORDER BY createTime DESC";
		Session session = factory.getCurrentSession();
		int startRecordNo = 1;
		if (pageNo < 1) {
			startRecordNo = pageNo * recordsPerPage;
		} else {
			startRecordNo = (pageNo - 1) * recordsPerPage;
		}
		
		list = session.createQuery(hql).setParameter(0, userId)
				.setFirstResult(startRecordNo)
				.setMaxResults(recordsPerPage)
                .list();
		for (Message msg : list) {
			msg.setMsgText(msg.getMsgText().replace("\n", "<br>"));
			if (msg.getMsgText().length() > textLength) {
				msg.setMsgTextShort(msg.getMsgText().substring(0, textLength));
			} else {
				msg.setMsgTextShort(msg.getMsgText());
			}
		}
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getRecentMsg() {
		List<Message> list = new ArrayList<Message>();
		String hql = "FROM Message WHERE deleteTag = 'False' OR deleteTag IS NULL ORDER BY createTime DESC";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql)
				.setMaxResults(3)
                .list();
		for (Message msg : list) {
			msg.setMsgText(msg.getMsgText().replace("\n", "<br>"));
			if (msg.getMsgText().length() > textLength) {
				msg.setMsgTextShort(msg.getMsgText().substring(0, textLength));
			} else {
				msg.setMsgTextShort(msg.getMsgText());
			}
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getPopularMsg() {
		List<Message> list = new ArrayList<Message>();
		String hql = "FROM Message WHERE deleteTag = 'False' OR deleteTag IS NULL ORDER BY replyCount DESC, createTime DESC";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql)
				.setMaxResults(3)
                .list();
		for (Message msg : list) {
			msg.setMsgText(msg.getMsgText().replace("\n", "<br>"));
			if (msg.getMsgText().length() > textLength) {
				msg.setMsgTextShort(msg.getMsgText().substring(0, textLength));
			} else {
				msg.setMsgTextShort(msg.getMsgText());
			}
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getNewMember() {
		List<MemberBean> list = new ArrayList<>();
		String hql = "from MemberBean order by createTime desc";
		list = factory.getCurrentSession().createQuery(hql)
				.setMaxResults(5)
				.getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ActBean> getPopActivity() {
		List<ActBean> list = new ArrayList<>();
		String hql = "from ActBean order by createTime desc";
		list = factory.getCurrentSession().createQuery(hql)
				.setMaxResults(8)
				.getResultList();
		return list;
	}
	
	
}
