package com.withus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.withus.domain.GroupsVo;
import com.withus.mapper.GroupsMapper;

@Controller
@RequestMapping("/groups")
public class GroupsController {

	@Autowired
	private GroupsMapper groupsMapper;
	
	
      //그룹 만들기 페이지	
	  @GetMapping("/create")
	  public String createform() {
		  return "groups/create";
	  }
	  //그룹 만들기	  
	  @PostMapping("/create")
	  public ModelAndView create(GroupsVo vo) {
		  
		  groupsMapper.groupcreate(vo);
		  
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
