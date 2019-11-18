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

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10913.model.ReviewBean;
import com.meetogether.eeit10913.service.ProductService;

@Controller
public class ProductController2 {
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
	
	//修改方法
		@RequestMapping(value = "/editProduct", method = RequestMethod.GET)
		public String getActByIdForm(@RequestParam("reviewId") Integer reviewId,Model model) {
			System.out.println("reviewId => " + reviewId);
			model.addAttribute("editProduct",service.getReviewById(reviewId));
		    return "eeit10913/editProduct";
		}
		
		@RequestMapping(value = "/editProduct", method = RequestMethod.POST)
		public String update(@ModelAttribute("editProduct") ReviewBean aa) {
			service.update(aa);
			return "redirect:/allreview";
		}
	

}