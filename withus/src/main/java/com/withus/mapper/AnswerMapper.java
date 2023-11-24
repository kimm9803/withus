package com.withus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.withus.domain.AnswerVo;

@Mapper
public interface AnswerMapper {

	// 답변 등록
	void answerWrite(@Param("qno") int qno, @Param("content") String content, @Param("adminId") String adminId);
	
	// 질문별 답변 리스트
	List<AnswerVo> getAnswerList(int qno);

	// 답변 삭제
	void answerDelete(int ano);

	// 답변 수정
	void answerModify(@Param("ano") int ano, @Param("content") String content);

}
