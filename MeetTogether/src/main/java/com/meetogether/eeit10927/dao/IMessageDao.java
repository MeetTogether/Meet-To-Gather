package com.meetogether.eeit10927.dao;

import java.util.List;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10927.model.Message;


public interface IMessageDao {

public int add(Message msg);
	
	public void delete(Message msg);

	public void update(Message msg);
	
	public void updateText(Message msg);

	public Message getMsgByMsgId(Integer msgId);

	public List<Message> getAllMessage();
	
	public List<Message> getUserMessage(Integer memberId);
	
	public List<Message> SearchPost(String qStr);
	
	public List<Message> SearchPostActive(String qStr);
	public int getMsgCntByType(Integer typeId);
	
	public List<Message> SearchPostByTypeActive(Integer categoryId);
	
	public int replyCount(Message msg);
	
	public void updateMsgStatus(Message msg);
	
	public List<Message> getAllMessageActive();
	
	public void updateReCnt(Message msg);

	public void updatelikeCnt(Message msg);
	
	public List<Message> getMsgType();
	
	public void updateMsgImageFilename(Integer msgId, String filename);
	
	public MemberBean getMemberById(int memberId);
	
	public List<Message> getPopularMsg();
	public List<Message> getRecentMsg();
	
	public int getTotalPages();
	public long getRecordCounts();
	public List<Message> getPageMessages();
	
	public int getPageNo();
	public void setPageNo(int pageNo);
	public int getRecordsPerPage();
	public void setRecordsPerPage(int recordsPerPage);
	public void setTotalPages(int totalPages);
	
}
