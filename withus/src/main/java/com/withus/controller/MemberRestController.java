package com.withus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
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
	
	// 관심 지역 설정
	@PostMapping("/user/region/set")
	public String setRegions(@RequestParam(value="selectedRegions[]") List<String> selectedRegions, Authentication authentication) {
		
		String memberId = memberService.authMember(authentication);
		for (int i = 0; i < selectedRegions.size(); i++) {
			int rno = Integer.parseInt(selectedRegions.get(i));
			memberMapper.setFavorRegion(memberId, rno);
		}
		return "success";
	}
	
	// 회원 탈퇴
	@PostMapping("/user/delete")
	public void deleteMember(@RequestParam("memberId") String memberId) {
		memberMapper.delete(memberId);
	}
	
	// 쪽지 삭제
	@PostMapping("/user/mymessage/delete")
	public void deleteMessage(@RequestParam("messageId") int messageId) {
		memberMapper.messageDelete(messageId);
	}
	
}
