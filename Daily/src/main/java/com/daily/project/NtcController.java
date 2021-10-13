package com.daily.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;
import service.NtcService;
import vo.NtcVO;
@Controller
public class NtcController {
	@Autowired
	NtcService service;

	@RequestMapping(value = "/ntclist")
	public ModelAndView ntclist(ModelAndView mv) {
		List<NtcVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Ntclist", list);
		} else {
			mv.addObject("message", "출력할게시글이없습니다.");
		}
		mv.setViewName("servicecenter/Noticelist");
		return mv;
	}

	@RequestMapping(value = "/ntcdetail")
	public ModelAndView ntcdetail(ModelAndView mv, HttpServletRequest request, NtcVO nvo, RedirectAttributes rttr) {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("loginID") != null) {
			nvo = service.selectOne(nvo);
			
			if (nvo != null) {
				request.setAttribute("Ntcdetail", nvo);
				if ("Update".equals(request.getParameter("jcode"))) {
					mv.setViewName("servicecenter/NoticeupdateForm");
				}else {
					mv.setViewName("servicecenter/NoticeDetail");
				}
			} else {
				rttr.addFlashAttribute("message","글번호에 해당하는 글을 찾을 수 없습니다 ~~");
				mv.setViewName("redirect:ntclist");
			}
		}else {
			mv.addObject("message", "~~ 로그인 정보가 없습니다 !! 로그인 후 다시 하세요  ~~");
			mv.setViewName("member/loginPage"); 
		}

		return mv;
	}
	
	@RequestMapping(value="/ntcinsertf")
	public ModelAndView ntcinsertf(ModelAndView mv) {
		mv.setViewName("servicecenter/NoticeinsertForm");
		return mv; 
	}
	
	@RequestMapping(value="/ntcinsert")
	public ModelAndView ntcinsert(ModelAndView mv, NtcVO nvo, RedirectAttributes rttr ) {
		if (service.insert(nvo)>0) {
			rttr.addFlashAttribute("message", "문의가 등록 되었습니다.");
			mv.setViewName("redirect:ntclist");
		}else {
			rttr.addFlashAttribute("message", "문의등록에 실패하셨습니다. 다시 등록해주십시오. ");
			mv.setViewName("servicecenter/NoticeinsertForm");
		}
		return mv;
	}
	
	@RequestMapping(value="/ntcupdate")
	public ModelAndView ntcupdate(ModelAndView mv, NtcVO nvo , RedirectAttributes rttr) {
		if (service.update(nvo)>0) {
			rttr.addFlashAttribute("message", "글 수정이 성공되었습니다.");
			mv.setViewName("redirect:ntclist");
		}else {
			rttr.addFlashAttribute("message","글 수정에 실패하셨습니다. 다시 하여 주십시오.");
			mv.setViewName("redirect:ntcdetail?ntcnum="+nvo.getNtcnum()+"&jcode=Update");
		}
		return mv ;
	}
	
	@RequestMapping(value="/ntcdelete")
	public ModelAndView ntcdelete(ModelAndView mv, NtcVO nvo, RedirectAttributes rttr) {
		if (service.delete(nvo)>0) {
			rttr.addFlashAttribute("message","문의가 삭제되셧습니다.");
			mv.setViewName("redirect:ntclist");
		}else {
			rttr.addFlashAttribute("message","문의 삭제에 실패하셨습니다 다시 하여 주십시오.");
			mv.setViewName("redirect:ntcdetail?ntcnum="+nvo.getNtcnum());
		}
		return mv; 
	}
}
