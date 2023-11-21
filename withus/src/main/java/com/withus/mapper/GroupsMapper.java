package com.withus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.withus.domain.GroupJoinVo;
import com.withus.domain.GroupMemberVo;
import com.withus.domain.GroupReportVo;
import com.withus.domain.GroupsVo;

@Mapper
public interface GroupsMapper {

	//그룹 만들기
	void groupcreate(Map<String, Object> params);    
	
	//그룹 수정 페이지
	GroupsVo getModify(int gno);
	
	//그룹 수정
    void groupModify(GroupsVo groupsVo);
	
	//그룹목록
	List<GroupsVo> groupList();	
	
    //그룹상세보기
	GroupsVo groupview(int gno);
	
    //그룹목록보기(더보기 버전)
	List<GroupsVo> getMoreGroups(Map<String, Object> params);
	
    //그룹삭제	
	void deleteGroup(int gno);
	
    //그룹가입신청
	void joinGroup(Map<String, Object> params);
	
    //그룹가입신청내역
	List<GroupJoinVo> joinlist(int gno);
	
    //그룹 가입신청 허가
	void joinUpdate(int gjoinid);
	
    //그룹 가입신청 허가
	void joinMember(Map<String, Object> params);
	
    //그룹원 목록
	List<GroupMemberVo> memberlist(int gno);
	
    //그룹원 추방
	void memberBan(Map<String, Object> params);
	
	
    //그룹원 수
	int memberCnt(int gno);
	
	//그룹원 존재여부
	int findById(Map<String, Object> params);
	
	//그룹원 탈퇴
	void memberleave(Map<String, Object> params);	
	
	//신고그룹명
	String findByname(int gno);
	
	//그룹신고하기
	void reportGroup(GroupReportVo vo);
	
	//그룹 신고내역
	List<GroupReportVo> gReportList(Map<String, Object> map);
	
	//전체 그룹 신고수
	int totalReportCount();

	//그룹 신고 내용 보기
	GroupReportVo gReportView(int greportid);
	
	//그룹 리스트 
	List<GroupsVo> getGroupList(Map<String, Object> map);

	//전체 그룹 수
	int totalGroupCount(Map<String, Object> params);

	//카테고리 별 그룹 리스트
	List<GroupsVo> loadCateGroup(Map<String, Object> params);

	//전체 그룹 리스트
	List<GroupsVo> loadGroup(Map<String, Object> params);

	//전체 카테고리별 그룹 수
	int totalCateGroupCount(Map<String, Object> params);

	//그룹 추천 여부
	int likeStatus(Map<String, Object> params);
	
	//그룹추천 테이블 추가
	void likeinsert(Map<String, Object> params);
	
    //그룹 테이블 추천 컬럼 + 1
	void likePlus(Map<String, Object> params);
	
	//그룹추천 테이블 삭제
	void likedelete(Map<String, Object> params);

	//그룹 테이블 추천 컬럼 - 1
	void likeMinus(Map<String, Object> params);

	//접속 회원 선호카테고리
	List<Integer> favorCate(String memberid);

	//선호카테고리 그룹 리스트
	List<GroupsVo> favorGroup(int favorCateid);

	//선호카테고리 그룹 수
	int totalFavorGroups(int favorCateid);

	//선호지역 그룹 수
	List<Integer> favorRegion(String memberid);

	//선호지역 그룹 리스트
	List<GroupsVo> favorRgroup(int favorRno);

	//선호지역 그룹 수
	int favorReigonGroups(int favorRno);

	

	



}
