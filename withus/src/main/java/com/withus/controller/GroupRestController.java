package com.withus.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withus.mapper.GroupsMapper;
import com.withus.mapper.ImageMapper;
import com.withus.mapper.MemberMapper;
import com.withus.service.MemberService;

import oracle.jdbc.proxy.annotation.Post;

@RestController
@RequestMapping("/groups")
public class GroupRestController {
	
		
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private GroupsMapper groupsMapper;	
	
	
	// 그룹삭제
	@GetMapping("/delete/{gno}")
	public void delete(@PathVariable("gno") int gno) {		
		groupsMapper.deleteGroup(gno);
	}
	
	// 그룹 가입신청
	@PostMapping("/join")
	public void join(Authentication authentication, @RequestParam("gno") int gno) {
		  String memberid = memberService.authMember(authentication);
		  Map<String,Object> params = new HashMap<>();
		  params.put("memberid", memberid);
		  params.put("gno", gno);
		groupsMapper.joinGroup(params);
	}
	// 그룹 가입신청 허가
	@GetMapping("/permit")
	public void permit(@RequestParam("gjoinid") int gjoinid,@RequestParam("gno") int gno,@RequestParam("memberid") String memberid) {
		groupsMapper.joinUpdate(gjoinid);
		Map<String,Object> params = new HashMap<>();
		params.put("memberid", memberid);
		params.put("gjoinid", gjoinid);
		params.put("gno", gno);
		//허가 시 멤버 등록
		groupsMapper.joinMember(params);
	}
	//그룹원 추방
	@GetMapping("/memberban")
	public void memberban(@RequestParam("memberid") String memberid) {		
		groupsMapper.memberBan(memberid);
	}
	

	

}
