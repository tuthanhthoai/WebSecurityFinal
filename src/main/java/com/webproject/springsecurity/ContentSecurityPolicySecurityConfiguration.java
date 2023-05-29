package com.webproject.springsecurity;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class ContentSecurityPolicySecurityConfiguration {
	@Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.headers()
            .xssProtection()
//            .and()
//            .contentSecurityPolicy("img-src *;script-src 'none';frame-src 'none'")
            .and()
            .frameOptions().deny();
        return http.build();
    }
}
