package com.meetogether.eeit10927.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10927.service.IVipStatusService;
import com.meetogether.eeit10936.pairs.model.VipStatus;

@Controller
public class VipStatusController {
	
	IVipStatusService vipService;
	@Autowired
	public void setMrService(IVipStatusService vipService) {
		this.vipService = vipService;
	}
	
	@RequestMapping(value = "/VipBuy", method = RequestMethod.GET)
	public String getVipBuyForm(Model model) {
		model.addAttribute("vipBean", new VipStatus());
		return "eeit10927/html/vipBuy";
	}
	
	@RequestMapping(value = "/VipBuy", method = RequestMethod.POST)
	public String getVipBuy(Model model, @ModelAttribute("vipBean") VipStatus vip) {
		vipService.add(vip);
//		model.addAttribute("memberBean", new MemberBean());
		return "redirect:/";
	}
	
}
