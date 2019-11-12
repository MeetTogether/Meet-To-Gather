package com.meetogether.eeit10936.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.meetogether.eeit10936.chat.dao.ChatMsgRedisDao;
import com.meetogether.eeit10936.chat.model.InMessage;
import com.meetogether.eeit10936.chat.model.OutMessage;

@Service
public class ChatService {

	@Autowired
	private SimpMessagingTemplate template;
	@Autowired
	private ChatMsgRedisDao dao;

	
	public void sendChatMessage(InMessage message) {
		// 前面參數是訂閱地址，後面參數是消息信息
		String subscribeUrlString = "/chat/single/";
		Integer to = message.getTo();
		Integer from = message.getFrom();
		if (to > from) {
			subscribeUrlString += from.toString() + to.toString();
		} else {
			subscribeUrlString += to.toString() + from.toString();
		}
		System.out.println("STOMP subscribe路徑: " + subscribeUrlString);
		dao.saveRecord(message);
		template.convertAndSend(subscribeUrlString,
				new OutMessage(message.getFrom(), message.getContent(), message.getTime()));
	}
	
	public List<InMessage> getRecord(Integer from , Integer to){
		return dao.getRecord(from, to);
	}
}