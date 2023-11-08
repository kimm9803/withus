package com.withus.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.withus.config.auth.CustomAuthFailureHandler;
import com.withus.config.auth.CustomAuthSuccessHandler;
import com.withus.config.auth.CustomSuccessHandler;
import com.withus.config.oauth.PrincipalOauth2UserService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private PrincipalOauth2UserService principalOauth2UserService;
	
	/* 로그인 실패 핸들러 의존성 주입 */
	private final CustomAuthFailureHandler customFailureHandler;
	
	/* 로그인 성공 핸들러 의존성 주입*/
	private final CustomAuthSuccessHandler customAuthSuccessHandler;
	private final CustomSuccessHandler customSuccessHandler;
	
	
	// 해당 메서드의 리턴되는 오브젝트를 IOC로 등록해준다.(비밀번호 암호화)
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		http.authorizeRequests()
			.antMatchers("/user/**").authenticated()					// /user  이하 url은 인증된 사용자만 가능
			.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")	// /admin 이하 url은 ROLE_ADMIN 역할을 가진 사용자만 가능 
			.anyRequest().permitAll()									// 그 외 url은 다 가능
			.and()
			.formLogin()												// 폼 로그인 방식 사용
			.loginPage("/auth/login")										// 로그인 페이지 -> /login
			.loginProcessingUrl("/auth/login-proc")							// 로그인 진행 -> /login-proc (컨트롤러 만들지 않아도 시큐리티가 진행)
			.usernameParameter("memberId")								// 로그인 form에서의 아이디 name
            .passwordParameter("password")								// 로그인 form에서의 비밀번호 name
            //.successHandler(customSuccessHandler)						// 로그인 성공 핸들러
            .successHandler(customAuthSuccessHandler)					// 상동
            .failureHandler(customFailureHandler) 						// 로그인 실패 핸들러
			.and()
			.logout()
			.logoutSuccessUrl("/")
			.and()
			.oauth2Login()
			.loginPage("/auth/login")
			.userInfoEndpoint()
			.userService(principalOauth2UserService);
	}
	
//	@Override
//    public void configure(WebSecurity web) throws Exception {
//        web.ignoring().antMatchers("/js/**","/css/**","/img/**","/frontend/**");
//    }
}
