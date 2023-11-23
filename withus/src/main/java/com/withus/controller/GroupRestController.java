package com.withus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withus.domain.GroupsVo;
import com.withus.mapper.GroupsMapper;
import com.withus.service.MemberService;

@RestController
@RequestMapping("/groups")
public class GroupRestController {
	
		
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private GroupsMapper groupsMapper;	
	
	
	// 그룹삭제
	@Secured("ROLE_USER")
	@GetMapping("/delete/{gno}")
	public void delete(@PathVariable("gno") int gno) {		
		groupsMapper.deleteGroup(gno);
	}
	
	// 그룹 가입신청 취소
	@Secured("ROLE_USER")
	@GetMapping("/joincancel")
	public void joincancel(Authentication authentication, @RequestParam("gno") int gno) {
		  String memberid = memberService.authMember(authentication);
		  Map<String,Object> params = new HashMap<>();
		  params.put("memberid", memberid);
		  params.put("gno", gno);
		groupsMapper.joinGroupCancel(params);
	}
	
	// 그룹 가입신청
	@Secured("ROLE_USER")
	@GetMapping("/join")
	public void join(Authentication authentication, @RequestParam("gno") int gno) {
		String memberid = memberService.authMember(authentication);
		Map<String,Object> params = new HashMap<>();
		params.put("memberid", memberid);
		params.put("gno", gno);
		groupsMapper.joinGroup(params);
	}
	
	// 그룹 가입신청 허가
	@Secured("ROLE_USER")
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
	@Secured("ROLE_USER")
	@GetMapping("/memberban/{gno}")
	public void memberban(@RequestParam("memberid") String memberid, @PathVariable("gno") int gno) {	
		Map<String,Object> params = new HashMap<>();
		params.put("memberid", memberid);
		params.put("gno", gno);		
		groupsMapper.memberBan(params);
	}
	
	//그룹원 탈퇴
	@Secured("ROLE_USER")
	@GetMapping("/leave")
	public void memberleave(@RequestParam("memberid") String memberid, @RequestParam("gno") int gno) {
		
		Map<String,Object> params = new HashMap<>();
		params.put("memberid", memberid);
		params.put("gno", gno);
		groupsMapper.memberleave(params);
	}
	
	//그룹 더보기 목록 조회	
	@GetMapping("/loadMore")	
	public List<GroupsVo> loadMoreGroups(
	        @RequestParam(name = "page" , defaultValue = "1") int page,
	        @RequestParam(name = "pageSize", defaultValue = "4") int pageSize,
	        @RequestParam(value = "searchType", required = false) String searchType,
	        @RequestParam(value = "keyword", required = false) String keyword) {

	    // 더보기 변수
	    int startRow = (page - 1) * pageSize + 1;
	    int endRow = page * pageSize;
	    Map<String, Object> params = new HashMap<>();
	    params.put("startRow", startRow);
	    params.put("endRow", endRow);

	    // 검색 조건이 있다면 매퍼 메서드에 전달
	    if (searchType != null && keyword != null) {
	        params.put("searchType", searchType);
	        params.put("keyword", keyword);
	    }

	    List<GroupsVo> additionalGroups = groupsMapper.getMoreGroups(params); // 추가 데이터를 가져오는 메서드 호출
	    return additionalGroups;
	}
	
	//그룹 추천
	@Secured("ROLE_USER")
	@GetMapping("/like/{gno}")
	public String groupLike(@PathVariable("gno") int gno, @RequestParam("memberid") String memberid) {
		Map<String, Object> params = new HashMap<>();
		params.put("gno", gno);
		params.put("memberid", memberid);
		// 그룹 좋아요 중복 확인
		int likeStatus = groupsMapper.likeStatus(params);		
		// 좋아요 기록없을경우
		if(likeStatus == 0) {
			//glike 테이블에 좋아요 입력
			groupsMapper.likeinsert(params);
			//groups 테이블 glike 컬럼 + 1
			groupsMapper.likePlus(params);
			
			return "like";
		}else {
			//glike 테이블에 데이터 삭제
			groupsMapper.likedelete(params);
			//groups 테이블 glike 컬럼 - 1
			groupsMapper.likeMinus(params);
			
			return "unlike";
		}
	}


	

}
