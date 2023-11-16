package com.withus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.withus.domain.Criteria;
import com.withus.domain.FavorCateVo;
import com.withus.domain.MemberReportVo;
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

	// 쪽지 상세
	MessageVo getMessageView(int messageId);

	// 보낸 쪽지함
	List<MessageVo> findBySenderId(String memberId);
	
	// 받은 쪽지 페이징
	List<MessageVo> receivedListPage(Map<String, Object> map);
	
	// 받은 쪽지 갯수
	int receivedCount(String memberId);
	
	// 보낸 쪽지 페이징
	List<MessageVo> sendListPage(Map<String, Object> map);
	
	// 보낸 쪽지 갯수
	int sendCount(String memberId);
	
	// 회원 전체 리스트 페이징
	List<MemberVo> getMemberList(Map<String, Object> map);
	
	// 전체 회원 수
	int totalMemberCount();

	// 회원 신고
	void reportMember(MemberReportVo vo);
}
