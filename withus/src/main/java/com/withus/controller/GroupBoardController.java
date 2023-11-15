package com.withus.controller;


import com.withus.domain.GroupBoardVo;

import com.withus.mapper.GroupBoardMapper;
import com.withus.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/gboard")
public class GroupBoardController {

	@Autowired
	private GroupBoardMapper groupBoardMapper;

	@Autowired
	private MemberService memberService;
	//그룹 게시판 조회

	@Secured("ROLE_USER")
	@GetMapping("/create/{gno}")
	public String gBoardCreatePage(@PathVariable("gno") int gno, Model model, Authentication authentication) {
		String memberId = memberService.authMember(authentication);
		model.addAttribute("memberid", memberId);
		model.addAttribute("gno");

		return "gboard/create";
	}
	@PostMapping("/create")
	public String create(GroupBoardVo vo) {
		//System.out.println(vo.getGbcateid());
		groupBoardMapper.gBoardCreate(vo);
		int gno = vo.getGno();
		return "redirect:/groups/view/" + gno;
	}


}

