package com.withus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withus.domain.MemberVo;
import com.withus.mapper.MemberMapper;
import com.withus.service.MemberService;

@RestController
public class MemberRestController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private MemberService memberService;
	
	// 성별 설정
	@PostMapping("/user/gender/set")
	public String setGender(@RequestParam("gender") String gender, Authentication authentication) {
		MemberVo findMember = memberMapper.findById(memberService.authMember(authentication));
		findMember.setGender(gender);
		memberMapper.setGender(findMember);
		
		return "success";
	}
	
	// 선호 카테고리 설정
	@PostMapping("/user/category/favor/set")
	public String setFavorCate(@RequestParam(value="selectedImages[]") List<String> selectedImages, Authentication authentication) {
		
		String memberId = memberService.authMember(authentication);
		for (int i = 0; i < selectedImages.size(); i++) {
			int cateId = Integer.parseInt(selectedImages.get(i));
			memberMapper.setFavorCate(memberId, cateId);
		}
		return "success";
	}
}
