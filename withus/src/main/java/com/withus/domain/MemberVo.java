package com.withus.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberVo {
	
	private String memberId;
	private String password;
	private String name;
	private String sex;
	private String role;
	private String regDate;
}
