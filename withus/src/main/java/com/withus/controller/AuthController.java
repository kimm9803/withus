package com.withus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// secured 예제
	// 특정한 메서드에만 권한 걸고 싶을 때 설정
	@Secured("ROLE_ADMIN")
	@GetMapping("/info")
	public @ResponseBody String info() {
		return "Secured 어노테이션 씀으로써 ROLE_ADMIN만 들어올 수 있음";
	}
	
	// preAuthorize 예제(여러 권한을 묶을 때 주로 사용)
	// @PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_ADMIN')")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/data")
	public @ResponseBody String data() {
		return "data 정보";
	}
}
