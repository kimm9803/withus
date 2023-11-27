package com.withus.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter@Setter
public class GroupMeetingVo {

    private int meetingid;
    private String memberid;
    private Long gno;
    private String title;
    private String content;
    private String meeting_date;
    private String deadline_date;
    private String location;
    private String cost;
    private Integer capacity;
    private int attend_count;
    private String name;        // 추가: memberid 조인을 통해 가져온 이름

    private String regdate;    //추가: memberid 조인을 통해 가져온 이름

    private String gname;

    private int attendanceCnt;


}
