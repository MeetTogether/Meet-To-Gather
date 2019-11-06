package com.meetogether.eeit10936.friends.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meetogether.eeit10936.friends.model.FriendList;
import com.meetogether.eeit10936.friends.service.IFriendService;
import com.meetogether.eeit10936.pairs.model.IMember;
import com.meetogether.eeit10936.pairs.model.MemberModel;
import com.meetogether.eeit10936.pairs.service.IPairsService;

@Controller
@RequestMapping("/friend")
public class FriendController {
	@Autowired
	private IFriendService fService;
	@Autowired
	private IPairsService pService;

	@GetMapping(value = "/showFriendList", produces = "application/json;charset=utf-8")
	public @ResponseBody List<IMember> showFriendList(HttpSession session) {
		Integer currentUserId = (Integer) session.getAttribute("userId");
		System.out.println(currentUserId);
		List<FriendList> fList = fService.findFriendsById(currentUserId);
		List<IMember> mList = new ArrayList<IMember>();
		fList.forEach((i) -> {
			IMember member = new MemberModel();
			if (i.getMemberId().equals(currentUserId)) {
				member = pService.getMemberById(i.getFriendId());
			} else {
				member = pService.getMemberById(i.getMemberId());
			}
			mList.add(member);
		});

		return mList;

	}

}
