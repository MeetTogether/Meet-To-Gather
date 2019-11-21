package com.meetogether.eeit10936.friends.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.service.MemberService;
import com.meetogether.eeit10927.service.IMessageService;
import com.meetogether.eeit10936.chat.model.InMessage;
import com.meetogether.eeit10936.chat.service.ChatService;
import com.meetogether.eeit10936.friends.model.FriendList;
import com.meetogether.eeit10936.friends.model.FriendListUnread;
import com.meetogether.eeit10936.friends.service.IFriendService;

@Controller
public class FriendController {
	@Autowired
	private IFriendService fService;
	@Autowired
	private IMessageService mService;
	@Autowired
	private ChatService cService;
	@Autowired
	private MemberService mbService;

	@GetMapping(value = "/showFriendList", produces = "application/json;charset=utf-8")
	public @ResponseBody List<FriendListUnread> showFriendList(HttpSession session, Model model) {
		Integer currentUserId = (Integer) session.getAttribute("userId");
		List<FriendList> fList = fService.findFriendsById(currentUserId);
		List<FriendListUnread> lflu =new ArrayList<FriendListUnread>();
		fList.forEach((i) -> {
			FriendListUnread flu =new FriendListUnread();
			String memberName = null;
			Integer memberIdInteger = null;
			if (i.getMemberId().equals(currentUserId)) {
				memberIdInteger = i.getFriendId();
				memberName = mService.getMemberById(i.getFriendId()).getMemberName();
			} else {
				memberIdInteger = i.getMemberId();
				memberName = mService.getMemberById(i.getMemberId()).getMemberName();
			}
			flu.setId(memberIdInteger);
			flu.setName(memberName);
			flu.setUnRead(cService.getUnreadMsg(currentUserId.toString(), memberIdInteger.toString()));
			lflu.add(flu);
		});
		return lflu;

	}
	@GetMapping(value = "/showFriendListByName", produces = "application/json;charset=utf-8")
	public @ResponseBody List<FriendListUnread> showFriendListByName(@RequestParam(value = "fName",required = true,defaultValue = "") String fName,
																HttpSession session, Model model){
		Integer currentUserId = (Integer) session.getAttribute("userId");
		List<FriendListUnread> lflu =new ArrayList<FriendListUnread>();
		Map<Integer, String> mp = fService.findFriendsByName(currentUserId,fName);
		mp.forEach((k, v) -> {
			FriendListUnread friendListUnread =new FriendListUnread();
			friendListUnread.setId(k);
			friendListUnread.setName(v);
			friendListUnread.setUnRead(cService.getUnreadMsg(currentUserId.toString(), k.toString()));
			lflu.add(friendListUnread);
		});
		
		return lflu;
				
	}

	@RequestMapping(value = "/chat/{friendId}", method = RequestMethod.GET)
	public String chat(Model model, @PathVariable("friendId") Integer fid, HttpSession session) {
		MemberBean mb = mbService.getMemberById(fid);
		model.addAttribute("friendName",mb.getMemberName());
		model.addAttribute("friendId", fid);
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		return "eeit10936/chat";
	}

	@GetMapping(value = "/chat/record/{userId}/{friendId}", produces = "application/json;charset=utf-8")
	public @ResponseBody List<InMessage> getRecord(@PathVariable("userId") Integer uid,
			@PathVariable("friendId") Integer fid) {

		return cService.getRecord(uid, fid);
	}
	@RequestMapping("/test/{fid}")
	public String test(HttpSession session,@PathVariable("fid") Integer fid,Model model) {
		Integer currentUserId = (Integer)session.getAttribute("userId");
		model.addAttribute("friendStatus",fService.checkFriendList(currentUserId, fid));
		model.addAttribute("addFriendsAlready",fService.checkAddFriend(currentUserId, fid));
		model.addAttribute("responseYet",fService.checkResponse(currentUserId, fid));
		

		return "eeit10936/test";
		
	}
	@RequestMapping(value = "/del",method = RequestMethod.GET)
	public String delFriend(HttpSession session,@RequestParam("fid")Integer fid) {
		Integer userId = (Integer)session.getAttribute("userId");
		fService.deleteFriends(userId, fid);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/invite",method = RequestMethod.GET)
	public String inviteFriend(HttpSession session,@RequestParam("fid")Integer fid) {
		Integer userId = (Integer)session.getAttribute("userId");
		fService.invite(userId, fid);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/invite",method = RequestMethod.GET)
	public String inviteFriend(HttpSession session,@RequestParam("fid")Integer fid,@RequestParam("sureOrRefuse") Integer sureOrRefuse ) {
		Integer userId = (Integer)session.getAttribute("userId");
		fService.response(f1id, f2id, status);
		return "redirect:/";
	}
	
	
	

}
