package com.meetogether.eeit10927.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meetogether.eeit10927.model.Message;
import com.meetogether.eeit10927.model.MsgType;
import com.meetogether.eeit10927.model.Msglike;
import com.meetogether.eeit10927.model.Msgreply;
import com.meetogether.eeit10927.service.IMessageService;
import com.meetogether.eeit10927.service.IMsgTypeService;
import com.meetogether.eeit10927.service.IMsgreplyService;

@Controller
public class MsgreplyController {
	
	List<Message> list = null;
	
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
	
	IMsgTypeService mtService;
	@Autowired
	public void setMTDao(IMsgTypeService mtService) {
		this.mtService = mtService;
	}

	@RequestMapping(value = "/GetAllReMsgServlet", method = RequestMethod.GET)
	public String getAllMsgReply(@RequestParam(value="msgId") Integer msgId, Model model, HttpServletRequest request) {
		Msgreply msgRe = new Msgreply();
		model.addAttribute("msgReBean", msgRe);
		
		Message msg = msgService.getMsgByMsgId(msgId);
		model.addAttribute("msgBean", msg);
		model.addAttribute("messageBean", new Message());
		
		List<Msgreply> list = mrService.getAllMsgreply(msgId);
		model.addAttribute("reBeans", list);
		
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		Msglike msgLike = new Msglike();
		msgLike.setMessageId(msgId);
		msgLike.setMemberId(userId);
		String likeOrNot = mrService.findMsglikeByMsgAndMember(msgLike);
		model.addAttribute("likeOrNot", likeOrNot);
		return "eeit10927/html/ReplyMsg";
	}
	
	@RequestMapping(value = "/ReplyMsgServlet", method = RequestMethod.POST)
	public String replyMsg(@ModelAttribute("msgReBean") Msgreply msgRe, Model model) {
		mrService.addMsgreply(msgRe);
		model.addAttribute("msgId", msgRe.getMessageId());
//		model.addAttribute("messageBean", new Message());
		return "redirect:/GetAllReMsgServlet";
	}
	
	@RequestMapping(value = "/LikeMsgServlet", method = RequestMethod.GET)
	public @ResponseBody String likeMsg(@ModelAttribute("msgLike") Msglike msgLike, 
			Model model, HttpServletRequest request, 
			@RequestParam(value = "userId") Integer userId,
			@RequestParam(value = "msgId") Integer msgId
			) {
		System.out.println("****userId: " + userId + ", type: " + userId.getClass().getName() + "; msgId: " + msgId + ", type: " + msgId.getClass().getName());
		msgLike.setMemberId(userId);
		msgLike.setMessageId(msgId);
		mrService.addMsglike(msgLike);
		Message msg = msgService.getMsgByMsgId(msgId);
		return msg.getLikeCount().toString();
	}
	
	@RequestMapping(value = "/DislikeMsgServlet", method = RequestMethod.GET)
	public @ResponseBody String disLikeMsg(@ModelAttribute("msgLike") Msglike msgLike, 
			Model model, HttpServletRequest request, 
			@RequestParam(value = "userId") Integer userId,
			@RequestParam(value = "msgId") Integer msgId
			) {
		msgLike.setMemberId(userId);
		msgLike.setMessageId(msgId);
		mrService.deleteMsglike(msgLike);
		Message msg = msgService.getMsgByMsgId(msgId);
		return msg.getLikeCount().toString();
	}
	
	@RequestMapping(value = "/getMsgTypeCnt", method = RequestMethod.GET)
	public @ResponseBody Integer getMsgTypeCnt(@RequestParam(value="typeId") Integer typeId) {
		return msgService.getMsgCntByType(typeId);
	}
	
	@ModelAttribute("msgType")
	public Map<Integer, String> getMsgTypeList() {
		Map<Integer, String> msgTypeMap = new HashMap<>();
		List<MsgType> list = mtService.getMsgTypeList();
		for (MsgType mType : list) {
			msgTypeMap.put(mType.getTypeId(), mType.getTypeName());
		}
		return msgTypeMap;
	}
	
	@ModelAttribute("popularMsgBeans")
	public List<Message> getPopularMsgList() {
		list = msgService.getPopularMsg();
		return list;
	}
	
	@ModelAttribute("recentMsgBeans")
	public List<Message> getRecentMsgList() {
		list = msgService.getRecentMsg();
		return list;
	}
	
}
