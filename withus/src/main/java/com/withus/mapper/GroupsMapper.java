package com.withus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.withus.domain.GroupsVo;

@Mapper
public interface GroupsMapper {

	void groupcreate(GroupsVo vo);

	List<GroupsVo> groupList();

	GroupsVo groupview(int gno);

}
