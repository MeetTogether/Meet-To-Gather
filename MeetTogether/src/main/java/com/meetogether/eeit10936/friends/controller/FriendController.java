package com.meetogether.eeit10936.friends.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.meetogether.eeit10927.service.IMessageService;
import com.meetogether.eeit10936.friends.model.FriendList;
import com.meetogether.eeit10936.friends.service.IFriendService;

@Controller
@RequestMapping("/friend")
@SessionAttributes("currentUser")
public class FriendController {
	@Autowired
	private IFriendService fService;
	@Autowired
	private IMessageService mService;

	@GetMapping(value = "/showFriendList", produces = "application/json;charset=utf-8")
	public @ResponseBody Map<Integer, String> showFriendList(HttpSession session) {
		Integer currentUserId = (Integer) session.getAttribute("userId");
		System.out.println(currentUserId);
		List<FriendList> fList = fService.findFriendsById(currentUserId);
		Map<Integer, String> mMap = new HashMap<>();
		fList.forEach((i) -> {
			String memberName = null;
			Integer memberIdInteger = null;
			if (i.getMemberId().equals(currentUserId)) {
				memberIdInteger = i.getFriendId();
				memberName = mService.getMemberById(i.getFriendId()).getMemberName();
			} else {
				memberIdInteger = i.getMemberId();
				memberName = mService.getMemberById(i.getMemberId()).getMemberName();
			}
			mMap.put(memberIdInteger, memberName);
		});

		return mMap;

	}

	@RequestMapping(value = "/chat/{friendId}", method = RequestMethod.GET)
	public String chat(Model model, @PathVariable("friendId") Integer fid) {
		model.addAttribute("friendId", fid);
		return "eeit10936/chat";
	}

}
