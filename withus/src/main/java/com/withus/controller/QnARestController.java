package com.withus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withus.domain.QuestionVo;
import com.withus.mapper.AnswerMapper;
import com.withus.mapper.QuestionMapper;
import com.withus.service.MemberService;

@RestController
public class QnARestController {

	@Autowired
	private QuestionMapper questionMapper;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AnswerMapper answerMapper;
	
	// 질문 삭제
	@PostMapping("/user/question/delete")
	public String questionDelete(@RequestParam("qno") int qno, @RequestParam("writer") String writer) {
		questionMapper.questionDelete(qno, writer);
		return "success";
	}
	
	// 답변 등록(관리자)
	@PostMapping("/admin/answer/write")
	public String answerWrite(@RequestParam("qno") int qno, @RequestParam("content") String content, Authentication authentication) {
		
		String adminId = memberService.authMember(authentication);
		questionMapper.setStatus(qno);
		answerMapper.answerWrite(qno, content, adminId);
		
		return "success";
	}
	
	// 답변 수정(관리자)
	@PostMapping("/admin/answer/modify")
	public String answerModify(@RequestParam("ano") int ano, @RequestParam("content") String content) {
		answerMapper.answerModify(ano, content);
		return "success";
	}
	
}
