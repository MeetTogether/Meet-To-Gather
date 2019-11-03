package com.meetogether.eeit10927.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meetogether.eeit10927.dao.IMessageDao;
import com.meetogether.eeit10927.model.Message;
import com.meetogether.eeit10927.service.IMessageService;

@Service
public class MessageServiceImpl implements IMessageService {
	
	IMessageDao dao;
	
	@Autowired
	public void setDao(IMessageDao dao) {
		this.dao = dao;
	}
	
	public MessageServiceImpl() {
	}
	
	@Transactional
	@Override
	public int add(Message msg) {
		return dao.add(msg);
	}
	
	@Transactional
	@Override
	public void delete(Message msg) {
		dao.delete(msg);
	}

	@Transactional
	@Override
	public void update(Message msg) {
		dao.update(msg);
	}

	@Transactional
	@Override
	public void updateText(Message msg) {
		dao.updateText(msg);
	}

	@Transactional
	@Override
	public Message getMsgByMsgId(Integer msgId) {
		return dao.getMsgByMsgId(msgId);
	}

	@Transactional
	@Override
	public List<Message> getAllMessage() {
		return dao.getAllMessage();
	}

	@Transactional
	@Override
	public List<Message> getUserMessage(Integer memberId) {
		return dao.getUserMessage(memberId);
	}

	@Transactional
	@Override
	public List<Message> SearchPost(String qStr) {
		return dao.SearchPost(qStr);
	}

	@Transactional
	@Override
	public void renew(Message msg) {
		dao.updateMsgStatus(msg);
	}

	@Transactional
	@Override
	public List<Message> getAllMessageActive() {
		return dao.getAllMessageActive();
	}

	@Transactional
	@Override
	public List<Message> SearchPostActive(String qStr) {
		return dao.SearchPostActive(qStr);
	}

	@Transactional
	@Override
	public int replyCount(Message msg) {
		return dao.replyCount(msg);
	}

	@Transactional
	@Override
	public void updateReCnt(Message msg) {
		dao.updateReCnt(msg);
		
	}

	@Transactional
	@Override
	public void updatelikeCnt(Message msg) {
		dao.updatelikeCnt(msg);
	}

	@Transactional
	@Override
	public List<Message> getMsgType() {
		return dao.getMsgType();
	}

	@Transactional
	@Override
	public void updateMsgImageFilename(Integer msgId, String filename) {
		dao.updateMsgImageFilename(msgId, filename);
	}

}
