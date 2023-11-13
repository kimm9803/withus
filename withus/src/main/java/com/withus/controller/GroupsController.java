package com.withus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.withus.domain.GroupsVo;
import com.withus.mapper.GroupsMapper;
import com.withus.mapper.ImageMapper;
import com.withus.service.MemberService;

@Controller
@RequestMapping("/groups")
public class GroupsController {

	@Autowired
	private GroupsMapper groupsMapper;
	
	@Autowired
	private ImageMapper imageMapper;
	
	@Autowired
	private MemberService memberService;
	
	
      //그룹 만들기 페이지	
	  @GetMapping("/create")
	  public String createform() {
		  return "groups/create";
	  }
	  //그룹 만들기	  
	  @PostMapping("/create")
	  public ModelAndView create(GroupsVo vo, Authentication authentication) {
		  
		  String memberId = memberService.authMember(authentication);
		  Map<String,Object> params = new HashMap<>();
		  params.put("memberId", memberId);
		  params.put("vo", vo);
		  groupsMapper.groupcreate(params);
		  
		  ModelAndView mv = new ModelAndView();
		  mv.setViewName("home");
		  return mv;
	  }
	  //그룹 목록 조회
	  @GetMapping("/list")
	  public ModelAndView list(GroupsVo vo) {		  
		  List<GroupsVo> groupList = groupsMapper.groupList();			  
		  ModelAndView mv = new ModelAndView();
		  mv.addObject("groupList", groupList);
		  mv.setViewName("groups/list");
		  return mv;
	  }
	  //그룹 더보기 목록 조회
	  @GetMapping("/loadMore")
	  @ResponseBody
	  public List<GroupsVo> loadMoreGroups(@RequestParam("page") int page, @RequestParam("pageSize") int pageSize) {
		  int startRow = (page - 1) * pageSize + 1;
		  int endRow = page * pageSize;
		  
		  Map<String, Object> params = new HashMap<>();
		  params.put("startRow", startRow);
		  params.put("endRow", endRow);
		  
		  List<GroupsVo> additionalGroups = groupsMapper.getMoreGroups(params); // 추가 데이터를 가져오는 메서드 호출
		  return additionalGroups;
	  }
	  
	  //그룹 내용 보기
	  @GetMapping("/view/{gno}")
	  public ModelAndView view(@PathVariable int gno) {
		  GroupsVo groupview = groupsMapper.groupview(gno);		      
		  ModelAndView mv = new ModelAndView();
		  mv.addObject("group", groupview);		  
		  mv.setViewName("groups/view");
		  return mv;
	  }
	  
	  
  
}
