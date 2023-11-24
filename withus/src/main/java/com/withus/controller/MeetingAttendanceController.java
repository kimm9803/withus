package com.withus.controller;

import com.withus.domain.GroupMeetingVo;
import com.withus.domain.MeetingAttendanceVo;
import com.withus.mapper.MeetingAttendanceMapper;
import com.withus.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/gmattendance")
public class MeetingAttendanceController {
    //
    @Autowired
    MeetingAttendanceMapper meetingAttendanceMapper;

    @Autowired
    private MemberService memberService;

    //정기 모임 참가
    @PostMapping("/create/{meetingid}/{gno}")
    public String createMeeting(@PathVariable("meetingid") int meetingid,
                                @PathVariable("gno") int gno,
                                MeetingAttendanceVo vo,
                                Authentication authentication) {

        String memberid = memberService.authMember(authentication);


        vo.setMemberid(memberid);
        vo.setMeetingid(meetingid);

        // 중복 체크 실행
        int duplicateCount = meetingAttendanceMapper.checkAttendance(memberid, meetingid);

        if(duplicateCount == 0){
            //중복이 없을 경우에만 삽입
            meetingAttendanceMapper.gMeetingAttend(vo);
            return "redirect:/groups/view/" + gno; // 생성된 모임 목록 페이지로 리다이렉트
        } else{
            //중복이 있을 경우 예외 처리
            return "gmeeting/duplicateError"; // 중복 에러 페이지로 리다이렉트
        }
    }
}
