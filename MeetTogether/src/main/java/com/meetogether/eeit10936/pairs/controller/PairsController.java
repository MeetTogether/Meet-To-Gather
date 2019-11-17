package com.meetogether.eeit10936.pairs.controller;

import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.PostMapping;
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
@SessionAttributes({ "currentUser", "vipstatus" })
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

	@RequestMapping("/pairs")
	public String pair(Model model) {
		if (model.getAttribute("currentUser") == null) {
			return "redirect:/";
		}
		return "pairsUpdate2";
	}

	@GetMapping("/insertPairList")
	public void insertPairList(@ModelAttribute("currentUser") IMember currentUser,
			@RequestParam("pairid") Integer daterId, @RequestParam("status") Integer status) {
		pService.likeOrDont(currentUser.getMemberBasic().getMemberId(), daterId, status);
		fService.addFriendList(currentUser.getMemberBasic().getMemberId(), daterId);
	}

	@PostMapping(value = "/showPairMember", produces = "application/json;charset=utf-8")
	public @ResponseBody String showPairMember(@ModelAttribute("currentUser") IMember currentUser,
			@RequestParam("sex") Integer sex, @RequestParam("city") String city, @RequestParam("age1") Integer age1,
			@RequestParam("age2") Integer age2, Model model) {
		List<IMember> memberlist = new ArrayList<IMember>();
		pService.sortByDESValue(pService.finalscoreMap(currentUser.getMemberBasic().getMemberCity(),
				currentUser.getMemberBasic().getMemberId())).forEach((i) -> {
					IMember member = pService.getMemberById(i);
					System.out.println(getCondition(sex, city, age1, age2, member));
					if (getCondition(sex, city, age1, age2, member)) {
						member.getMemberBasic().setMemberPassword(null);
						memberlist.add(member);
					}
				});
		Gson gson = new GsonBuilder().setDateFormat("yyy-MM-dd").create();
		return gson.toJson(memberlist);
	}

	private Integer getAge(Date birth) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis() - birth.getTime());
		return calendar.get(Calendar.YEAR) - 1970;
	}

	private boolean getCondition(Integer sex, String city, Integer age1, Integer age2, IMember member) {
		Integer userAge = getAge(member.getMemberBasic().getMemberBirth());
		String userCity = member.getMemberBasic().getMemberCity().trim();
		Integer userSex = member.getMemberBasic().getMemberSex();
		String everyCity = "everyCity";
		Integer everySex = 3;
		Integer everyAge1 = 18;
		Integer everyAge2 = 99;
		if (sex == everySex && city.equals(everyCity) && age1 == everyAge1 && age2 == everyAge2) 
			return true;
		if (sex == userSex && city.equals(everyCity) && age1 == everyAge1 && age2 == everyAge2) 
			return true;
		if (sex == everySex && city.equals(userCity) && age1 == everyAge1 && age2 == everyAge2) 
			return true;
		if (sex == everySex && city.equals(everyCity) && (userAge >= age1 && userAge <= age2)) 
			return true;
		if (sex == userSex && city.equals(userCity) && age1 == everyAge1 && age2 == everyAge2) 
			return true;
		if (sex == userSex && city.equals(everyCity) && (userAge >= age1 && userAge <= age2)) 
			return true;
		if (sex == everySex && city.equals(userCity) && (userAge >= age1 && userAge <= age2)) 
			return true;
		if (sex == userSex && city.equals(userCity) && (userAge >= age1 && userAge <= age2)) 
			return true;
	
		return false;
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
			e.printStackTrace();
		}

	}
}
