package com.withus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
  
}
