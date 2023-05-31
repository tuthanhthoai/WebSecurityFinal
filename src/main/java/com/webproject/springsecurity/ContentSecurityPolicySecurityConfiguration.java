package com.webproject.springsecurity;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.header.writers.StaticHeadersWriter;

@Configuration
@EnableWebSecurity
public class ContentSecurityPolicySecurityConfiguration {

	@Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf()
			.disable()
			.authorizeHttpRequests((authorize) -> authorize.antMatchers("/**")
			.permitAll());
//		http.authorizeHttpRequests()
//			.antMatchers("/account/**")
//			.requiresChannel().antMatchers("/account/**").requireSecure();
        http.headers()
            .xssProtection()
            .and()
            .frameOptions().deny();
        http.headers().addHeaderWriter(new StaticHeadersWriter("X-Content-Type-Options", "nosniff"));
        return http.build();
    }
}
