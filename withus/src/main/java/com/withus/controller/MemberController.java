package com.withus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.withus.domain.FavorCateVo;
import com.withus.domain.MemberVo;
import com.withus.mapper.MemberMapper;
import com.withus.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private MemberService memberService;
	
	// 성별 선택 페이지(최초 로그인 시 자동 이동)
	@GetMapping("/user/gender")
	public String setGenderPage() {
		return "auth/gender";
	}
	
	// 선호 카테고리(최초 로그인 시 자동 이동)
	@GetMapping("/user/category/favor")
	public String setFavorCatePage() {
		return "auth/favor";
	}
	
	// 마이페이지
	@GetMapping("/user/mypage")
	public String myPage(Authentication authentication, Model model) {
		String memberId = memberService.authMember(authentication);
		
		// 회원정보, 관심카테고리 목록 받아오기
		MemberVo member = memberMapper.findById(memberId);
		List<FavorCateVo> favorCateList = memberMapper.favorCateList(memberId);
		
		model.addAttribute("member", member);
		model.addAttribute("favorCateList", favorCateList);
		
		return "member/mypage";
	}
}
