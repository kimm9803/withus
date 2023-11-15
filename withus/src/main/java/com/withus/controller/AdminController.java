package com.withus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.withus.domain.Criteria;
import com.withus.domain.MemberVo;
import com.withus.domain.PageMaker;
import com.withus.mapper.AdminMapper;
import com.withus.mapper.MemberMapper;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private AdminMapper adminMapper;
	
	// 회원 전체 리스트
	@GetMapping("/user/list")
	public String getUserList(Criteria cri, Model model) {
		String role = "ROLE_USER";
		Map<String, Object> map = new HashMap<>();
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd", cri.getRowEnd());
		map.put("role", role);
		List<MemberVo> memberList = memberMapper.getMemberList(map);
		model.addAttribute("memberList", memberList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberMapper.totalMemberCount());
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/memberList";
	}
	
	// 회원 강제 탈퇴
	@GetMapping("/user/delete")
	public String deleteUser(@RequestParam("memberId") String memberId) {
		adminMapper.deleteUser(memberId);
		return "redirect:/admin/user/list";
	}
}
