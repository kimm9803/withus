package com.withus.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {

	// 회원 강제 탈퇴
	void deleteUser(String memberId);

}
