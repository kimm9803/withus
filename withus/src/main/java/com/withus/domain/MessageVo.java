package com.withus.domain;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MessageVo {

	private int messageId;
	private String title;
	private String content;
	private MemberVo sender;
	private MemberVo receiver;
}
