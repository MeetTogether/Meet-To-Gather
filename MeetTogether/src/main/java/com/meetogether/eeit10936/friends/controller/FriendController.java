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

import com.meetogether.eeit10927.service.IMessageService;
import com.meetogether.eeit10936.chat.model.InMessage;
import com.meetogether.eeit10936.chat.service.ChatService;
import com.meetogether.eeit10936.friends.model.FriendList;
import com.meetogether.eeit10936.friends.service.IFriendService;

import net.bytebuddy.dynamic.scaffold.TypeWriter.FieldPool.Record;

@Controller
@RequestMapping("/friend")
public class FriendController {
	@Autowired
	private IFriendService fService;
	@Autowired
	private IMessageService mService;
	@Autowired
	private ChatService cService;

	@GetMapping(value = "/showFriendList", produces = "application/json;charset=utf-8")
	public @ResponseBody Map<Integer, String> showFriendList(HttpSession session) {
		Integer currentUserId = (Integer) session.getAttribute("userId");
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
	public String chat(Model model, @PathVariable("friendId") Integer fid,HttpSession session) {
		model.addAttribute("friendId", fid);
		if (session.getAttribute("userId") == null ){
			return "redirect:/";
		}
		return "eeit10936/chat";
	}

	@GetMapping(value = "/chat/record/{userId}/{friendId}", produces = "application/json;charset=utf-8")
	public @ResponseBody List<InMessage> getRecord(@PathVariable("userId") Integer uid,
			@PathVariable("friendId") Integer fid) {
		
		return cService.getRecord(uid, fid);
	}

}
