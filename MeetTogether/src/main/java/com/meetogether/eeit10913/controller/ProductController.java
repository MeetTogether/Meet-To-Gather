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
//	ProductService service;
//
//	@Autowired 
//	public void setService(ProductService service) {
//		this.service = service;
//	}
//
//	@RequestMapping("/products")
//	public String list(Model model) {
//		List<ReviewBean>  list = service.selectALL();
//		model.addAttribute("products", list);
//		return "products";
//	}

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

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getMemberLoginForm(Model model) {
		Member member = new Member();
		model.addAttribute("memberBean", member);
		return "index";
	}

	@RequestMapping("/allreview")
	public String list(Model model) {
		List<ReviewBean> list = service.selectALL();
		model.addAttribute("members", list);
		return "index";
	}
//	@RequestMapping("/update")
//	public String updateStock(Model model) {
//		service.update(null);
//		return "redirect:/members";
//	}

	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String getaddReview(Model model) {
		MemberBean mm = new MemberBean();
		model.addAttribute("reviewBean", mm);
		return "addProduct";
	}

	@RequestMapping(value = "/review", method = RequestMethod.POST)
	public String addReview(@ModelAttribute("reviewBean") MemberBean member, BindingResult result,
			HttpServletRequest request) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		
		return "allreview";

//		MultipartFile memberImage = member.getMemberImage();
//		String originalFilename = memberImage.getOriginalFilename();
//		member.setFileName(originalFilename);
//		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//		String rootDirectory = context.getRealPath("/");
//		//  建立Blob物件，交由 Hibernate 寫入資料庫
//		if (memberImage != null && !memberImage.isEmpty() ) {
//			try {
//				byte[] b = memberImage.getBytes();
//				Blob blob = new SerialBlob(b);
////				member.getFileName()(blob);
//			} catch(Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//			}
//		}
//		service.add(member);
//		//  將上傳的檔案移到指定的資料夾
//		try {
//			File imageFolder = new File(rootDirectory, "images");
//			if (!imageFolder.exists()) imageFolder.mkdirs();
//			File file = new File(imageFolder, member.getMemberId()+ ext);
//			memberImage.transferTo(file);
//		} catch(Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//		}
//		return "redirect:/register";
//	}

	
}}