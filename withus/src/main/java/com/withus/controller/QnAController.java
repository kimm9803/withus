package com.withus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.withus.domain.AnswerVo;
import com.withus.domain.QuestionVo;
import com.withus.mapper.AnswerMapper;
import com.withus.mapper.MemberMapper;
import com.withus.mapper.QuestionMapper;
import com.withus.service.MemberService;

@Controller
public class QnAController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private QuestionMapper questionMapper;
	
	@Autowired
	private AnswerMapper answerMapper;
	
	// 질문 작성 페이지
	@GetMapping("/user/question")
	public String getQuestionPage(Authentication authentication, Model model) {
		String writer = memberService.authMember(authentication);
		model.addAttribute("writer", writer);
		return "question/write";
	}
	
	// 질문 작성
	@PostMapping("/user/question/write")
	public String writeQuestion(QuestionVo question) {
		questionMapper.writeQuestion(question);
		return "redirect:/question/list";
	}
	
	// 질문 리스트
	@GetMapping("/question/list")
	public String getQuestionList(Model model) {
		List<QuestionVo> questionList = questionMapper.getQuestionList();
		model.addAttribute("questionList", questionList);
		return "question/list";
	}
	
	// 질문 상세조회
	@GetMapping("/question/view/{qno}")
	public String getQuestionView(@PathVariable("qno") int qno, Authentication authentication, Model model) {
		QuestionVo questionVo = questionMapper.getQuestionView(qno);
		QuestionVo prevQuestionVo = questionMapper.getQuestionView(qno-1);
		QuestionVo nextQuestionVo = questionMapper.getQuestionView(qno+1);
		List<AnswerVo> answerVo = answerMapper.getAnswerList(qno);
		
		// 작성자와 로그인된 사용자가 같은지 여부
		boolean tr = false;
		if (authentication != null) {
			String memberId = memberService.authMember(authentication);
			if (questionVo.getWriter().equals(memberId)) {
				tr = true;
				model.addAttribute("isWriter", tr);
			}
			
			if (memberMapper.findById(memberId).getRole().equals("ROLE_ADMIN")) {
				model.addAttribute("role", "ROLE_ADMIN");
			} else {
				model.addAttribute("role", "ROLE_USER");
			}
		} else {
			model.addAttribute("isWriter", tr);
			model.addAttribute("role", "ROLE_GUEST");
		}
		
		
		// -----------------------
		if (prevQuestionVo == null) {
			model.addAttribute("prevIsNull", 1);
		} else {
			model.addAttribute("prevIsNull", 0);
			model.addAttribute("prevQuestion", prevQuestionVo);
		}
		
		if (nextQuestionVo == null) {
			model.addAttribute("nextIsNull", 1);
		} else {
			model.addAttribute("nextIsNull", 0);
			model.addAttribute("nextQuestion", nextQuestionVo);
		}
		model.addAttribute("question", questionVo);
		model.addAttribute("answer", answerVo);
		
		return "question/view";
	}
	
	// 질문 수정 페이지
	@GetMapping("/user/question/modify/{qno}")
	public String getQuestionModifyPage(@PathVariable("qno") int qno, Authentication authentication, Model model) {
		QuestionVo questionVo = questionMapper.getQuestionView(qno);
		if (authentication != null) {
			String memberId = memberService.authMember(authentication);
			
			if (questionVo.getWriter().equals(memberId)) {
				model.addAttribute("question", questionVo);
				return "question/modify";
			} else {
				return "question/error";
			}
		} 
		return "redirect:/auth/login";
	}
	
	// 질문 수정
	@PostMapping("/user/question/modify")
	public String questionModify(QuestionVo questionVo) {
		questionMapper.questionModify(questionVo);
		return "redirect:/question/view/" + questionVo.getQno();
	}
	
	// 답변 삭제
	@GetMapping("/admin/answer/delete/{ano}/{qno}")
	public String answerDelete(@PathVariable("ano") int ano, @PathVariable("qno") int qno) {
		answerMapper.answerDelete(ano);
		return "redirect:/question/view/{qno}";
	}
}
