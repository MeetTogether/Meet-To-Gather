package com.meetogether.eeit10936.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meetogether.eeit10936.chat.model.InMessage;
import com.meetogether.eeit10936.chat.service.ChatService;

@Controller
@RequestMapping("/chat")
public class ChatController {
	@Autowired
	private ChatService service;


	@MessageMapping("/ptp/single/chat")
	public void singleChat(InMessage message) {
		System.out.println("from : "+message.getFrom());
		System.out.println("to : "+message.getTo());
		System.out.println("content : "+message.getContent());

		service.sendChatMessage(message);
	}
	
	
	
	
}