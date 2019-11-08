package com.meetogether.eeit10913.controller;

import java.io.File;
import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.service.MemberService;
import com.meetogether.eeit10913.model.ReviewBean;
import com.meetogether.eeit10913.service.ProductService;
import com.meetogether.eeit10927.model.Member;

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
	

	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String getaddReview(Model model) {
		ReviewBean rb = new ReviewBean();
		model.addAttribute("reviewBean", rb);
		return "eeit10913/addProduct";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String abc(@ModelAttribute("reviewBean")ReviewBean rb) {
		System.out.println(rb.getEventComment());
		System.out.println(rb.getEventStars());
		service.add(rb);
		return "redirect:/allreview";
	}
//	@RequestMapping(value = "/review", method = RequestMethod.POST)
//	public String processAddNewReview(@ModelAttribute("reviewBean") ReviewBean rb) {
//		service.add(rb);
//		return "index";
//	}

	@RequestMapping("/allreview")
	public String list(Model model) {
		List<ReviewBean> list = service.selectALL();
		model.addAttribute("review", list);
		return "eeit10913/products";
	}

}