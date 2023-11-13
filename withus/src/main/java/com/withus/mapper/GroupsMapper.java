package com.withus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.withus.domain.GroupsVo;

@Mapper
public interface GroupsMapper {

	void groupcreate(Map<String, Object> params);

	List<GroupsVo> groupList();

	GroupsVo groupview(int gno);

	List<GroupsVo> getMoreGroups(Map<String, Object> params);

	void groupcreate(GroupsVo vo, String memberId);

	void deleteGroup(int gno);

	void joinGroup(Map<String, Object> params);

}
