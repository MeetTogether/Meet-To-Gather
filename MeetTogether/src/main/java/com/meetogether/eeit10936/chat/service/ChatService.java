package com.meetogether.eeit10936.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.meetogether.eeit10936.chat.model.InMessage;
import com.meetogether.eeit10936.chat.model.OutMessage;

@Service
public class ChatService {

	@Autowired
	private SimpMessagingTemplate template;

	/**
	 * 简单点对点聊天室
	 */
	public void sendChatMessage(InMessage message) {
		// 可以看出template最大的灵活就是我们可以获取前端传来的参数来指定订阅地址
		// 前面参数是订阅地址，后面参数是消息信息
		String subscribeUrlString = "/chat/single/";
		Integer to = message.getTo();
		Integer from = message.getFrom();
		if (to > from) {
			subscribeUrlString += from.toString() + to.toString();
		} else {
			subscribeUrlString += to.toString() + from.toString();
		}
		System.out.println(subscribeUrlString);

		template.convertAndSend(subscribeUrlString ,
				new OutMessage(message.getFrom(), message.getContent(), message.getTime()));
	}
}