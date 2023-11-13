package com.withus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.withus.domain.GroupJoinVo;
import com.withus.domain.GroupMemberVo;
import com.withus.domain.GroupsVo;

@Mapper
public interface GroupsMapper {

	//그룹 만들기
	void groupcreate(Map<String, Object> params);
    //그룹 만들기 후 자동가입
	void createMember(Map<String, Object> params);
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
	void memberBan(String memberid);
    //그룹원 수
	int memberCnt(int gno);


}
