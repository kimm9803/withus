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
public class GroupJoinVo {
	private int gjoinid; // 그룹 가입신청
	private int gno; // 그룹 번호
	private String memberid; // 가입신청자 ID
	private int gpermit; // 허가여부 0 = 허가안됨, 1 = 허가 됨
	private String gappdate; // 그룹 가입 신청일
	private String name; // 가입신청자 이름

}
