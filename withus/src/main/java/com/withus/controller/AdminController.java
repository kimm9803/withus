package com.withus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.withus.domain.Criteria;
import com.withus.domain.GroupReportVo;
import com.withus.domain.GroupsVo;
import com.withus.domain.MemberReportVo;
import com.withus.domain.MemberVo;
import com.withus.domain.PageMaker;
import com.withus.mapper.AdminMapper;
import com.withus.mapper.GroupsMapper;
import com.withus.mapper.MemberMapper;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private GroupsMapper groupsMapper;
	
	

	// 관리자 페이지
	@GetMapping("/page")
	public String getAdminPage() {
		return "admin/adminPage";
	}
	
	// 회원 전체 리스트
	@GetMapping("/user/list")
	public String getUserList(Criteria cri, Model model) {
		String role = "ROLE_USER";
		Map<String, Object> map = new HashMap<>();
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd", cri.getRowEnd());
		map.put("role", role);
		List<MemberVo> memberList = memberMapper.getMemberList(map);
		model.addAttribute("memberList", memberList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberMapper.totalMemberCount());
		model.addAttribute("pageMaker", pageMaker);

		return "admin/memberList";
	}
	// 그룹 전체 리스트
	@GetMapping("/group/list")
	public String getGroupList(Criteria cri, Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd", cri.getRowEnd());
		
		List<GroupsVo> groupList = groupsMapper.getGroupList(map);
		model.addAttribute("groupList", groupList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(groupsMapper.totalGroupCount(null));
		model.addAttribute("pageMaker", pageMaker);
		return "admin/groupList";
	}

	// 그룹 신고 내역
	@GetMapping("/group/reportlist")
	public String groupReportList(Criteria cri, Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd", cri.getRowEnd());
		List<GroupReportVo> gReportList = adminMapper.gReportList(map);
		model.addAttribute("gReportList", gReportList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminMapper.totalReportCount());
		model.addAttribute("pageMaker", pageMaker);

		return "admin/greportList";
	}

	// 그룹 신고 내용
	@GetMapping("/group/reportview/{greportid}")
	public String groupReportView(@PathVariable("greportid") int greportid, Model model) {
		GroupReportVo gReportView = adminMapper.gReportView(greportid);
		model.addAttribute("report", gReportView);
		return "admin/greportView";
	}

	// 그룹 신고 인정
	@GetMapping("/group/reportadmit/{greportid}")
	public String groupReportAdmit(@PathVariable("greportid") int greportid) {
		// 그룹신고 인정 후 신고상태 변경
		adminMapper.gReportAdmit(greportid);

		// 그룹번호찾기
		int gno = adminMapper.findGno(greportid);

		// 신고인정 그룹 신고수 + 1
		adminMapper.gGroupReport(gno);

		return "redirect:/admin/group/reportlist";
	}

	// 그룹 신고 거부
	@GetMapping("/group/reportreject/{greportid}")
	public String groupReportReject(@PathVariable("greportid") int greportid) {
		// 그룹신고 거부 후 신고상태 변경
		adminMapper.gReportReject(greportid);
		return "redirect:/admin/group/reportlist";
	}

	// 회원 신고 내역
	@GetMapping("/user/report-list")
	public String memberReportList(Criteria cri, Model model) {
		List<MemberReportVo> mReportList = adminMapper.mReportList(cri);
		model.addAttribute("mReportList", mReportList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminMapper.totalMemberReportCount());
		model.addAttribute("pageMaker", pageMaker);

		return "admin/mreportList";
	}

	// 회원 신고 내용
	@GetMapping("/user/reportview/{mreportId}")
	public String memberReportView(@PathVariable("mreportId") int mreportId, Model model) {
		MemberReportVo mReportView = adminMapper.mReportView(mreportId);
		model.addAttribute("report", mReportView);
		return "admin/mreportView";
	}

	// 회원 신고 인정
	@GetMapping("/user/reportadmit/{mreportId}")
	public String userReportAdmit(@PathVariable("mreportId") int mreportId) {
		// 회원신고 인정 후 신고상태 변경
		adminMapper.mReportAdmit(mreportId);

		// 신고인정 회원 신고수 + 1
		MemberReportVo memberReportVo = adminMapper.mReportView(mreportId);
		adminMapper.reportIncrease(memberReportVo.getReportedId());
		
		return "redirect:/admin/user/report-list";
	}

	// 회원 신고 거부
	@GetMapping("/user/reportreject/{mreportId}")
	public String userReportReject(@PathVariable("mreportId") int mreportId) {
		// 회원신고 거부 후 신고상태 변경
		adminMapper.mReportReject(mreportId);
		return "redirect:/admin/user/report-list";
	}

	// 회원 강제 탈퇴
	@GetMapping("/user/delete")
	public String deleteUser(@RequestParam("memberId") String memberId) {
		adminMapper.deleteUser(memberId);
		return "redirect:/admin/user/list";
	}	

}
