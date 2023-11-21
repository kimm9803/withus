package com.withus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.withus.domain.GroupJoinVo;
import com.withus.domain.GroupMemberVo;
import com.withus.domain.GroupReportVo;
import com.withus.domain.GroupsVo;
import com.withus.mapper.GroupsMapper;
import com.withus.service.MemberService;

@Controller
@RequestMapping("/groups")
public class GroupsController {

	@Autowired
	private GroupsMapper groupsMapper;	

	@Autowired
	private MemberService memberService;
	
	
      //그룹 만들기 페이지	
	  @Secured("ROLE_USER")
	  @GetMapping("/create")
	  public String createform() {
		  return "groups/create";
	  }
	  //그룹 만들기
	  @Secured("ROLE_USER")
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
	  
	  //그룹 수정 페이지
	  @Secured("ROLE_USER")
	  @GetMapping("/modify/{gno}")
	  public String modifyform(@PathVariable("gno") int gno, Model model) {		  
		  
		  //그룹 내용 들고오기
		  GroupsVo group = groupsMapper.getModify(gno);		  
		  model.addAttribute("group", group);
		  
		  return "groups/modify";
	  }
	  
	  @Secured("ROLE_USER")
	  @PostMapping("/modify/{gno}")
	  public String modify(@PathVariable("gno") int gno, GroupsVo groupsVo) {		  
		  
		  //그룹 내용 수정
		  groupsMapper.groupModify(groupsVo);
		  
		  return "redirect:/groups/view/" + gno;
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
	  public ModelAndView view(@PathVariable int gno, Authentication authentication) {
		  //그룹원 수
		  int memberCnt = (groupsMapper.memberCnt(gno)) + 1 ;
		  //상세보기화면
		  GroupsVo groupview = groupsMapper.groupview(gno);		  
		  String memberId = null;
		  if(authentication != null) {
			  memberId = memberService.authMember(authentication);			  
		  }else {
			  memberId = "";
		  }
          
		  //그룹원 존재여부 (0 = 그룹원 아님, 1 = 그룹원 맞음)
		  Map<String,Object> params = new HashMap<>();
		  params.put("gno", gno);
		  params.put("memberId", memberId);
		  int findById = groupsMapper.findById(params);
		  
		  
		  ModelAndView mv = new ModelAndView();
		  mv.addObject("memberCnt", memberCnt);
		  mv.addObject("group", groupview);		  
		  mv.addObject("memberid", memberId);
		  mv.addObject("findById", findById);
		  mv.setViewName("groups/view");
		  return mv;
	  }	  
	  //그룹 가입신청 목록
	  @Secured("ROLE_USER")
	  @GetMapping("/joinlist/{gno}")
	  public ModelAndView joinlist(@PathVariable int gno) {
		  ModelAndView mv = new ModelAndView();
		  List<GroupJoinVo> joinlist = groupsMapper.joinlist(gno);
		  mv.setViewName("groups/joinlist");
		  mv.addObject("joinlist", joinlist);
		  return mv;
	  }
	  //그룹원 목록
	  @Secured("ROLE_USER")
	  @GetMapping("/memberlist/{gno}")
	  public ModelAndView memberlist(@PathVariable int gno){
		  ModelAndView mv = new ModelAndView();
		  List<GroupMemberVo> memberlist = groupsMapper.memberlist(gno);
		  mv.setViewName("groups/memberlist");
		  mv.addObject("gno", gno);
		  mv.addObject("memberlist", memberlist);
		  return mv;
		  
	  }
	  //그룹 신고창 열기
	  @Secured("ROLE_USER")
	  @GetMapping("/reportform/{gno}")
	  public ModelAndView reportform(@PathVariable("gno") int gno, Authentication authentication) {
		  String memberid = memberService.authMember(authentication);
		  //신고 그룹명 찾기
		  String gname = groupsMapper.findByname(gno);
		  ModelAndView mv = new ModelAndView();
		  mv.addObject("gno", gno);
		  mv.addObject("gname", gname);
		  mv.addObject("memberid", memberid);
		  mv.setViewName("groups/report");
		  return mv;
	  }
	  //그룹 신고
	  @Secured("ROLE_USER")
	  @PostMapping("/report/{gno}")
	  public String reportGroup(GroupReportVo vo) {
		  groupsMapper.reportGroup(vo);
		  return "close";
	  }
	  
	  //카테고리별 리스트
	  @GetMapping("/loadcate/{cateid}")
	  public String loadCateGroup(@PathVariable("cateid") int cateid, Model model,
			  					  @RequestParam(value = "searchType", required = false) String searchType,
			  					  @RequestParam(value = "keyword", required = false) String keyword) {
		  
		  Map<String, Object> params = new HashMap<>();
		  params.put("cateid", cateid);
		  
		  // 검색 조건이 있다면 매퍼 메서드에 전달
		    if (searchType != null && keyword != null) {
		        params.put("searchType", searchType);
		        params.put("keyword", keyword);
		  }
		  
		  List<GroupsVo> cateGroupList = groupsMapper.loadCateGroup(params);
		  int totalGroup = groupsMapper.totalCateGroupCount(params);
		  model.addAttribute("cateGroupList", cateGroupList);
		  model.addAttribute("totalGroup", totalGroup);
		  model.addAttribute("cateid", cateid);
		  
		  return "groups/listcate";
		  
	  }
	  //전체 그룹
	  @GetMapping("/loadall")
	  public String loadGroup(Model model,
			  				  @RequestParam(value = "searchType", required = false) String searchType,
			  				  @RequestParam(value = "keyword", required = false) String keyword) {
		  
		  Map<String, Object> params = new HashMap<>();		  
		  // 검색 조건이 있다면 매퍼 메서드에 전달
		    if (searchType != null && keyword != null) {
		        params.put("searchType", searchType);
		        params.put("keyword", keyword);
		  }
		  List<GroupsVo> cateGroupList = groupsMapper.loadGroup(params);
		  int totalGroup = groupsMapper.totalGroupCount(params);
		  model.addAttribute("cateGroupList", cateGroupList);
		  model.addAttribute("totalGroup", totalGroup);
		  
		  return "groups/listall";
		  
	  }
	  
	  
}
