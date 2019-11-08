package com.meetogether.eeit10908.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10908.model.CatBean;
import com.meetogether.eeit10908.service.ActService;



@Controller
public class ActController {


	ActService service;
	
	@Autowired
	public void setService(ActService service) {
		this.service = service;
	}
	@RequestMapping("/")
	public String index(Model model) {
		List<ActBean> beans = service.getAllAct();
		model.addAttribute("actBeanList",beans);
		return "index";
	}
	


	@RequestMapping(value = "/addActis", method = RequestMethod.GET)
	public String getAddNewProductForm(Model model) {
		System.out.println("--------------+++------------");
	    ActBean aa = new ActBean();
	    aa.setGroupNum("9");
	    model.addAttribute("actBean", aa); 
	    return "insertAct";
	}
	 
	@RequestMapping(value = "/addActis", method = RequestMethod.POST)
	public String processAddNewProductForm(@ModelAttribute("actBean") ActBean aa
			) {
		System.out.println("******--+-");
//		System.out.println("******"+aa.getEventCat());
		service.addActivity(aa);
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "/index/deleteActivity")
	public String delete(@RequestParam("getId") int ActId) {
		 service.deleteActivity(ActId);

		 return "redirect:/";
	}
	
	
	
	
	@RequestMapping(value = "/actdata", method = RequestMethod.GET)
	public String getActByIdForm(@RequestParam("getId") Integer id,Model model) {
		System.out.println("--------------+++------------");
		model.addAttribute("actdata",service.getActivityById(id));
//		ActBean aa = new ActBean();
	   // model.addAttribute("actdata", aa); 
	    return "Actdata";
	}

	@RequestMapping(value = "/actdata", method = RequestMethod.POST)
	public String updateActByIdForm(@ModelAttribute("actdata") ActBean aa
			) {
		System.out.println("******--+-");
		System.out.println(aa.getEventId());
		System.out.println(aa.getMemberId());
		System.out.println(aa.getEventName());
		System.out.println(aa.getEventCat());
		System.out.println(aa.getEventTime());
		System.out.println(aa.getEventPlace());
		System.out.println(aa.getBudget());
		System.out.println(aa.getCreateTime());
		System.out.println(aa.getCatbean());
//		System.out.println("******"+aa.getEventCat());
		service.updateActivity(aa);
		return "redirect:/";
	}
	
	
	@ModelAttribute("catList") //jsp識別字串
	public Map<Integer, String> getCompanyList() {
	    Map<Integer, String> companyMap = new HashMap<>();
	    List<CatBean> list = service.getCatList();
	    for (CatBean cb : list) {
	        companyMap.put(cb.getEventCat(), cb.getEventClass());
	    }
	    return companyMap;
	}
	
	
}
