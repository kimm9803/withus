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
public class GroupsVo {
	private int gno; // 그룹번호
	private String gname; // 그룹이름
	private String gintro; // 그룹소개
	private String gdate; // 그룹 생성일
	private int gperson; // 그룹 정원
	private int greport; // 그룹 신고수
	private int glike; // 그룹 추천추
	private String newImageName;
}
