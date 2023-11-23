package com.withus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.withus.domain.QuestionVo;

@Mapper
public interface QuestionMapper {

	// 질문 작성
	void writeQuestion(QuestionVo question);

	// 질문 리스트
	List<QuestionVo> getQuestionList();

	// 질문 상세
	QuestionVo getQuestionView(int qno);

	// 질문 수정
	void questionModify(QuestionVo questionVo);

	// 질문 삭제
	void questionDelete(@Param("qno")int qno, @Param("writer")String writer);

}
