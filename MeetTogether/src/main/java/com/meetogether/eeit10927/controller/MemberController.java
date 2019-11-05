package com.meetogether.eeit10927.controller;

import java.io.File;
import java.sql.Blob;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.meetogether.eeit10927.model.Member;
import com.meetogether.eeit10927.service.IMemberService;

//@Controller
public class MemberController {
	IMemberService mService;
	@Autowired 
	public void setService(IMemberService mService) {
		this.mService = mService;
	}
	
	ServletContext context;
	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getMemberLoginForm(Model model) {
		Member member = new Member();
		model.addAttribute("memberBean", member);
		return "index";
	}
	
	@RequestMapping(value = "/LoginServlet", method = RequestMethod.POST)
	public String processMemberLoginForm(@ModelAttribute("memberBean") Member member, 
			BindingResult result, Model model, HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("errorMsg", errorMsg);
		boolean verifyAccount = mService.verifyAccount(member);
		
		HttpSession session = request.getSession();
		Member mBean = new Member();
		if (verifyAccount) {
			errorMsg.put("loginError", "");
			mBean = mService.findByEmail(member);

			session.setAttribute("userId", mBean.getMemberId());
			session.setAttribute("userName", mBean.getMemberName());
			session.setAttribute("admin", String.valueOf(mBean.getAdminTag()));
			System.out.println("member controller: mId: " + mBean.getMemberId() + 
					"\tmEmail: " + mBean.getMemberEmail() + 
					"\tadminTag: " + mBean.getAdminTag());

		} else {
			errorMsg.put("loginError", "帳密錯誤");
			return "index";
		}
		
		return "redirect:/GetAllPostServlet";
	}
	
//	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String getMemberRegisterForm(Model model) {
		Member member = new Member();
		model.addAttribute("memberBean", member);
		return "eeit10927/html/register";
	}
	
//	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String processMemberRegisterForm(@ModelAttribute("memberBean") Member member, 
			BindingResult result, Model model, HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("errorMsg", errorMsg);
		
		MultipartFile photo = member.getUploadphoto();
		String originalFilename = photo.getOriginalFilename();
		member.setFileName(originalFilename);
		if (photo != null && !photo.isEmpty()) {
			try {
				byte[] b = photo.getBytes();
				Blob blob = new SerialBlob(b);
				member.setPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		String captcha = (String) request.getSession().getAttribute("captcha");
		System.out.println("captcha register: " + captcha);
		boolean captCheck = false;
		if (member.getmChecksum().equals(captcha)) {
			captCheck = true;
		} 
		boolean accCheck = mService.mEmailExist(member);
		if(accCheck) {
			errorMsg.put("accError", "此帳號已存在");
		}
		if (captCheck == false) {
			errorMsg.put("captError", "驗證碼錯誤");
		}
		int memberId = 0;
		if (accCheck == false && captCheck == true) {
			memberId = mService.add(member);
			request.getSession().setAttribute("userEmail", member.getMemberEmail());
			request.getSession().setAttribute("userPwd", member.getMemberPassword());
		}
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String savedFilename = "Member-" + memberId + "-" + String.valueOf(System.currentTimeMillis()) + ext;
		mService.updateMemberImageFilename(memberId, savedFilename);
		String rootDirectory = "C:/temp/images/";
		try {
			File imageFolder = new File(rootDirectory, "member");
			if (!imageFolder.exists()) 
				imageFolder.mkdirs();
			File file = new File(imageFolder, savedFilename);
			photo.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		if (!errorMsg.isEmpty()) {
			return "forward:html/register";
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "/LogoutServlet")
	public String processMemberLogout(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
}
