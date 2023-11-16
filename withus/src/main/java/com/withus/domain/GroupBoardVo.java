package com.withus.domain;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class GroupBoardVo {
    private int gbno;
    private int gno;
    private String title;
    private int gbcateid;
    private String content;
    private String gbregdate;
    private String memberid;

}
