package com.meetogether.eeit10927.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.meetogether.eeit10927.model.Message;
import com.meetogether.eeit10927.model.Msgreply;
import com.meetogether.eeit10927.service.IMessageService;
import com.meetogether.eeit10927.service.IMsgreplyService;

@Controller
public class MsgreplyController {
	
	IMsgreplyService mrService;
	@Autowired
	public void setMrService(IMsgreplyService mrService) {
		this.mrService = mrService;
	}
	
	IMessageService msgService;
	@Autowired
	public void setMsgService(IMessageService msgService) {
		this.msgService = msgService;
	}

	@RequestMapping(value = "/GetAllReMsgServlet", method = RequestMethod.GET)
	public String getAllMsgReply(@RequestParam(value="msgId") Integer msgId, Model model) {
		Msgreply msgRe = new Msgreply();
		model.addAttribute("msgReBean", msgRe);
		
		Message msg = msgService.getMsgByMsgId(msgId);
		model.addAttribute("msgBean", msg);
		
		List<Msgreply> list = mrService.getAllMsgreply(msgId);
		model.addAttribute("reBeans", list);
		return "eeit10927/html/ReplyMsg";
	}
	
	@RequestMapping(value = "/ReplyMsgServlet", method = RequestMethod.POST)
	public String replyMsg(@ModelAttribute("msgReBean") Msgreply msgRe, Model model) {
		mrService.addMsgreply(msgRe);
		model.addAttribute("msgId", msgRe.getMessageId());
		return "redirect:/GetAllReMsgServlet";
	}
	
}
