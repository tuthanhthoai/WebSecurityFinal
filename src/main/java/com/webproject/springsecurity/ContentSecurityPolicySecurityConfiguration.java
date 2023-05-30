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
<<<<<<< HEAD
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
        return http.build();
    }
=======
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

		http.csrf().disable().authorizeHttpRequests((authorize) -> authorize.antMatchers("/account/**").permitAll());
		http.headers().xssProtection().and().frameOptions().deny();
		return http.build();
	}

>>>>>>> 0638ef13855de512208cc5a2a8b417099f2689a5
}
