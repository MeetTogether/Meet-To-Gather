package com.meetogether.eeit10901.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.service.MemberService;

@Controller
public class LoginController {
	MemberService mService;

	@Autowired
	public void setService(MemberService mService) {
		this.mService = mService;
	}

	@RequestMapping(value = "/LoginServlet", method = RequestMethod.POST)
	public String processMemberLoginForm(@ModelAttribute("memberBean") MemberBean member, BindingResult result,
			Model model, HttpServletRequest request, HttpServletResponse response) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("errorMsg", errorMsg);
		boolean verifyAccount = mService.verifyAccount(member);

		HttpSession session = request.getSession();
		MemberBean mBean = new MemberBean();
		if (verifyAccount) {
			errorMsg.put("loginError", "");
			mBean = mService.findByEmail(member);

			session.setAttribute("userId", mBean.getMemberId());
			session.setAttribute("userName", mBean.getMemberName());
			session.setAttribute("admin", String.valueOf(mBean.getAdminTag()));
			System.out.println("member controller: mId: " + mBean.getMemberId() + "\tmEmail: " + mBean.getMemberEmail()
					+ "\tadminTag: " + mBean.getAdminTag());

		} else {
			errorMsg.put("loginError", "帳號或密碼錯誤");
			return "index";
		}

		return "indexLoging";
	}

	@RequestMapping(value = "/LogoutServlet")
	public String processMemberLogout(Model model, HttpServletRequest request, HttpServletResponse response,
			SessionStatus sessionStatus) {
		HttpSession session = request.getSession();
		session.removeAttribute("currentUser");
		session.invalidate();
		sessionStatus.setComplete();
		return "redirect:/";
	}

}
