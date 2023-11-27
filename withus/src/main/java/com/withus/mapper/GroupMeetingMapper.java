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
	//정기모임 삭제
	void gMeetingDelete(HashMap<String, Object> map);
	//정기모임 삭제할라했나보누
	int gMeetingViewListCount(int gno);
	//내가만든 정모 리스트
	List<GroupMeetingVo> myCreateMeetingList(String memberId);
	//내가만든 정모 meetingId
	List<Integer> myMeetingId(String memberId);

	//전체 데이터 개수를 가져오는 메서드
	int getTotalCount(int gno);

	//적절한 범위의 데이터만을 가져오는 메서드
	List<GroupMeetingVo> getPaginatedGMeetingList(int gno, int page, int pageSize);

	//정모 가입 이름
	List<GroupMeetingVo> gMeetingAttendName(int meetingid);

}
