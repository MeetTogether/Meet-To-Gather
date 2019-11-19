package com.meetogether.eeit10913.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.meetogether.eeit10908.service.impl.ActService;
import com.meetogether.eeit10913.model.ReviewBean;
import com.meetogether.eeit10913.service.ProductService;
import com.meetogether.eeit10936.pairs.model.VipStatus;

@Controller
public class ProductController {
	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

//	活動的service
	ActService service1;
	@Autowired
	public void setService1(ActService service1) {
		this.service1 = service1;
	}
//  評論的service
	ProductService service;
	@Autowired
	public void setService(ProductService service) {
		this.service = service;
	}


//新增方法
	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String getaddReview(Model model, HttpServletRequest request) {
//		Integer userId1 = (Integer) request.getSession().getAttribute("userId");
//		System.out.println("userId ===================  "+userId1);
		ReviewBean rb = new ReviewBean();
		System.out.println("rb ===================  "+rb);
//		model.addAttribute("event",service1.getActivityById(actId));
		model.addAttribute("reviewBean", rb);
		return "eeit10913/addProduct";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String abc(@ModelAttribute("reviewBean") ReviewBean rb, 
			@RequestParam(value = "eventId") Integer eventId) {
//		rb.setEvent(service1.getActivityById(eventId));
		rb.setEventId(eventId);
		System.out.println(rb.getEventComment());
		System.out.println(rb.getEventStars());
		System.out.println("rb1111111:::::::" + rb);
//		service.add(ab);
		service.add(rb);
		
		return "redirect:/allreview";
	}

//查詢所有
	@RequestMapping("/allreview")
	public String list(Model model, @ModelAttribute("ReviewBean") ReviewBean reviewBean, Integer avgEventStar) {
		System.out.println("@RequestMapping(\"/eeit10913/products2/avgEventStar\") =========== ");
//		List<ReviewBean> list = service.selectALL();
		List<ReviewBean> list = service.selectALLByEventId(reviewBean.getEventId());
		System.out.println(reviewBean.getEventId()+"============================reviewBean.getEventId()");
		Integer reviewSize = list.size();
		Integer totalEventStar = 0;
		Integer one = 0;
		Integer two = 0;
		Integer three = 0;
		Integer four = 0;
		Integer five = 0;
		avgEventStar = 0;
	
		for (ReviewBean rb : list) {
			// totalEventStar = totalEventStar + reviewBean.getEventStars();
			totalEventStar += rb.getEventStars();
			if(rb.getEventStars()==1)++one;
			else if(rb.getEventStars()==2)++two;
			else if(rb.getEventStars()==3)++three;
			else if(rb.getEventStars()==4)++four;
			else if(rb.getEventStars()==5)++five;
			else {
				System.out.println("Exception ==== rb.getEventStars() ===== "+rb.getEventStars());
			}
		}
		System.out.println("==========" + totalEventStar);
		avgEventStar = totalEventStar / reviewSize;
		System.out.println("totalEventStar/reviewSize=avgEventStar =========== " + avgEventStar);
		model.addAttribute("review", list);
		model.addAttribute("avgEventStar", avgEventStar);
		model.addAttribute("one", one);
		model.addAttribute("two", two);
		model.addAttribute("three", three);
		model.addAttribute("four", four);
		model.addAttribute("five", five);
		model.addAttribute("vipBean", new VipStatus());
		// return "eeit10913/products";
		return "eeit10913/products2";
	}
	
	 
	
	



}