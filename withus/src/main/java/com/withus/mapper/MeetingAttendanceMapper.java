package com.withus.mapper;



import com.withus.domain.GroupMeetingVo;
import com.withus.domain.MeetingAttendanceVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface MeetingAttendanceMapper {
	//참석
     void gMeetingAttend(MeetingAttendanceVo vo);

    //중복 체크
    int checkAttendance(String memberid, int meetingid);

    //정모 참석인원 숫자
    int attendCount(int meetingid);

}
