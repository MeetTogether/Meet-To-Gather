package com.meetogether.eeit10901.controller;

import java.sql.Blob;
import java.util.List;
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
import com.meetogether.eeit10901.service.MemberService;
import com.meetogether.eeit10927.model.Member;

@Controller
public class MemberController {
	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	MemberService service;

	@Autowired
	public void setService(MemberService service) {
		this.service = service;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getMemberLoginForm(Model model) {
		Member member = new Member();
		model.addAttribute("memberBean", member);
		return "index";
	}

	@RequestMapping("/members")
	public String list(Model model) {
		List<MemberBean> list = service.selectALL();
		model.addAttribute("members", list);
		return "eeit10901/getMember";
	}
	
	@RequestMapping("/getmembers")
	public String getMemberById(@PathVariable("member") Integer memberId, Model model)	{
		MemberBean mm = service.getMemberById(memberId);
		model.addAttribute("members", mm);
		return "members";
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
	public String addRegister(@ModelAttribute("memberBean") MemberBean member, BindingResult result,
			HttpServletRequest request) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}

		MultipartFile picture = member.getMemberImage();
		String originalFilename = picture.getOriginalFilename();
		member.setFileName(originalFilename);
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = context.getRealPath("/");
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				member.setPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}

		}
		service.add(member);
		
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
			message.setSubject("MeetTogether驗證信");//主旨
			message.setText("請點選連結以開通帳號:"
					+ "http://localhost:8080/MeetTogether/updateVerifyMailSucess?id="+member.getMemberId());//訊息

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, Email, EmailPwd);

			Transport.send(message);
//			transport.close();
			System.out.println("寄送email結束.");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		
		 
		
		return "redirect:registerSuccess";
	}

	@RequestMapping("/registerSuccess")
	public String registerSuccess() {
		return "eeit10901/registerSuccess";
	}

	
	@RequestMapping(value ="/updateVerifyMailSucess" ,method=RequestMethod.GET)
	public String updateVerifyMailSucess(@RequestParam(value="id") Integer memberId) {
		service.updeatVerifyMail(memberId);
		return "eeit10901/verifyMailSuccess";
	}

	
	 
	
}
