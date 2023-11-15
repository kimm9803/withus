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
import org.springframework.web.bind.annotation.RequestParam;

import com.withus.domain.Criteria;
import com.withus.domain.FavorCateVo;
import com.withus.domain.MemberVo;
import com.withus.domain.MessageVo;
import com.withus.domain.PageMaker;
import com.withus.mapper.MemberMapper;
import com.withus.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private MemberService memberService;
	
	// 성별 선택 페이지(최초 로그인 시 자동 이동)
	@GetMapping("/user/gender")
	public String setGenderPage() {
		return "auth/gender";
	}
	
	// 선호 카테고리(최초 로그인 시 자동 이동)
	@GetMapping("/user/category/favor")
	public String setFavorCatePage() {
		return "auth/favor";
	}
	
	// 마이페이지
	@GetMapping("/user/mypage")
	public String myPage(Authentication authentication, Model model) {
		String memberId = memberService.authMember(authentication);
		
		// 회원정보, 관심카테고리 목록 받아오기
		MemberVo member = memberMapper.findById(memberId);
		List<FavorCateVo> favorCateList = memberMapper.favorCateList(memberId);
		
		model.addAttribute("member", member);
		model.addAttribute("favorCateList", favorCateList);
		
		return "member/mypage";
	}
	
	// 메시지 작성 페이지
	@GetMapping("/user/message")
	public String getMessagePage(@RequestParam("memberId") String gLeaderId, Model model, Authentication authentication) {

		model.addAttribute("sender", memberService.authMember(authentication));
		model.addAttribute("receiver", gLeaderId);
		model.addAttribute("gLeaderName", memberMapper.findById(gLeaderId).getName());
		
		return "member/message";
	}
	
	// 메시지 보내기
	@PostMapping("/user/message/send")
	public String writeMessage(MessageVo message) {
		memberMapper.sendMessage(message);
		return "redirect:/";
	}
	
	// 받은 쪽지함
	@GetMapping("/user/mymessage")
	public String getReceivedMessage(Criteria cri, Authentication authentication, Model model) {
		String memberId = memberService.authMember(authentication);
		//List<MessageVo> receivedMessage = memberMapper.findByReceiverId(memberId);
		Map<String, Object> map = new HashMap<>();
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd", cri.getRowEnd());
		map.put("memberId", memberId);
		List<MessageVo> receivedMessage = memberMapper.receivedListPage(map);
		model.addAttribute("receivedMessage", receivedMessage);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberMapper.receivedCount(memberId));
		model.addAttribute("pageMaker", pageMaker);
		
		return "member/receivedMessage";
	}
	
	// 받은 상세쪽지
	@GetMapping("/user/mymessage/view/{messageId}")
	public String getReceivedMessageView(@PathVariable("messageId") int messageId, Model model) {
		MessageVo message = memberMapper.getMessageView(messageId);
		model.addAttribute("message", message);
		return "member/messageView";
	}
	
	
	// 보낸 쪽지함
	@GetMapping("/user/send-message")
	public String getSendMessage(Criteria cri, Authentication authentication, Model model) {
		String memberId = memberService.authMember(authentication);
		Map<String, Object> map = new HashMap<>();
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd", cri.getRowEnd());
		map.put("memberId", memberId);
		List<MessageVo> sendMessage = memberMapper.sendListPage(map);
		model.addAttribute("sendMessage", sendMessage);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberMapper.sendCount(memberId));
		model.addAttribute("pageMaker", pageMaker);

		return "member/sendMessage";
	}

}
