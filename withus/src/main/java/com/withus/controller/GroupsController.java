package com.withus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.withus.domain.GroupJoinVo;
import com.withus.domain.GroupMemberVo;
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

	// 그룹 만들기 페이지
	@GetMapping("/create")
	public String createform() {
		return "groups/create";
	}

	// 그룹 만들기
	@PostMapping("/create")
	@Transactional
	public ModelAndView create(GroupsVo vo, Authentication authentication) {

		String memberId = memberService.authMember(authentication);
		Map<String, Object> params = new HashMap<>();
		params.put("memberId", memberId);
		params.put("vo", vo);
		groupsMapper.groupcreate(params);
		// 그룹 만들기 성공 시 자신도 자동 가입
		// groupsMapper.createMember(params);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}

	// 그룹 목록 조회
	@GetMapping("/list")
	public ModelAndView list(GroupsVo vo) {
		List<GroupsVo> groupList = groupsMapper.groupList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("groupList", groupList);
		mv.setViewName("groups/list");
		return mv;
	}

	// 그룹 더보기 목록 조회
	@GetMapping("/loadMore")
	@ResponseBody
	public List<GroupsVo> loadMoreGroups(@RequestParam("page") int page, @RequestParam("pageSize") int pageSize) {
		// 더보기 변수
		int startRow = (page - 1) * pageSize + 1;
		int endRow = page * pageSize;
		Map<String, Object> params = new HashMap<>();
		params.put("startRow", startRow);
		params.put("endRow", endRow);

		List<GroupsVo> additionalGroups = groupsMapper.getMoreGroups(params); // 추가 데이터를 가져오는 메서드 호출
		return additionalGroups;
	}

	// 그룹 내용 보기
	@GetMapping("/view/{gno}")
	public ModelAndView view(@PathVariable int gno, Authentication authentication) {
		// 그룹원 수
		int memberCnt = (groupsMapper.memberCnt(gno)) + 1;
		// 상세보기화면
		GroupsVo groupview = groupsMapper.groupview(gno);
		String memberId;
		if (authentication != null) {
			memberId = memberService.authMember(authentication);
		} else {
			memberId = null;
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberCnt", memberCnt);
		mv.addObject("group", groupview);
		mv.addObject("memberid", memberId);
		mv.setViewName("groups/view");
		return mv;
	}

	// 그룹 가입신청 목록
	@GetMapping("/joinlist/{gno}")
	public ModelAndView joinlist(@PathVariable int gno) {
		ModelAndView mv = new ModelAndView();
		List<GroupJoinVo> joinlist = groupsMapper.joinlist(gno);
		mv.setViewName("groups/joinlist");
		mv.addObject("joinlist", joinlist);
		return mv;
	}

	// 그룹원 목록
	@GetMapping("/memberlist/{gno}")
	  public ModelAndView memberlist(@PathVariable int gno){
		  ModelAndView mv = new ModelAndView();
		  List<GroupMemberVo> memberlist = groupsMapper.memberlist(gno);
		  mv.setViewName("groups/memberlist");
		  mv.addObject("memberlist", memberlist);
		  return mv;
		  
	  }
}
