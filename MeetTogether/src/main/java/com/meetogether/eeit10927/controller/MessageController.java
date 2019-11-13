package com.meetogether.eeit10927.controller;

import java.io.File;
import java.sql.Blob;
import java.util.ArrayList;
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
import com.meetogether.eeit10927.validate.MessageValidator;

@Controller
public class MessageController {
	
	int recordsPerPage = 2;
	List<Message> list = null;
	
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
		
		// 空messageBean給postMsg.jsp
		Message msg = new Message();
		model.addAttribute("messageBean", msg);
		// 空messageBean給分類查詢
		model.addAttribute("msgTypeBean", new MsgType());
		
		// 查到的msgLike和空的msgLikeBean給forum.jsp
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		List<Msglike> mlBeans = mlService.findMsglikeByMember(userId);
		model.addAttribute("mlBeans", mlBeans);
		Msglike msgLike = new Msglike();
		model.addAttribute("msgLike", msgLike);
		
		return "forward:/DisplayPageMessage";
	}
	
	@RequestMapping(value = "/PostServlet", method = RequestMethod.POST)
	public String processMessagePostForm(@ModelAttribute("messageBean") Message message, 
			BindingResult result, Model model, HttpServletRequest request) {
//		new MessageValidator().validate(message, result);
//		System.out.println("*****errors: " + result);
//		if (result.hasErrors()) {
//			return "eeit10927/html/forum";
//		}
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
		
		// 空messageBean給分類查詢
		model.addAttribute("msgTypeBean", new MsgType());

		list = msgService.getUserMessage(memberId);
		model.addAttribute("msgBeans", list);
		
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
		msgBean.setMsgText(msgBean.getMsgText().replace("<br>", "\n"));
		System.out.println("messge filename: " + msgBean.getMsgFilename());
		model.addAttribute("msgBean", msgBean);
		return "eeit10927/html/forumView";
	}
	
	@RequestMapping(value = "/UpdatePostServlet", method = RequestMethod.POST)
	public String updateMessage(@ModelAttribute("msgBean") Message message, Model model, 
			BindingResult result) {
		new MessageValidator().validate(message, result);
		System.out.println("**update post errors: " + result);
		if (result.hasErrors()) {
			return "eeit10927/html/forumView";
		}
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
	
	@RequestMapping(value = "/SearchPostServlet", method = RequestMethod.GET)
	public String searchMessage(@RequestParam(value="queryString") String queryString, Model model) {
		Message msg = new Message();
		model.addAttribute("messageBean", msg);
		
		// 空messageBean給分類查詢
		model.addAttribute("msgTypeBean", new MsgType());
		
		list = msgService.SearchPostActive(queryString);
		model.addAttribute("msgBeans", list);
		return "eeit10927/html/forum";
	}
	
//	@RequestMapping(value = "/SearchPostByType", method = RequestMethod.GET)
	public String searchMessageByTypeForm(Model model) {
		model.addAttribute("msgTypeBean", new MsgType());
		return "eeit10927/html/category";
	}
	
	@RequestMapping(value = "/SearchPostByType", method = RequestMethod.GET)
	public String searchMessageByType(Model model, 
			@ModelAttribute("msgTypeBean") MsgType msgTypeBean, 
			@RequestParam Integer typeId) {
		Message msg = new Message();
		model.addAttribute("messageBean", msg);
		
		list = msgService.SearchPostByTypeActive(typeId);
		model.addAttribute("msgBeans", list);
		return "eeit10927/html/forum";
	}
	
	@RequestMapping("/DisplayPageMessage")
	public String displayPage(Model model, HttpServletRequest request) {
		String pageNoStr = request.getParameter("pageNo");
		int pageNo = 1;
		if (pageNoStr == null) {
			pageNo = 1;
		} else {
			try {
				pageNo = Integer.parseInt(pageNoStr.trim());
			} catch (NumberFormatException e) {
				pageNo = 1;
			}
		}
		msgService.setPageNo(pageNo);
		msgService.setRecordsPerPage(recordsPerPage);
//		list = msgService.getPageMessages();
		list = msgService.getAllMessageActive();
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("totalPages", msgService.getTotalPages());
		// 查到的messageBean給forum.jsp
		model.addAttribute("msgBeans", list);
		// 空messageBean給postMsg.jsp
		model.addAttribute("messageBean", new Message());
		// 把總筆數、頁數傳給forum.jsp
		List<Message> allMsg = msgService.getAllMessageActive();
		int totalCounts = allMsg.size();
		model.addAttribute("totalCnt", totalCounts);
				
		return "eeit10927/html/forum";
	}
	
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String goCategory() {
		return "eeit10927/html/category";
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
