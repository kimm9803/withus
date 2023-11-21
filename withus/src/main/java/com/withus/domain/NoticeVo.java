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
public class NoticeVo {
	private int noticeid;
	private String memberid;
	private String ntcont;
	private String nttitle;
	private String ntregdate;
	private String name;

}
