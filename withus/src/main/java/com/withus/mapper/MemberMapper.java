package com.withus.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.withus.domain.MemberVo;

@Mapper
public interface MemberMapper {

	// 회원가입
	void join(MemberVo member);
	
	// 아이디로 회원 찾기
	MemberVo findById(String memberId);
}
