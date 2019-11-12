package com.meetogether.eeit10913.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10913.model.ReviewBean;
import com.meetogether.eeit10913.service.ProductService;

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
//	@RequestMapping(value = "/getOneReview")
//	public String getOneReview(@RequestParam(value="reviewId") Integer reviewId,Model model) {
//		ReviewBean rb = service.getReviewById(reviewId);
//		model.addAttribute("product",rb);
//		return "/review";
//	}
	
//新增方法
	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String getaddReview(Model model) {
		ReviewBean rb = new ReviewBean();
		model.addAttribute("reviewBean", rb);
		return "eeit10913/addProduct";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String abc(@ModelAttribute("reviewBean") ReviewBean rb) {
		System.out.println(rb.getEventComment());
		System.out.println(rb.getEventStars());
		service.add(rb);
		return "redirect:/allreview";
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
//查詢所有
	@RequestMapping("/allreview")
	public String list(Model model) {
		List<ReviewBean> list = service.selectALL();
		model.addAttribute("review", list);
		return "eeit10913/products";
	}

}