package com.withus.domain;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class GroupBoardReplyVo {
    private int replyid;
    private String memberid;
    private String name;
    private int gno;
    private int gbno;
    private String content;
    private String gbreplydate;

}

