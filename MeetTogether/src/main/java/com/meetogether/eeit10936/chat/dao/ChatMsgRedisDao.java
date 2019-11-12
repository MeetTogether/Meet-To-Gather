package com.meetogether.eeit10936.chat.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.meetogether.eeit10936.chat.model.InMessage;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Repository
public class ChatMsgRedisDao {

	@Autowired
	private JedisPool jedisPool;

	public void saveRecord(InMessage msg) {
		Jedis jedis = jedisPool.getResource();
		String key;
		key = msg.getTo() > msg.getFrom() ? msg.getFrom().toString() + msg.getTo().toString()
				: msg.getTo().toString() + msg.getFrom().toString();
		System.out.println(key);
		Gson gson = new GsonBuilder().create();
		System.out.println("聊天記錄進入Redis : " +gson.toJson(msg));
		jedis.lpush(key, gson.toJson(msg));

	}

}
