package com.withus.domain;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MemberReportVo {

	private int mreportId;
	private String reporterId;
	private String reportedId;
	private String rpcontent;
	private String rpcate;
	private String reportDate;
	private int rpstatus;
}
