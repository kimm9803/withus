package com.withus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.withus.domain.MemberVo;
import com.withus.domain.NoticeVo;

@Mapper
public interface NoticeMapper {

	//공지사항 작성
	void noticewrite(NoticeVo noticeVo);

	//공지사항 목록
	List<MemberVo> noticeList(Map<String, Object> map);

	//공지사항 총 갯수
	int totalNoticeCount();

	//공지사항 상세보기
	NoticeVo noticeView(int noticeid);

	//공지사항 수정
	void noticeModify(NoticeVo noticeVo);

	//공지사항 삭제
	void noticeDelete(int noticeid);	

}
