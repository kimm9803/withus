package com.withus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withus.mapper.MemberMapper;

@RestController
@RequestMapping("/auth")
public class AuthRestController {

	@Autowired
	private MemberMapper memberMapper;
	
	// 아이디 중복검사
	@PostMapping("/join/duplicate-check")
	public int idDuplicateCheck(@RequestParam("memberId") String memberId) {
		
		int count = memberMapper.idDuplicateCheck(memberId);
		
		return count;
	}
}
