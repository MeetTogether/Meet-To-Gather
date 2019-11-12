package com.meetogether.eeit10936.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.meetogether.eeit10936.chat.model.InMessage;
import com.meetogether.eeit10936.chat.service.ChatService;

@Controller
@RequestMapping("/chat")
public class ChatController {
	@Autowired
	private ChatService ws;


	@MessageMapping("/ptp/single/chat")
	public void singleChat(InMessage message) {
		System.out.println("from : "+message.getFrom());
		System.out.println("to : "+message.getTo());
		System.out.println("content : "+message.getContent());

		ws.sendChatMessage(message);
	}
	
	
}