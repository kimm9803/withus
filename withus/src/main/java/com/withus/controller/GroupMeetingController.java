package com.withus.controller;

import com.withus.domain.GroupBoardReplyVo;
import com.withus.domain.GroupBoardVo;
import com.withus.domain.GroupMeetingVo;
import com.withus.domain.MeetingAttendanceVo;
import com.withus.mapper.GroupMeetingMapper;
import com.withus.mapper.MeetingAttendanceMapper;
import com.withus.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/gmeeting")
public class GroupMeetingController {
    @Autowired
    private GroupMeetingMapper groupMeetingMapper;
    @Autowired
    private MeetingAttendanceMapper meetingAttendanceMapper;
    @Autowired
    private MemberService memberService;

    //작성 페이지 조회
    //그룹 게시판 작성 페이지 조회
    @Secured("ROLE_USER")
    @GetMapping("/createMeeting/{gno}")
    public String gBoardCreatePage(@PathVariable("gno") int gno, Model model, Authentication authentication) {
        String memberId = memberService.authMember(authentication);
        model.addAttribute("memberid", memberId);
        model.addAttribute("gno", gno);

        return "gmeeting/createMeeting" ;
    }
    //정모 리스트 조회
    @Secured("ROLE_USER")
    @GetMapping("/list/{gno}")
    public ModelAndView list(@PathVariable int gno, GroupBoardReplyVo vo) {
        List<GroupMeetingVo> groupMeetingList = groupMeetingMapper.gMeetingList(gno);
        ModelAndView mv = new ModelAndView();
        mv.addObject("groupMeetingList", groupMeetingList);
        mv.setViewName("/gmeeting/list");
        return mv;
    }

    //작성버튼 눌렀을때
    @PostMapping("/create/{gno}")
    public String createMeeting(@PathVariable("gno") int gno, @ModelAttribute GroupMeetingVo meetingVo) {
        groupMeetingMapper.gMeetingCreate(meetingVo);
        return "redirect:/groups/view/" + gno; // 생성된 모임 목록 페이지로 리다이렉트
    }

    //정모 VIEW
    @Secured("ROLE_USER")
    @GetMapping("/view/{meetingid}/{gno}")
    //그룹 게시판 View 조회
    public ModelAndView view(@PathVariable("meetingid") int meetingid,
                             @PathVariable("gno") int gno){
        GroupMeetingVo groupMeetingView = groupMeetingMapper.gMeetingView(meetingid, gno);
        int attendCount = meetingAttendanceMapper.attendCount(meetingid);
        ModelAndView mv = new ModelAndView();

        mv.addObject("groupMeetingView",groupMeetingView);
        mv.addObject("attendCount", attendCount);
        mv.setViewName("/gmeeting/view");
        return mv;
    }
    // 정모 ModifyPage
    //그룹 게시글 수정하는 페이지
    @Secured("ROLE_USER")
    @GetMapping("/modifypage/{gno}/{meetingid}")
    public ModelAndView modifyView(@PathVariable("gno") int gno,
                                   @PathVariable("meetingid") int meetingid,
                                   Authentication authentication,
                                   Model model)  {
        String memberid = memberService.authMember(authentication);
        GroupMeetingVo modifyView = groupMeetingMapper.gMeetingModifyPage(memberid, gno, meetingid);
        ModelAndView mv = new ModelAndView();
        model.addAttribute("memeberid", memberid);
        model.addAttribute("meetingid", meetingid);
        model.addAttribute("gno", gno);
        mv.addObject("modifyView", modifyView);
        mv.setViewName("/gmeeting/modifyPage");

        return mv;
    }

    //정모 Modify
    @Secured("ROLE_USER")
    @PostMapping("/modify/{gno}/{meetingid}")
    public String modifyMeeting(@PathVariable("gno") int gno,
                                @PathVariable("meetingid") int meetingid,
                                GroupMeetingVo vo,
                                Authentication authentication ){
        HashMap<String, Object> map = new HashMap<>();
        String memberid = memberService.authMember(authentication);

        map.put("gno", gno);
        map.put("meetingid", meetingid);
        map.put("memberid", memberid);
        map.put("vo", vo);

        groupMeetingMapper.gMeetingModify(map);
        return "redirect:/gmeeting/view/" + meetingid + "/" + gno;
    }

    //정모 삭제
    @Secured("ROLE_USER")
    @GetMapping("/delete/{gno}/{meetingid}")
    public String DeleteBoard(@PathVariable("gno") int gno,
                              @PathVariable("meetingid") int meetingid,
                              Authentication authentication){
        HashMap<String, Object> map = new HashMap<>();
        String memberid = memberService.authMember(authentication);

        map.put("gno", gno);
        map.put("meetingid", meetingid);
        map.put("memberid", memberid);

        groupMeetingMapper.gMeetingDelete(map);

        return "redirect:/groups/view/" + gno;
    }

}
