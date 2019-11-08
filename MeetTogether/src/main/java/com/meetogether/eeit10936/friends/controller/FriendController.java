package com.meetogether.eeit10936.friends.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meetogether.eeit10927.service.IMessageService;
import com.meetogether.eeit10936.friends.model.FriendList;
import com.meetogether.eeit10936.friends.service.IFriendService;

@Controller
@RequestMapping("/friend")
public class FriendController {
	@Autowired
	private IFriendService fService;
	@Autowired
	private IMessageService mService;

	@GetMapping(value = "/showFriendList", produces = "application/json;charset=utf-8")
	public @ResponseBody List<String> showFriendList(HttpSession session) {
		Integer currentUserId = (Integer) session.getAttribute("userId");
		System.out.println(currentUserId);
		List<FriendList> fList = fService.findFriendsById(currentUserId);
		List<String> mList = new ArrayList<String>();
		fList.forEach((i) -> {
			String member = null;
			if (i.getMemberId().equals(currentUserId)) {
				member = mService.getMemberById(i.getFriendId()).getMemberName();
			} else {
				member = mService.getMemberById(i.getMemberId()).getMemberName();
			}
			mList.add(member);
		});

		return mList;

	}

}
