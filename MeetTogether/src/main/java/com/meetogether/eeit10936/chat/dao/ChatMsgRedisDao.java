package com.meetogether.eeit10936.chat.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.meetogether.eeit10936.chat.model.InMessage;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Repository
@PropertySource(value = { "classpath:db.properties" })
public class ChatMsgRedisDao {
	
	@Autowired
	Environment env;

	@Autowired
	private JedisPool jedisPool;

	@SuppressWarnings("unused")
	private String getKey(Integer from, Integer to) {
		String key;
		return key = to > from ? from.toString() + to.toString() : to.toString() + from.toString();
	}

	public void saveRecord(InMessage msg) {

		String key = getKey(msg.getFrom(), msg.getTo());
		System.out.println("redis KEY : " + key);
		Gson gson = new GsonBuilder().create();
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			jedis.lpush(key, gson.toJson(msg));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jedis.close();
		}
		System.out.println("聊天記錄進入Redis : " + gson.toJson(msg));
	}

	public List<InMessage> getRecord(Integer from, Integer to) {
		Jedis jedis = null;
		String key = getKey(from, to);
		try {
			jedis = jedisPool.getResource();
			List<String> recordListFromRedis = jedis.lrange(key, 0, 5);
			List<InMessage> recordList = new ArrayList<InMessage>();
			System.out.println("對話紀錄長度 : " + recordListFromRedis.size());
			if(recordListFromRedis.size() == 0) {
				InMessage msg = new InMessage(0,env.getProperty("msgDefault"),new Date(System.currentTimeMillis())); 
				Gson gson = new GsonBuilder().create();
				jedis.lpush(key, gson.toJson(msg));
				recordListFromRedis = jedis.lrange(key, 0, 5);
			}
			Gson gson =new Gson();
			recordListFromRedis.forEach((i)->{
				recordList.add(gson.fromJson(i, InMessage.class));
			});
			Collections.reverse(recordList);
			return recordList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			jedis.close();
		}
	}
	
	public void saveDefaultRecord() {
		
	}

}
