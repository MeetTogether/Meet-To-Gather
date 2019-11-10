package com.meetogether._00.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
	/**
	 * 注册端点，发布或者订阅消息的时候需要连接此端点 setAllowedOrigins 非必须，*表示允许其他域进行连接 withSockJS
	 * 表示开始sockejs支持
	 */
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/endpoint").setAllowedOrigins("*").withSockJS();
	}

	/**
	 * 配置消息代理(中介) enableSimpleBroker 服务端推送给客户端的路径前缀
	 * setApplicationDestinationPrefixes 客户端发送数据给服务器端的一个前缀 使用客户端一对一通信的时候 编配前缀
	 * 通常与@SendToUser 搭配使用
	 */
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {

		registry.enableSimpleBroker("/topic", "/chat");
		registry.setApplicationDestinationPrefixes("/app");
		

	}

}
