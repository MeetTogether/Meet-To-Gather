package com.meetogether._00.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
	/**
	 * 註冊地址，發布或訂閱消息的時候需要連接此 setAllowedOrigins 非必需，*表示允許其他網域連 withSockJS
	 * 表示支持sockejs
	 */
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/endpoint").setAllowedOrigins("*").withSockJS();
	}

	/**
	 * 配置消息代理(中介) enableSimpleBroker 服務端推送给客户端的路徑前缀
	 * setApplicationDestinationPrefixes 客户端發送數據给服務器端的前缀 使用客户端一對一通信的時候 编配前缀
	 * 通常與@SendToUser 搭配使用
	 */
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {

		registry.enableSimpleBroker("/topic", "/chat");
		registry.setApplicationDestinationPrefixes("/app");
		

	}

}
