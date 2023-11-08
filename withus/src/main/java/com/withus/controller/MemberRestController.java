package com.withus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withus.domain.MemberVo;
import com.withus.mapper.MemberMapper;

@RestController
public class MemberRestController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@PostMapping("/user/gender/set")
	public String setGender(@RequestParam("gender") String gender, Authentication authentication) {
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		MemberVo findMember = memberMapper.findById(userDetails.getUsername());
		findMember.setGender(gender);
		memberMapper.setGender(findMember);
		
		return "success";
	}
}
