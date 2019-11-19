package com.meetogether.eeit10901.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.service.IPersonalInterestService;
import com.meetogether.eeit10901.service.MemberService;
import com.meetogether.eeit10901.service.PersonalInfoService;
import com.meetogether.eeit10936.pairs.model.MemberInfo;
import com.meetogether.eeit10936.pairs.model.MemberInterest;
import com.meetogether.eeit10936.pairs.model.MemberInterestPK;


@Controller
public class PersonalInfoController {
	ServletContext context;
	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}
	@Autowired
	PersonalInfoService pService;
	@Autowired
	MemberService mService;
	@Autowired
	IPersonalInterestService interestService;

	@RequestMapping(value="/personal", method=RequestMethod.GET)
	public String getAddInfoForm(Model model, HttpServletRequest request, MemberInfo personalinfo) {
		Integer userId = (Integer) request.getSession().getAttribute("userId");
	
		MemberBean member = mService.getMemberById(userId);
	
		
		model.addAttribute("member", member);
	
		MemberInfo ii = new MemberInfo();
	    model.addAttribute("infoBean", ii); 
		
		return "eeit10901/addPersonalInfo";
	}
	
	@RequestMapping(value="/personal", method=RequestMethod.POST)
	public String processAddInfoForm(@ModelAttribute("infoBean") MemberInfo ii, HttpServletRequest request) {
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		System.out.println("gggg"+ii.getBodyType());
		ii.setMemberId(userId);
		pService.addPersonalInfo(ii);
		System.out.println("ffffff"+ii.getBodyType());
		return "eeit10901/personalInfo";
	}


	@RequestMapping(value="/personalInterest", method=RequestMethod.GET)
	public String getAddInterestForm(Model model, HttpServletRequest request) {
		
		model.addAttribute("interestBean", new MemberInterest());
	
		return "eeit10901/addPersonalInterest";
	}
	
	@RequestMapping(value="/personalInterest", method=RequestMethod.POST)
	public String processAddInterestForm(Model model, HttpServletRequest request, HttpSession session) {
		MemberInterestPK miPK = new MemberInterestPK();
		MemberInterest mi = new MemberInterest();
		Integer userId = (Integer) session.getAttribute("userId");
		int interest1 = 0;
		int interest2 = 0;
		int interest3 = 0;
		int interest4 = 0;
		int interest5 = 0;
		int interest6 = 0;
		int interest7 = 0;
		if (request.getParameter("Interest1") != null) {
			interest1 = Integer.parseInt(request.getParameter("Interest1"));
			miPK.setMemberId(userId);
			miPK.setInterestId(interest1);
			mi.setMemberInterestPK(miPK);
			interestService.addPersonalInfo(mi);
		}
		if (request.getParameter("Interest2") != null) {
			interest2 = Integer.parseInt(request.getParameter("Interest2"));
			miPK.setMemberId(userId);
			miPK.setInterestId(interest2);
			mi.setMemberInterestPK(miPK);
			interestService.addPersonalInfo(mi);
		}
		if (request.getParameter("Interest3") != null) {
			interest3 = Integer.parseInt(request.getParameter("Interest3"));
			miPK.setMemberId(userId);
			miPK.setInterestId(interest3);
			mi.setMemberInterestPK(miPK);
			interestService.addPersonalInfo(mi);
		}
		if (request.getParameter("Interest4") != null) {
			interest4 = Integer.parseInt(request.getParameter("Interest4"));
			miPK.setMemberId(userId);
			miPK.setInterestId(interest4);
			mi.setMemberInterestPK(miPK);
			interestService.addPersonalInfo(mi);
		}
		if (request.getParameter("Interest5") != null) {
			interest5 = Integer.parseInt(request.getParameter("Interest5"));
			miPK.setMemberId(userId);
			miPK.setInterestId(interest5);
			mi.setMemberInterestPK(miPK);
			interestService.addPersonalInfo(mi);
		}
		if (request.getParameter("Interest6") != null) {
			interest6 = Integer.parseInt(request.getParameter("Interest6"));
			miPK.setMemberId(userId);
			miPK.setInterestId(interest6);
			mi.setMemberInterestPK(miPK);
			interestService.addPersonalInfo(mi);
		}
		if (request.getParameter("Interest7") != null) {
			interest7 = Integer.parseInt(request.getParameter("Interest7"));
			miPK.setMemberId(userId);
			miPK.setInterestId(interest7);
			mi.setMemberInterestPK(miPK);
			interestService.addPersonalInfo(mi);
		}
		
		return "eeit10901/addPersonalInterest";
	}

}
