package com.meetogether.eeit10936.chat.service;

import redis.clients.jedis.Jedis;

public class test {
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Jedis jedis = new Jedis("localhost");
		jedis.auth("Passw0rd");
		System.out.println("Server is running: "+jedis.ping());
        jedis.set("me", "Roger");
//		jedis.del("me");
		System.out.println(jedis.get("me"));
	}

}
