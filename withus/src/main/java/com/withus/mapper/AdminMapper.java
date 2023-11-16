package com.withus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.withus.domain.Criteria;
import com.withus.domain.GroupReportVo;
import com.withus.domain.MemberReportVo;

@Mapper
public interface AdminMapper {

	// 회원 강제 탈퇴
	void deleteUser(String memberId);

	// 신고 내역 목록
	List<GroupReportVo> gReportList(Map<String, Object> map);

	// 전체 신고 수
	int totalReportCount();

	// 신고 내역 상세보기
	GroupReportVo gReportView(int greportid);

	// 신고 인정
	void gReportAdmit(int greportid);

	// 신고 그룹번호찾기
	int findGno(int greportid);

	// 신고인정 그룹 신고수 + 1
	void gGroupReport(int gno);

	// 신고 거부
	void gReportReject(int greportid);

	// 회원 신고 내역 목록
	List<MemberReportVo> mReportList(Criteria cri);

	// 회원 전체 신고 수
	int totalMemberReportCount();

	// 회원 신고 내역 상세보기
	MemberReportVo mReportView(int mreportId);
}
