package com.withus.config.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.withus.domain.MemberVo;
import com.withus.mapper.MemberMapper;

@Component
public class CustomAuthSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws ServletException, IOException {
        // Authentication 객체에서 UserDetails를 get
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        // 사용자 정보 가져와서 처리
        String memberId = userDetails.getUsername();
        MemberVo findMember = memberMapper.findById(memberId);
        
        if (findMember.getGender().equals("select")) {
        	response.sendRedirect("/user/gender");
        } else {
        	super.onAuthenticationSuccess(request, response, authentication);
        }
    }
}
