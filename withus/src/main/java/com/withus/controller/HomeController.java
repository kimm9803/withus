package com.withus.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.withus.domain.GroupsVo;
import com.withus.mapper.GroupsMapper;
import com.withus.service.MemberService;


@Controller
public class HomeController {
	
	@Autowired
	private GroupsMapper groupsMapper; 
	
	@Autowired
	private MemberService memberService;
	
	
	//메인 화면
	@GetMapping("/")
	public String main(Model model,			
			Authentication authentication) {
			
			// 접속 회원 ID
			String memberid = null;
	
			// authentication 객체가 null이 아닌 경우에만 회원 ID 설정
			if (authentication != null) {
			    memberid = memberService.authMember(authentication);
			}
           model.addAttribute("memberid", memberid);
		
		   //전체 그룹 목록
			Map<String, Object> params = new HashMap<>();
			// 검색 조건이 있다면 매퍼 메서드에 전달			
			List<GroupsVo> cateGroupList = groupsMapper.loadGroup(params);
			int totalGroup = groupsMapper.totalGroupCount(params);
			model.addAttribute("cateGroupList", cateGroupList);
			model.addAttribute("totalGroup", totalGroup);
			
			if(memberid != null) {
				//선호 카테고리 그룹목록
				List<Integer> favorCate = groupsMapper.favorCate(memberid);
				List<GroupsVo> favorGroupList = new ArrayList<>();
				int favorCateid;			
				int totalFavorGroups = 0;
				for(int i=0; i < favorCate.size(); i++) {
					favorCateid = favorCate.get(i);
					List<GroupsVo> groupsForCategory = groupsMapper.favorGroup(favorCateid);
					totalFavorGroups += groupsMapper.totalFavorGroups(favorCateid);			    
					// 얻어온 그룹 정보를 favorGroupList에 추가
					favorGroupList.addAll(groupsForCategory);
				}
				//선호 지역 그룹 목록
				List<Integer> favorRegion = groupsMapper.favorRegion(memberid);
				List<GroupsVo> favorRegionGroupList = new ArrayList<>();
				int favorRno;
				int favorReigonGroups = 0;
				for(int i=0; i<favorRegion.size(); i++) {
					favorRno = favorRegion.get(i);
					List<GroupsVo> groupsForRegion = groupsMapper.favorRgroup(favorRno);
					favorReigonGroups += groupsMapper.favorReigonGroups(favorRno);
					// 얻어온 그룹 정보를 favorGroupList에 추가
					favorRegionGroupList.addAll(groupsForRegion);
				}
				
				//선호카테고리 그룹 리스트
				model.addAttribute("favorGroupList",favorGroupList);
				//선호카테고리 그룹 리스트
				model.addAttribute("totalFavorGroups",totalFavorGroups);
				//선호지역 그룹 리스트
				model.addAttribute("favorRegionGroupList",favorRegionGroupList);
				//선호지역 그룹수
				model.addAttribute("favorReigonGroups",favorReigonGroups);			
			}
			
			
			return "home";
		}
	}
	

	
