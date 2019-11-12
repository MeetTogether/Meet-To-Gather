package com.meetogether.eeit10936.chat.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.meetogether.eeit10936.chat.model.InMessage;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;



@Controller
public class chattest {
	@Autowired
	JedisPool jPool;
	@RequestMapping(value = "/test",produces = "application/json;charset=utf-8")
	public @ResponseBody List<String> test(){
		Jedis j = jPool.getResource();
//		j.flushAll();
		List<String> l = j.lrange("3940", 0, 1);
		Gson gson =new Gson();
	
		l.forEach((i)->{
			InMessage a=gson.fromJson(i, InMessage.class);
			System.out.println(a.getFrom());
			System.out.println(a.getTo());
			System.out.println(a.getContent());
			System.out.println(a.getTime());
		});
		
		
		return j.lrange("3940", 0, 1);
	}

}
