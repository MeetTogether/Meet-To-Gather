package com.meetogether.eeit10901.controller;

import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.model.PersonalInfoBean;
import com.meetogether.eeit10901.service.MemberService;
import com.meetogether.eeit10901.service.PersonalInfoService;

import com.meetogether.eeit10936.pairs.model.MemberInfo;


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

	@RequestMapping(value="/personal/{memberId}", method=RequestMethod.GET)
	public String getAddInfoForm(Model model, HttpServletRequest request, MemberInfo personalinfo, 
			@PathVariable(value="memberId") Integer memberId) {
		Integer userId = (Integer) request.getSession().getAttribute("userId");
	
		MemberBean member = mService.getMemberById(memberId);
	
		
		model.addAttribute("member", member);
	
		MemberInfo ii = new MemberInfo();
	    model.addAttribute("infoBean", ii); 
		
		return "eeit10901/addPersonalInfo";
	}
	
	@RequestMapping(value="/personal", method=RequestMethod.POST)
	public String processAddInfoForm
		(@ModelAttribute("infoBean") MemberBean member,  MemberInfo ii) {
		pService.addPersonalInfo(ii);
		return "eeit10901/addPersonalInfo";
	}



}
