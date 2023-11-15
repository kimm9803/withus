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
public class GroupReportVo {
	private int greportid;
	private String memberid;
	private int gno;
	private String rpcontent;
	private String rpcate;
	private String reportdate;
	private String gname;
}
