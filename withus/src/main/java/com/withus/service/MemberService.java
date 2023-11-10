package com.withus.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

@Service
public class MemberService {

	// 회원가입 시, 유효성 체크
    public Map<String, String> validateHandling(Errors errors) {
        Map<String, String> validatorResult = new HashMap<>();

        for (FieldError error : errors.getFieldErrors()) {
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }

        return validatorResult;
    }
    
    // 현재 인증된 사용자 아이디 반환
    public String authMember(Authentication authentication) {
    	UserDetails userDetails = (UserDetails)authentication.getPrincipal();
    	String memberId = userDetails.getUsername();
    	return memberId;
    }
}
