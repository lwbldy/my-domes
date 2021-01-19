package com.pearadmin.common.config;

import com.pearadmin.modules.system.domain.SysDictData;
import com.pearadmin.modules.system.service.ISysDictDataService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

@Configuration
public class MyWebMvcConfigurer implements WebMvcConfigurer,ApplicationListener<ContextRefreshedEvent> {

    @Value("${pear.resource.file_path}")
    String file_root_path;



    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/html/advertIMG/**").addResourceLocations("file:"+file_root_path);
    }

    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        // 将 ApplicationContext 转化为 WebApplicationContext
        WebApplicationContext webApplicationContext =
                (WebApplicationContext)contextRefreshedEvent.getApplicationContext();
        // 从 webApplicationContext 中获取  servletContext
        ServletContext servletContext = webApplicationContext.getServletContext();

    }
}

