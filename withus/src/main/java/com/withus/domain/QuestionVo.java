package com.withus.domain;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class QuestionVo {

	private int qno;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private int status;
	
	private String name;
}
