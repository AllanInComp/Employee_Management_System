package com.tyy.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.github.pagehelper.PageInterceptor;
import com.github.pagehelper.autoconfigure.PageHelperProperties;

@EnableConfigurationProperties(PageHelperProperties.class)
@Configuration
public class PageInterceptorConfig {
	@Autowired
	private PageHelperProperties properties;

	@Bean
	public PageInterceptor pageInterceptor() {
	    PageInterceptor pageInterceptor = new PageInterceptor();
	    pageInterceptor.setProperties(properties.getProperties());
	    return pageInterceptor;
	}
}