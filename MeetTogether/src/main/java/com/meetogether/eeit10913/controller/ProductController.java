package com.meetogether.eeit10913.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	ProductService service;

	@Autowired
	public void setService(ProductService service) {
		this.service = service;
	}


//新增方法
	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String getaddReview(Model model, HttpServletRequest request) {
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		ReviewBean rb = new ReviewBean();
		model.addAttribute("reviewBean", rb);
		return "eeit10913/addProduct";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String abc(@ModelAttribute("reviewBean") ReviewBean rb) {
		System.out.println(rb.getEventComment());
		System.out.println(rb.getEventStars());
		System.out.println("rb1111111:::::::" + rb);
		service.add(rb);
		return "redirect:/allreview";
	}

//查詢所有
	@RequestMapping("/allreview")
	public String list(Model model, @ModelAttribute("ReviewBean") ReviewBean reviewBean, Integer avgEventStar) {
		System.out.println("@RequestMapping(\"/eeit10913/products2/avgEventStar\") =========== ");
		List<ReviewBean> list = service.selectALL();
		Integer reviewSize = list.size();
		Integer totalEventStar = 0;
		avgEventStar = 0;
		for (ReviewBean rb : list) {
			// totalEventStar = totalEventStar + reviewBean.getEventStars();
			totalEventStar += rb.getEventStars();
		}
		System.out.println("==========" + totalEventStar);
		avgEventStar = totalEventStar / reviewSize;
		System.out.println("totalEventStar/reviewSize=avgEventStar =========== " + avgEventStar);
		model.addAttribute("review", list);
		model.addAttribute("avgEventStar", avgEventStar);
		model.addAttribute("vipBean", new VipStatus());
		// return "eeit10913/products";
		return "eeit10913/products2";
	}



}