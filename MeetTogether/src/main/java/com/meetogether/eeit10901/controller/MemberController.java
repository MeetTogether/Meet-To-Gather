package com.meetogether.eeit10901.controller;

import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.service.AlbumService;
import com.meetogether.eeit10901.service.MemberService;
import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10908.service.impl.ActService;
import com.meetogether.eeit10927.service.IMessageService;
import com.meetogether.eeit10936.friends.service.IFriendService;
import com.meetogether.eeit10936.pairs.model.MemberAlbum;
import com.meetogether.eeit10936.pairs.model.VipStatus;



@Controller

public class MemberController {
	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	MemberService mservice;

	@Autowired
	public void setService(MemberService service) {
		this.mservice = service;
	}
	
	@Autowired
	ActService actService;
	
	@Autowired
	IMessageService msgService;
	
	@Autowired
	AlbumService aService;
	@Autowired
	private IFriendService fService;

	
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getMemberLoginForm(Model model, HttpSession session) {
		if (session.getAttribute("userId") != null) {
			model.addAttribute("memberBean", new MemberBean());
			List<ActBean> beans = actService.getAllAct();	
			model.addAttribute("actBeanList", beans);
			List<MemberBean> memberBeans = msgService.getNewMember();
			model.addAttribute("newMembers", memberBeans);
			List<com.meetogether.eeit10927.model.Message> msgBeans = msgService.getPopularMsg();
			model.addAttribute("popMsgs", msgBeans);
			return "indexLoging";
		}
		MemberBean member = new MemberBean();
		model.addAttribute("memberBean", member);
		List<ActBean> beans = actService.getAllAct();	
		model.addAttribute("actBeanList", beans);
		List<MemberBean> memberBeans = msgService.getNewMember();
		model.addAttribute("newMembers", memberBeans);
		List<com.meetogether.eeit10927.model.Message> msgBeans = msgService.getPopularMsg();
		model.addAttribute("popMsgs", msgBeans);
		return "indexLoging";
	}
	
	@RequestMapping(value = "/upadateInfo/{id}", method = RequestMethod.GET)
	public String updateByInfoGet(Model model,@PathVariable Integer id)
			 {
		MemberBean member = mservice.getMemberById(id);
		System.out.println("編號："+member.getMemberId());
		model.addAttribute("updateInfo", member);
		System.out.println("password:"+ mservice.getMemberById(id).getMemberPassword());
		return "eeit10901/updateMember";
	}

	@RequestMapping(value = "/upadateInfo/{id}", method = RequestMethod.POST)
	public String updateByInfo(@ModelAttribute("updateInfo") MemberBean m, Model model) {
		System.out.println("編號"+m.getMemberId());
		System.out.println("email"+m.getMemberEmail());
		System.out.println("密碼"+m.getMemberPassword());
		System.out.println("檔名"+m.getFileName());
		System.out.println("縣市"+m.getMemberCity());
		System.out.println("性別"+m.getMemberSex());
		mservice.update(m);
		System.out.println("密碼2"+m.getMemberPassword());
		System.out.println("編號2"+m.getMemberId());
		System.out.println("email 2"+m.getMemberEmail());
	
		System.out.println("檔名2"+m.getFileName());
		System.out.println("縣市2"+m.getMemberCity());
		System.out.println("性別2"+m.getMemberSex());
	
//		model.addAttribute("vipBean", new VipStatus());
		model.addAttribute("member", mservice.getMemberById(m.getMemberId()));
		
	
		return "eeit10901/getMember";
	}
	


	
	
	
	
	@RequestMapping("/members")
	public String list(Model model) {
		List<MemberBean> list = mservice.selectALL();
		model.addAttribute("members", list);
		return "eeit10901/getMember";
	}

	@RequestMapping("/getmember")
	public String getMemberById(Model model, HttpServletRequest req) {
		Integer userId = (Integer) req.getSession().getAttribute("userId");
//		MemberBean member = new MemberBean();
//		model.addAttribute("memberForm", member);
		model.addAttribute("member", mservice.getMemberById(userId));
//		model.addAttribute("vipBean", new VipStatus());
		return "eeit10901/getMember";
	}
	
	
	@RequestMapping("/getmember/{fid}")
	public String getOtherMemberById(Model model, HttpSession session
										,@PathVariable("fid")Integer fid) {
		Integer currentUserId = (Integer) session.getAttribute("userId");		
		model.addAttribute("member", mservice.getMemberById(fid));
		model.addAttribute("friendStatus",fService.checkFriendList(currentUserId, fid));
		model.addAttribute("addFriendsAlready",fService.checkAddFriend(currentUserId, fid));
		model.addAttribute("responseYet",fService.checkResponse(currentUserId, fid));
		return "eeit10901/getMember";
	}

//	@RequestMapping(value="/register",method=RequestMethod.POST)
//	public String addRegister (@ModelAttribute("memberBean") MemberBean mm) {
////		Date test = mm.getMemberBirth();
//		 service.add(mm);
//		return "index";
//	}
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getaddRegister(Model model) {
		MemberBean mm = new MemberBean();
		model.addAttribute("memberBean", mm);
		return "eeit10901/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String addRegister(@ModelAttribute("memberBean") MemberBean member, BindingResult result, Model model,
			HttpServletRequest request, HttpServletResponse response, MemberAlbum album) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("errorMsg", errorMsg);
		model.addAttribute("vipBean", new VipStatus());
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		String captcha = (String) request.getSession().getAttribute("captcha");
		System.out.println("captcha register: " + captcha);
		System.out.println("captcha add: " + member.getmChecksum());
		boolean captCheck = false;
		captCheck = member.getmChecksum().equals(captcha);
		boolean accCheck = mservice.mEmailExist(member);
		if (accCheck) {
			errorMsg.put("accError", "此帳號已存在");
		}
		if (captCheck == false) {
			errorMsg.put("captError", "驗證碼錯誤");
		}
		
		MultipartFile picture = member.getMemberImage();
		String originalFilename = picture.getOriginalFilename();
		member.setFileName(originalFilename);
		System.out.println("--------memberController-originalFilename: " + originalFilename);
//		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//		String rootDirectory = context.getRealPath("/");
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				member.setPhoto(blob);
				System.out.println("--------memberController-blob: " + blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		if (!errorMsg.isEmpty()) {
			return "/eeit10901/register";
		}
		if (accCheck == false && captCheck == true) {
			int id=mservice.add(member);
			mservice.addAlbum(id);
			request.getSession().setAttribute("userEmail", member.getMemberEmail());
			request.getSession().setAttribute("userPwd", member.getMemberPassword());
		}

		final String Email = "109meettogether@gmail.com";// your Gmail
		final String EmailPwd = "eeit109*";// your password
		String host = "smtp.gmail.com";
		int port = 587;

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(Email, EmailPwd);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(Email));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(member.getMemberEmail()));
			message.setSubject("MeetTogether驗證信");// 主旨
			message.setText("請點選連結以開通帳號:" + "http://localhost:8080/MeetTogether/updateVerifyMailSucess?id="
					+ member.getMemberId());// 訊息

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, Email, EmailPwd);

			Transport.send(message);
//			transport.close();
			System.out.println("寄送email結束.");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
//		mservice.synchAlbum(id);

		return "redirect:registerSuccess";
	}

	@RequestMapping("/registerSuccess")
	public String registerSuccess(Model model) {
		model.addAttribute("vipBean", new VipStatus());
		return "eeit10901/registerSuccess";
	}

	@RequestMapping(value = "/updateVerifyMailSucess", method = RequestMethod.GET)
	public String updateVerifyMailSucess(@RequestParam(value = "id") Integer memberId, Model model) {
		mservice.updeatVerifyMail(memberId);
		model.addAttribute("vipBean", new VipStatus());
		return "eeit10901/verifyMailSuccess";
	}

	@RequestMapping("/interestPersonalInfo")
	public String InsertInterestPersonalInfo(Model model) {
		model.addAttribute("vipBean", new VipStatus());
		return "redirect:interestPersonalInfo";

	}
 

}
