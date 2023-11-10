package com.withus.controller;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.withus.domain.MemberVo;
import com.withus.mapper.MemberMapper;
import com.withus.service.MemberService;

@Controller
@RequestMapping("/auth")
public class AuthController {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// 로그인 페이지
	@GetMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error,
						@RequestParam(value = "exception", required = false) String exception,
						Model model) {
		model.addAttribute("error", error);
		model.addAttribute("exception", exception);
		
		return "auth/login";
	}
	
	// 회원가입 페이지
	@GetMapping("/join")
	public String join() {
		return "auth/join";
	}
	
	// 회원가입
	@PostMapping("/join")
	public String joinProc(@Valid MemberVo member, Errors errors, Model model) {
		
		if (errors.hasErrors()) {
			// 회원가입 실패시, 입력 데이터를 유지
			model.addAttribute("member", member);
			
			// 유효성 통과 못한 필드와 메시지를 핸들링
			Map<String, String> validatorResult = memberService.validateHandling(errors);
			for (String key : validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			}
			
			return "auth/join";
		} else {
			// 비밀번호 암호화 작업
			String rawPassword = member.getPassword();
			String encPassword = bCryptPasswordEncoder.encode(rawPassword);
			
			member.setPassword(encPassword);
			member.setRole("ROLE_USER");
			if (member.getGender() == null) {
				member.setGender("select");
			}
			
			memberMapper.join(member);
			return "redirect:/auth/login";
		}
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
