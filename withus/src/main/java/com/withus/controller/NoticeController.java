package com.withus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.withus.domain.Criteria;
import com.withus.domain.MemberVo;
import com.withus.domain.NoticeVo;
import com.withus.domain.PageMaker;
import com.withus.mapper.NoticeMapper;
import com.withus.service.MemberService;

@Controller
public class NoticeController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private NoticeMapper noticeMapper;	
	
	

	// 공지사항 등록 페이지
	@GetMapping("/admin/notice/write")
	public String noticeform(Authentication authentication, Model model) {
		String memberid = memberService.authMember(authentication);
		model.addAttribute("memberid", memberid);
	
		return "notice/write";
	}
	
	//공지사항 등록
	@PostMapping("/admin/notice/write")
	public String noticewrite(NoticeVo noticeVo) {		
		noticeMapper.noticewrite(noticeVo);
		
		return "redirect:/notice/list";
	}
	//공지사항 목록
	@GetMapping("/notice/list")
	public String noticelist(Criteria cri, Model model) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd", cri.getRowEnd());		
		List<MemberVo> noticeList = noticeMapper.noticeList(map);
		model.addAttribute("noticeList", noticeList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(noticeMapper.totalNoticeCount());
		model.addAttribute("pageMaker", pageMaker);
		return "notice/list";
	}
	
	//공지사항 상세보기
	@GetMapping("/notice/view/{noticeid}")
	public String noticeview(@PathVariable("noticeid") int noticeid,Authentication authentication ,Model model) {
		String memberid = null;
		  if(authentication != null) {
			  memberid = memberService.authMember(authentication);			  
		  }else {
			  memberid = "";
		  }
		NoticeVo notice = noticeMapper.noticeView(noticeid);
		model.addAttribute("notice", notice);
		model.addAttribute("memberid", memberid);
		return "notice/view";
	}
	
	//공지사항 수정페이지 이동
	@GetMapping("/admin/notice/modify/{noticeid}")
	public String noticeModifyForm(@PathVariable("noticeid") int noticeid, Model model) {		
		
		NoticeVo notice = noticeMapper.noticeView(noticeid);
		model.addAttribute("notice", notice);
		
		return "notice/modify";
	}
	
	//공지사항 수정
	@PostMapping("/admin/notice/modify/{noticeid}")
	public String noticeModify(@PathVariable("noticeid") int noticeid, NoticeVo noticeVo) {			
		
		noticeMapper.noticeModify(noticeVo);
		
		return "redirect:/notice/view/" + noticeid;
	}
	
	//공지사항 삭제
	@GetMapping("/admin/notice/delete/{noticeid}")
	public String noticeDelete(@PathVariable("noticeid") int noticeid) {			
	
		noticeMapper.noticeDelete(noticeid);
		
		return "redirect:/notice/list";
	}	
}
