package com.withus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.withus.domain.MemberVo;
import com.withus.mapper.MemberMapper;

@Controller
public class AuthController {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// 로그인 페이지
	@GetMapping("/login")
	public String login() {
		return "auth/login";
	}
	
	// 회원가입 페이지
	@GetMapping("/join")
	public String join() {
		return "auth/join";
	}
	
	// 회원가입
	@PostMapping("/join-proc")
	public String joinProc(MemberVo member) {
		// 비밀번호 암호화 작업
		String rawPassword = member.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		
		member.setPassword(encPassword);
		member.setRole("ROLE_USER");
		
		memberMapper.join(member);
		return "redirect:/";
	}
}
