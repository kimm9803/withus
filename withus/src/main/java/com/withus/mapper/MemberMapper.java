package com.withus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.withus.domain.FavorCateVo;
import com.withus.domain.MemberVo;
import com.withus.domain.MessageVo;

@Mapper
public interface MemberMapper {

	// 회원가입
	void join(MemberVo member);
	
	// 아이디로 회원 찾기
	MemberVo findById(String memberId);

	// 아이디 중복검사
	int idDuplicateCheck(String memberId);

	// 성별 설정
	void setGender(MemberVo memberVo);

	// 관심 카테고리 설정
	void setFavorCate(@Param("memberId") String memberId, @Param("cateId") int cateId);
	
	// 관심 카테고리 찾기
	List<FavorCateVo> favorCateList(String memberId);

	// 메시지 전송
	void sendMessage(MessageVo message);

	// 받은 쪽지함
	List<MessageVo> findByReceiverId(String memberId);
}
