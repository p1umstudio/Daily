package com.daily.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import vo.MemberVO;

@Controller
public class AdminController {

	@Autowired
	MemberService memberService;

	// 기능-------------------------------------------------------------

	// ID 중복확인
	@RequestMapping(value = "/manageMemberPage")
	public ModelAndView manageMemberPage(ModelAndView mv, MemberVO vo) {
		List<MemberVO> list = memberService.mselectList();
		mv.addObject("memberList",list);
		mv.setViewName("admin/manageMemberPage");
		return mv;
	} // idCheck
	


}// class
