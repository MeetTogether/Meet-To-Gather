package com.meetogether.eeit10901.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meetogether.eeit10901.model.PersonalInfoBean;

import com.meetogether.eeit10901.service.PersonalInfoService;
import com.meetogether.eeit10936.pairs.model.MemberInfo;


@Controller
public class PersonalInfoController {
	ServletContext context;
	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}
	PersonalInfoService service;

	@RequestMapping(value="/personal", method=RequestMethod.GET)
	public String getAddNewProductForm(Model model) {
		MemberInfo pp = new MemberInfo();
		model.addAttribute("personalinfobean", pp);
		return "addPersonalInfo";
	}
	
	@RequestMapping(value="/personal", method=RequestMethod.POST)
	public String processAddNewProductForm
		(@ModelAttribute("personalinfobean") MemberInfo pp) {
		service.addPersonalInfo(pp);
		return "redirect:addPersonalHope";
	}
	
}
