package com.withus.mapper;



import com.withus.domain.GroupBoardVo;
import com.withus.domain.GroupMeetingVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;


@Mapper
public interface GroupMeetingMapper {
	//그룹 홈에 뷰
	List<GroupMeetingVo> gMeetingViewList(int gno);

	//정기모임 LIST
	List<GroupMeetingVo> gMeetingList(int gno);

	// 정기모임 생성
	void gMeetingCreate(GroupMeetingVo meetingVo);

	//정기모임 VIEW
	GroupMeetingVo gMeetingView(int meetingid, int gno);

	//정기모임 페이지
	GroupMeetingVo gMeetingModifyPage(String memberid, int gno, int meetingid);

	//정기모임 수정
	void gMeetingModify(HashMap<String, Object> map);

	void gMeetingDelete(HashMap<String, Object> map);

	int gMeetingViewListCount(int gno);
}
