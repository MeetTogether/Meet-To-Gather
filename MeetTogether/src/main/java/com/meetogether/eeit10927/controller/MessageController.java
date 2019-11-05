package com.meetogether.eeit10927.controller;

import java.io.File;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.meetogether.eeit10927.model.Message;
import com.meetogether.eeit10927.model.MsgType;
import com.meetogether.eeit10927.model.Msglike;
import com.meetogether.eeit10927.service.IMessageService;
import com.meetogether.eeit10927.service.IMsgTypeService;
import com.meetogether.eeit10927.service.IMsgreplyService;

@Controller
public class MessageController {
	
	ServletContext context;
	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
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
	
	IMsgreplyService mlService;
	@Autowired
	public void setMlService(IMsgreplyService mlService) {
		this.mlService = mlService;
	}

	@RequestMapping(value = "/GetAllPostServlet", method = RequestMethod.GET)
	public String getAllMessage(Model model, HttpServletRequest request) {
		Message msg = new Message();
		model.addAttribute("messageBean", msg);

		List<Message> msgBeans = msgService.getAllMessageActive();
		model.addAttribute("msgBeans", msgBeans);
		
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		List<Msglike> mlBeans = mlService.findMsglikeByMember(userId);
		model.addAttribute("mlBeans", mlBeans);
		Msglike msgLike = new Msglike();
		model.addAttribute("msgLike", msgLike);
		return "eeit10927/html/forum";
	}
	
	@RequestMapping(value = "/PostServlet", method = RequestMethod.POST)
	public String processMessagePostForm(@ModelAttribute("messageBean") Message message, 
			BindingResult result, Model model, HttpServletRequest request) {
//		String rootDirectory = "C:/temp/images/";
		MultipartFile msgImage = message.getMsgImage();
		String originalFilename = msgImage.getOriginalFilename();
		String ext = "";
		String savedFilename = "";
		boolean imageUpdate = false;
		// 將留言上傳照片寫入資料庫
		if (originalFilename.length() > 0) {	
			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			imageUpdate = true;
			try {
				byte[] b = msgImage.getBytes();
				Blob blob = new SerialBlob(b);
				message.setMsgPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		msgService.add(message);
		if (originalFilename.length() > 0) {
			savedFilename = "Message-" + message.getMsgId() + "-" + String.valueOf(System.currentTimeMillis()) + ext;
			msgService.updateMsgImageFilename(message.getMsgId(), savedFilename);
		}
		// 將留言上傳照片存入指定資料夾
//		if (imageUpdate) {
//			try {
//				File imageFolder = new File(rootDirectory, "message");
//				if (!imageFolder.exists())
//					imageFolder.mkdirs();
//				File file = new File(imageFolder, savedFilename);
//				msgImage.transferTo(file);
//			} catch (Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//			}
//		}
		return "redirect:/GetAllPostServlet";
	}
	
	@RequestMapping(value = "/GetUserPostServlet", method = RequestMethod.GET)
	public String getUserMessage(@RequestParam(value = "memberId") Integer memberId, Model model, HttpServletRequest request) {
		Message msg = new Message();
		model.addAttribute("messageBean", msg);

		List<Message> msgBeans = msgService.getUserMessage(memberId);
		model.addAttribute("msgBeans", msgBeans);
		
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		List<Msglike> mlBeans = mlService.findMsglikeByMember(userId);
		model.addAttribute("mlBeans", mlBeans);
		Msglike msgLike = new Msglike();
		model.addAttribute("msgLike", msgLike);
		return "eeit10927/html/forum";
	}
	
	@RequestMapping(value = "/ViewPostServlet", method = RequestMethod.GET)
	public String viewMessage(@RequestParam(value="msgId") Integer msgId, Model model) {
		Message msgBean = msgService.getMsgByMsgId(msgId);
		System.out.println("messge filename: " + msgBean.getMsgFilename());
		model.addAttribute("msgBean", msgBean);
		return "eeit10927/html/forumView";
	}
	
	@RequestMapping(value = "/UpdatePostServlet", method = RequestMethod.POST)
	public String updateMessage(@ModelAttribute("msgBean") Message message, Model model) {
		MultipartFile msgImage = message.getMsgImage();
		String rootDirectory = "C:/temp/images/";
		String originalFilename = msgImage.getOriginalFilename();
		String ext = "";
		String savedFilename = "";
		boolean imageUpdate = false;
		// 將留言上傳照片寫入資料庫
		if (originalFilename.length() > 0) {	
			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			savedFilename = "Message-" + message.getMsgId() + "-" + String.valueOf(System.currentTimeMillis()) + ext;
			imageUpdate = true;
			try {
				byte[] b = msgImage.getBytes();
				Blob blob = new SerialBlob(b);
				message.setMsgPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		message.setMsgFilename(savedFilename);
		if (imageUpdate) {
			msgService.update(message);
		} else {
			msgService.updateText(message);
		}
		// 將留言上傳照片存入指定資料夾
		if (imageUpdate) {
			try {
				File imageFolder = new File(rootDirectory, "message");
				if (!imageFolder.exists())
					imageFolder.mkdirs();
				File file = new File(imageFolder, savedFilename);
				msgImage.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		return "redirect:/GetAllPostServlet";
	}
	
	@RequestMapping(value = "/DeletePostServlet", method = RequestMethod.POST)
	public String deleteMessage(@RequestParam(value="msgId") Integer msgId, Model model) {
		Message msg = new Message();
		model.addAttribute("messageBean", msg);
		
		Message msgBean = msgService.getMsgByMsgId(msgId);
		msgService.delete(msgBean);
		return "redirect:/GetAllPostServlet";
	}
	
	@RequestMapping(value = "/SearchPostServlet", method = RequestMethod.POST)
	public String searchMessage(@RequestParam(value="queryString") String queryString, Model model) {
		Message msg = new Message();
		model.addAttribute("messageBean", msg);
		
		List<Message> list = msgService.SearchPost(queryString);
		model.addAttribute("msgBeans", list);
		return "eeit10927/html/forum";
	}
	
	@ModelAttribute("msgType")
	public Map<Integer, String> getCompanyList() {
		Map<Integer, String> msgTypeMap = new HashMap<>();
		List<MsgType> list = mtService.getMsgTypeList();
		for (MsgType mType : list) {
			msgTypeMap.put(mType.getTypeId(), mType.getTypeName());
		}
		return msgTypeMap;
	}
	
}
