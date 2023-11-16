package com.withus.mapper;


import com.withus.domain.GroupBoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface GroupBoardMapper {

	void gBoardCreate(GroupBoardVo vo);  //그룹 게시판 생성

	//그룹 게시판 리스트
	List<GroupBoardVo> gBoardList();
}
