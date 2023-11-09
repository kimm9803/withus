package com.withus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.withus.mapper.MemberMapper;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper;
	
	@GetMapping("/user/gender")
	public String setGenderPage() {
		return "auth/gender";
	}
	
	@GetMapping("/user/category/favor")
	public String setFavorCatePage() {
		return "auth/favor";
	}
}
