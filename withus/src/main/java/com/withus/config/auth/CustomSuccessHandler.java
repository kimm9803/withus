package com.withus.config.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.withus.domain.MemberVo;
import com.withus.mapper.MemberMapper;

@Component
public class CustomSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String memberId = userDetails.getUsername();
        MemberVo findMember = memberMapper.findById(memberId);

        if (findMember.getGender().equals("select")) {
            response.sendRedirect("/user/gender");
        } else {
            response.sendRedirect("/"); // 기본적인 로그인 성공 후 동작
        }
	}
}
