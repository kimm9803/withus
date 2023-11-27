package com.withus.mapper;


import com.withus.domain.GroupBoardReplyVo;
import com.withus.domain.GroupBoardVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface GroupBoardMapper {

	void gBoardCreate(GroupBoardVo vo);  //그룹 게시판 생성

	//그룹 게시판 리스트
	List<GroupBoardVo> gBoardList(int gno);
	//그룹 게시판 뷰
	GroupBoardVo gBoardView(int gbno);

	//그룹 홈에 뷰
	List<GroupBoardVo> gBoardViewList(int gno);

	//그룹 게시판 게시물 수정 페이지
	GroupBoardVo gBoardModifyPage(@Param("memberid") String memberid, @Param("gbno") int gbno ,@Param("gno") int gno);
	//그룹 게시판 게시물 수정
	void gBoardModify(HashMap<String, Object> map);
	//그룹 게시판 게시물 삭제
	void gBoardDelete(HashMap<String, Object> map);

	//그룹 게시판 댓글 생성
	void GBReplyCreate(GroupBoardReplyVo vo);

	// 댓글 목록 조회
	List<GroupBoardReplyVo> getComments(@Param("gbno") int gbno,
										@Param("gno") int gno,
										@Param("memberid") String memberid);
	//댓글 목록 수정
	void commentModify(GroupBoardReplyVo replyVo);

	//댓글 삭제
	void commentDelete(@Param("replyid") int replyid, @Param("memberid") String memberid);

	//마이 페이지 내가 작성한 게시물
	List<GroupBoardVo> myCreateBoardList(String memberId);

	//본인이 작성한 게시물만 수정
	boolean isCreateBoard(int gbno, String memberid);

}
