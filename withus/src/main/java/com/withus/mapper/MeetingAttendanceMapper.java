package com.withus.mapper;



import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.withus.domain.MeetingAttendanceVo;


@Mapper
public interface MeetingAttendanceMapper {
	//참석
     void gMeetingAttend(MeetingAttendanceVo vo);

    //중복 체크
    int checkAttendance(@Param("memberid") String memberid, @Param("meetingid") int meetingid);

    //정모 참석인원 숫자
    int attendCount(int meetingid);

}
