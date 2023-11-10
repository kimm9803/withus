package com.withus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.withus.domain.GroupsVo;

@Mapper
public interface GroupsMapper {

	void groupcreate(GroupsVo vo);

	List<GroupsVo> groupList();

	GroupsVo groupview(int gno);

	List<GroupsVo> getMoreGroups(Map<String, Object> params);

}
