package com.meetogether.eeit10927.service;

import java.util.List;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10927.model.Message;

	public interface IMessageService {

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
	public void renew(Message msg);
	public List<Message> getAllMessageActive();
	public void updateReCnt(Message msg);
	public void updatelikeCnt(Message msg);
	public List<Message> getMsgType();
	public void updateMsgImageFilename(Integer msgId, String filename);
	
	public MemberBean getMemberById(int memberId);
	
	public List<Message> getPopularMsg();
	public List<Message> getRecentMsg();
	
	public int getTotalPages(Integer userId);
	public long getRecordCounts(Integer userId);
	public List<Message> getPageMessages(Integer userId);
	
	public int getPageNo();
	public void setPageNo(int pageNo);
	public int getRecordsPerPage();
	public void setRecordsPerPage(int recordsPerPage);
	public void setTotalPages(int totalPages);
	
	public List<MemberBean> getNewMember();
	public List<ActBean> getPopActivity();

}
