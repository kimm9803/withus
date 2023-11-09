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
	
	@PostMapping("/user/category/favor/set")
	public String setFavorCate(@RequestParam(value="selectedImages[]") List<String> selectedImages, Authentication authentication) {
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		String memberId = userDetails.getUsername();
		for (int i = 0; i < selectedImages.size(); i++) {
			int cateId = Integer.parseInt(selectedImages.get(i));
			memberMapper.setFavorCate(memberId, cateId);
		}
		return "success";
	}
}
