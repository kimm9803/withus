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
public class GroupMemberVo {
	private int gmemberid; // 그룹원 고유번호
	private int gno; // 그룹 번호
	private String memberid; // 그룹원 ID
	private int gauth; // 그룹 권한 ( 1 = 일반 , 2 = 간부 )
	private String gjoindate; // 그룹 가입일
	private String name;//그룹원 이름
}
