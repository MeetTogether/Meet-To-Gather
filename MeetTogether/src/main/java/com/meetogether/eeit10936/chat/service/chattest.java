package com.meetogether.eeit10936.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		return j.lrange("3940", 0, 1);
	}

}
