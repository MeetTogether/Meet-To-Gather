package com.meetogether._00.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.meetogether._00.config", "com.meetogether.eeit10927"})
public class WebAppConfig implements WebMvcConfigurer {

//	配置視圖解析器
	@Bean
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();	
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	@Override 
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	     registry.addResourceHandler("/eeit10927/styles/**").addResourceLocations("/WEB-INF/views/eeit10927/styles/");
	     registry.addResourceHandler("/eeit10927/js/**").addResourceLocations("/WEB-INF/views/eeit10927/js/");
	     registry.addResourceHandler("/eeit10927/images/**").addResourceLocations("/WEB-INF/views/eeit10927/images/");
	}
	
//	配置靜態資源處理
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
//	配置文件上傳處理
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(81920000);
		return resolver;
	}
	
}
