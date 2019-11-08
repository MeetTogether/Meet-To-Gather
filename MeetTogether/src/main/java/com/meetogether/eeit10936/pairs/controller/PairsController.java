package com.meetogether.eeit10936.pairs.controller;

import java.io.InputStream;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.meetogether.eeit10936.friends.service.IFriendService;
import com.meetogether.eeit10936.pairs.model.IMember;
import com.meetogether.eeit10936.pairs.service.IPairsService;

@Controller
@RequestMapping("/pairs")
@SessionAttributes({"currentUser","vipstatus"})
@Scope(value = "session")
public class PairsController {

	@Autowired
	private IPairsService pService;
	@Autowired
	private IFriendService fService;

	@ModelAttribute("currentUser")
	public IMember currentUser(Model model, HttpSession session) {
		if (session.getAttribute("userId") != null) {
			Integer id = (Integer) session.getAttribute("userId");
			model.addAttribute("vipstatus", pService.checkVip(id));
			return pService.getMemberById(id);
		}
		return null;
	}

	@RequestMapping("noMore")
	public String noMore() {
		return "eeit10936/noMore";
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
		pService.likeOrDont(currentUser.getMemberBasic().getMemberId(), daterId, status);
		fService.addFriendList(currentUser.getMemberBasic().getMemberId(), daterId);
	}

	@GetMapping(value = "/showPairMember", produces = "application/json;charset=utf-8")
	public @ResponseBody String showPairMember(@ModelAttribute("currentUser") IMember currentUser,Model model) {
		List<IMember> memberlist = new ArrayList<IMember>();

		pService.sortByDESValue(pService.finalscoreMap(currentUser.getMemberBasic().getMemberCity(),
				currentUser.getMemberBasic().getMemberId())).forEach((i) -> {
					IMember member = pService.getMemberById(i);
					member.getMemberBasic().setMemberPassword(null);
					memberlist.add(member);
				});
		Gson gson = new GsonBuilder().setDateFormat("yyy-MM-dd").create();
		return gson.toJson(memberlist);
	}

	@GetMapping(value = "/memberPhoto/{mid}/{status}", produces = "image/png")
	public void showPhotos(@PathVariable("mid") Integer userId, @PathVariable("status") int status,
			HttpServletResponse response) {
		try {
			InputStream is = pService.getPhotosById(userId, status).getBinaryStream();
			ServletOutputStream os = response.getOutputStream();
			int length;
			byte[] buf = new byte[1024];
			while ((length = is.read(buf)) != -1) {
				os.write(buf, 0, length);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
