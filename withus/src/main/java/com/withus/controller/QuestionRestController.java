package com.withus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withus.mapper.QuestionMapper;

@RestController
public class QuestionRestController {

	@Autowired
	private QuestionMapper questionMapper;
	
	@PostMapping("/user/question/delete")
	public String questionDelete(@RequestParam("qno") int qno, @RequestParam("writer") String writer) {
		questionMapper.questionDelete(qno, writer);
		return "success";
	}
}
