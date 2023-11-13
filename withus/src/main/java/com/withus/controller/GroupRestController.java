package com.withus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.withus.mapper.GroupsMapper;
import com.withus.mapper.ImageMapper;
import com.withus.mapper.MemberMapper;
import com.withus.service.MemberService;

@RestController
@RequestMapping("/groups")
public class GroupRestController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private GroupsMapper groupsMapper;
	
	@Autowired
	private ImageMapper imageMapper;
	
	// 그룹삭제
	@GetMapping("/delete/{gno}")
	public void delete(@PathVariable("gno") int gno) {		
		groupsMapper.deleteGroup(gno);
	}

	

}
