package com.withus.controller;


import com.withus.domain.GroupBoardReplyVo;
import com.withus.domain.GroupBoardVo;

import com.withus.mapper.GroupBoardMapper;
import com.withus.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/gboard")
public class GroupBoardController {

	@Autowired
	private GroupBoardMapper groupBoardMapper;

	@Autowired
	private MemberService memberService;

	//그룹 게시판 작성 페이지 조회
	@Secured("ROLE_USER")
	@GetMapping("/create/{gno}")
	public String gBoardCreatePage(@PathVariable("gno") int gno, Model model, Authentication authentication) {
		String memberId = memberService.authMember(authentication);
		model.addAttribute("memberid", memberId);
		model.addAttribute("gno");

		return "gboard/create";
	}
	//작성
	@Secured("ROLE_USER")
	@PostMapping("/create")
	public String create(GroupBoardVo vo) {
		//System.out.println(vo.getGbcateid());
		groupBoardMapper.gBoardCreate(vo);
		int gno = vo.getGno();
		return "redirect:/groups/view/" + gno;
	}

	//그룹 게시판 List 조회
	@Secured("ROLE_USER")
	@GetMapping("/list/{gno}")
	public ModelAndView list(@PathVariable int gno,GroupBoardVo vo) {
		List<GroupBoardVo> groupBoardList = groupBoardMapper.gBoardList(gno);
		ModelAndView mv = new ModelAndView();
		mv.addObject("groupBoardList", groupBoardList);
		mv.setViewName("/gboard/list");

		return mv;
	}

	//그룹 게시판 View 조회
	@Secured("ROLE_USER")
	@GetMapping("/view")
	public ModelAndView view(@RequestParam("gbno") int gbno) {

		GroupBoardVo groupBoardView = groupBoardMapper.gBoardView(gbno);
		ModelAndView mv = new ModelAndView();

		mv.addObject("groupBoardView", groupBoardView);
		mv.setViewName("/gboard/view");

		return mv;
	}


	//그룹 게시글 수정하는 페이지
	@Secured("ROLE_USER")
	@GetMapping("/modifypage/{gbno}/{gno}")
	public ModelAndView modifyView(//@PathVariable("memberid") String memberid,
								   @PathVariable("gbno") int gbno,
								   @PathVariable("gno") int gno,
								   Authentication authentication,
								   Model model)  {
		String memberid = memberService.authMember(authentication);
		GroupBoardVo modifyView = groupBoardMapper.gBoardModifyPage(memberid, gbno, gno);
		ModelAndView mv = new ModelAndView();
		model.addAttribute("memeberid", memberid);
		model.addAttribute("gbno", gbno);
		model.addAttribute("gno", gno);
		mv.addObject("modifyView", modifyView);
		mv.setViewName("/gboard/modifypage");
		System.out.println(modifyView.getTitle());
		return mv;
	}

	//그룹 게시글 수정
	@Secured("ROLE_USER")
	@PostMapping("/modify/{gbno}/{gno}")
	public String modifyBoard(@PathVariable("gbno") int gbno,
							  @PathVariable("gno") int gno,
							  //@PathVariable("memberid") String memberid,
							  Authentication authentication,
							  GroupBoardVo vo) {

		HashMap<String, Object> map =new HashMap<>();
		String memberid = memberService.authMember(authentication);

		map.put("gbno", gbno);
		map.put("gno", gno);
		map.put("memberid", memberid);
		map.put("vo", vo);

		groupBoardMapper.gBoardModify(map);

		return "redirect:/gboard/view?gbno=" + gbno;
	}

	//그룹 게시글 삭제
	@Secured("ROLE_USER")
	@GetMapping("/delete/{gbno}/{gno}")
	public String DeleteBoard(@PathVariable("gbno") int gbno,
							  @PathVariable("gno") int gno,
							 // @PathVariable("memberid") String memberid,
							  Authentication authentication){
		HashMap<String, Object> map = new HashMap<>();
		String memberid = memberService.authMember(authentication);

		map.put("gbno", gbno);
		map.put("gno", gno);
		//map.put("memberid", memberid);
		map.put("memberid", memberid);
		groupBoardMapper.gBoardDelete(map);

		return "redirect:/groups/view/" + gno;
	}

	//그룹 게시글에 댓글 작성
	@Secured("ROLE_USER")
	@RequestMapping(value = "/reply", consumes = "multipart/form-data")
	@ResponseBody
	public String ReplyBoard(GroupBoardReplyVo replyVo,
							 @RequestParam("gbno") int gbno,
							 @RequestParam("gno") int gno,
							 Authentication authentication){
		String memberid = memberService.authMember(authentication);

		replyVo.setMemberid(memberid);
		replyVo.setGno(gno);
		replyVo.setGbno(gbno);

		//확인용 로그 출력
		System.out.println("Received replyVo" + replyVo);

		groupBoardMapper.GBReplyCreate(replyVo);

		return "success";
	}

	//그룹 게시글에 댓글 목록
	@Secured("ROLE_USER")
	@GetMapping("/comments")
	@ResponseBody
	public List<GroupBoardReplyVo> getComments(@RequestParam("gbno") int gbno,
											   @RequestParam("gno") int gno,
											   Authentication authentication)
	{
		String memberid = memberService.authMember(authentication);
		return groupBoardMapper.getComments(gbno, gno, memberid);
	}
	//그룹 게시글 댓글 수정
	@PostMapping("/commentModify")
	@ResponseBody
	public void commentModify(@RequestParam("replyid") int replyid,
						      @RequestParam("content") String content,
						      GroupBoardReplyVo replyVo){
		replyVo.setReplyid(replyid);
		replyVo.setContent(content);
		groupBoardMapper.commentModify(replyVo);
	}

	//그룹 게시글 댓글 삭제
	@PostMapping("/deleteComment")
	@ResponseBody
	public void deleteComment(@RequestParam("replyid") int replyid,
							  @RequestParam("memberid") String memberid){
		groupBoardMapper.commentDelete(replyid, memberid);
	}
}

