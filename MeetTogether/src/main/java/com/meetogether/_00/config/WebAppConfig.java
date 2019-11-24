package com.meetogether._00.config;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.meetogether.eeit10927.converter.MessageConverter;
import com.meetogether.eeit10927.viewresolver.PdfViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {
		"com.meetogether._00.config", 
		"com.meetogether.eeit10927.controller",
		"com.meetogether.eeit10927.service",
		"com.meetogether.eeit10927.dao",
		"com.meetogether.eeit10901", 
		"com.meetogether.eeit10913",
		"com.meetogether.eeit10908",
		"com.meetogether.eeit10936"
		})
public class WebAppConfig implements WebMvcConfigurer {
	
	@Autowired
	ServletContext context;

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
	     registry.addResourceHandler("/eeit10936/images/**").addResourceLocations("/WEB-INF/views/eeit10936/images/");
	     registry.addResourceHandler("/eeit10936/css/**").addResourceLocations("/WEB-INF/views/eeit10936/css/");
	     registry.addResourceHandler("/eeit10936/js/**").addResourceLocations("/WEB-INF/views/eeit10936/js/");
	     registry.addResourceHandler("/eeit10908/js/**").addResourceLocations("/WEB-INF/views/eeit10908/js/");
	     registry.addResourceHandler("/eeit10908/assets/**").addResourceLocations("/WEB-INF/views/eeit10908/assets/");
	     registry.addResourceHandler("/eeit10908/css/**").addResourceLocations("/WEB-INF/views/eeit10908/css/");
	     registry.addResourceHandler("/eeit10908/fonts/**").addResourceLocations("/WEB-INF/views/eeit10908/fonts/");
	     registry.addResourceHandler("/eeit10908/images/**").addResourceLocations("/WEB-INF/views/eeit10908/images/");
	     registry.addResourceHandler("/eeit10901/images/**").addResourceLocations("/WEB-INF/views/eeit10901/images/");
	     registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/views/css/");
	     registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/views/fonts/");
	     registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/views/js/");
	     registry.addResourceHandler("/scss/**").addResourceLocations("/WEB-INF/views/scss/");
	     registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/views/images/");
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
	
	@Override
	public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
//		configurer.defaultContentType(MediaType.APPLICATION_XML);
		configurer.defaultContentType(MediaType.APPLICATION_JSON);
	}
	
	@Bean
	public ViewResolver contentNegotiatingViewResolver(ContentNegotiationManager manager) {
		ContentNegotiatingViewResolver cnvResolver = new ContentNegotiatingViewResolver();
		cnvResolver.setContentNegotiationManager(manager);
		// Define all possible view resolvers
		List<ViewResolver> resolvers = new ArrayList<ViewResolver>();
		resolvers.add(pdfViewResolver(context));

		cnvResolver.setViewResolvers(resolvers);
		return cnvResolver;
	}
	
	/*
	 * 配置自行設計的 PdfViewResolver
	 */
	@Bean
	public ViewResolver pdfViewResolver(ServletContext context) {
		return new PdfViewResolver(context);
	}
	
	@Override
	public void extendMessageConverters(List<HttpMessageConverter<?>> converters) {
		WebMvcConfigurer.super.extendMessageConverters(converters);
		converters.add(new MessageConverter());
	}
	
}
