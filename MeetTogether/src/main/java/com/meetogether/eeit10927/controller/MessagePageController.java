package com.meetogether.eeit10927.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.meetogether.eeit10927.model.Message;
import com.meetogether.eeit10927.service.IMessageService;

@Controller
public class MessagePageController {
	
	IMessageService msgService;
	@Autowired 
	public void setMsgService(IMessageService msgService) {
		this.msgService = msgService;
	}

//	@RequestMapping("/DisplayPageMessage")
	public String displayPage(@RequestParam(value="pageNo") Integer pageNo,
			Model model, HttpServletRequest request) {
		int userId = (Integer) request.getSession().getAttribute("userId");
		int recordsPerPage = 3;
		if (pageNo == null) {
			pageNo = 1;
		}
		
		msgService.setPageNo(pageNo);
		msgService.setRecordsPerPage(recordsPerPage);
		List<Message> list = msgService.getPageMessages(userId);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("totalPages", msgService.getTotalPages(userId));
		model.addAttribute("msgBeans", list);
		
		model.addAttribute("messageBean", new Message());
		
		return "eeit10927/html/forum";
	}
	
}
