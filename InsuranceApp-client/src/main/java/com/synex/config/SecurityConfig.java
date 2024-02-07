package com.synex.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean 
	public SecurityFilterChain apiFilterChain2(HttpSecurity http) throws Exception {
		http.csrf().disable()
			.authorizeRequests().requestMatchers("/").permitAll().and()
			.exceptionHandling().accessDeniedPage("/accessDeniedPage").and()
			.authorizeRequests().requestMatchers("/admin","/restrict").hasAnyAuthority("ADMIN").and()
			.authorizeRequests().requestMatchers("/userProfile").hasAnyAuthority("USER", "ADMIN").and()
			//.authorizeRequests().requestMatchers("/test", "/userProfile").authenticated().and()
			.formLogin()
			.loginPage("/login")
			.defaultSuccessUrl("/").permitAll().and()
			.logout()
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true)
			.deleteCookies("JSESSIONID")
			.permitAll();

		return http.build();
	}
}
