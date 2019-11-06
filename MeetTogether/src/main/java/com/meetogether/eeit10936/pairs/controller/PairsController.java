package com.meetogether.eeit10936.pairs.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.meetogether.eeit10936.pairs.model.IMember;
import com.meetogether.eeit10936.pairs.service.IPairsService;

@Controller
@RequestMapping("/pairs")
@SessionAttributes("currentUser")
@Scope(value = "session")
public class PairsController {

	@Autowired
	private IPairsService service;

	@ModelAttribute("currentUser")
	public IMember currentUser(Model model, HttpSession session) {
		if (session.getAttribute("userId") != null) {
			return service.getMemberById((Integer) session.getAttribute("userId"));
		}
		return null;
	}

	@RequestMapping("/")
	public String pair(Model model) {
		if (model.getAttribute("currentUser") == null) {
			return "redirect:/";
		}
		return "eeit10936/pairs";
	}

	@GetMapping("/insertPairList")
	public void insertPairList(@ModelAttribute("currentUser") IMember currentUser,
			@RequestParam("pairid") Integer daterId, @RequestParam("status") Integer status) {
		service.likeOrDont(currentUser.getMemberBasic().getMemberId(), daterId, status);
	}

	@GetMapping(value = "/showPairMember", produces = "application/json;charset=utf-8")
	public @ResponseBody List<IMember> showPairMember(@ModelAttribute("currentUser") IMember currentUser) {
		List<IMember> memberlist = new ArrayList<IMember>();

		service.sortByDESValue(service.finalscoreMap(currentUser.getMemberBasic().getMemberCity(),
				currentUser.getMemberBasic().getMemberId())).forEach((i) -> {
					memberlist.add(service.getMemberById(i));
				});
		return memberlist;
	}

//	@GetMapping(value = "/memberPhoto", produces = "image/png")
//	public void showPhotos(@RequestParam("mid") Integer userId, HttpServletResponse response) {
//		IMember member = service.getMemberById(userId);
//		System.out.println(member.getMemberBasic().getMemberName());
//		service.getPhotosById(member).forEach((i) -> {
//			InputStream is;
//			try {
//				is = i.getBinaryStream();
//				ServletOutputStream os = response.getOutputStream();
//				int length;
//				byte[] buf = new byte[1024];
//				while ((length = is.read(buf)) != -1) {
//					os.write(buf, 0, length);
//				}
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		});
//
//	}
}
