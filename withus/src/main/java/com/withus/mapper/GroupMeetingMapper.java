package com.withus.mapper;



import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.withus.domain.GroupMeetingVo;


@Mapper
public interface GroupMeetingMapper {
	//그룹 홈에 뷰
	List<GroupMeetingVo> gMeetingViewList(int gno);

	//정기모임 LIST
	List<GroupMeetingVo> gMeetingList(int gno);

	// 정기모임 생성
	void gMeetingCreate(GroupMeetingVo meetingVo);

	//정기모임 VIEW
	GroupMeetingVo gMeetingView(@Param("meetingid") int meetingid, @Param("gno") int gno);

	//정기모임 페이지
	GroupMeetingVo gMeetingModifyPage(@Param("memberid")String memberid, @Param("gno") int gno, @Param("meetingid") int meetingid);

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
	List<GroupMeetingVo> getPaginatedGMeetingList(@Param("gno") int gno, @Param("page") int page, @Param("pageSize") int pageSize);

	//정모 가입 이름
	List<GroupMeetingVo> gMeetingAttendName(int meetingid);

	//그룹장 확인
	boolean groupMasterContain(@Param("gno") int gno, @Param("memberid") String memberid);

	//그룹 멤버 확인
	boolean groupMemberContain(@Param("gno") int gno, @Param("memberid") String memberid);

	//정모 작성한 사람인지 여부
	boolean isCreateMeeting(@Param("gno") int gno, @Param("meetingid") int meetingid, @Param("memberid") String memberid);
}
