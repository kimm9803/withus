package com.withus.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.withus.domain.GroupsVo;

@Mapper
public interface GroupsMapper {

	void groupcreate(GroupsVo vo);

}
