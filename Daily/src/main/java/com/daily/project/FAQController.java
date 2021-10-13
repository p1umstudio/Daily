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
import service.FAQService;
import vo.FAQVO;

@Log4j
@Controller
public class FAQController {

	@Autowired
	FAQService service;

	@RequestMapping(value = "/faqlist")
	public ModelAndView faqlist(ModelAndView mv) {
		List<FAQVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Faqlist", list);
		} else {
			mv.addObject("message", "출력할게시글이없습니다.");
		}
		mv.setViewName("servicecenter/FAQlist");
		return mv;
	}

	@RequestMapping(value = "/faqdetail")
	public ModelAndView faqdetail(ModelAndView mv, HttpServletRequest request, FAQVO fvo, RedirectAttributes rttr) {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("loginID") != null) {
			fvo = service.selectOne(fvo);
			
			if (fvo != null) {
				request.setAttribute("Faqdetail", fvo);
				if ("Update".equals(request.getParameter("jcode"))) {
					mv.setViewName("servicecenter/FAQupdateForm");
				}else {
					mv.setViewName("servicecenter/FAQDetail");
				}
			} else {
				rttr.addFlashAttribute("message","글번호에 해당하는 글을 찾을 수 없습니다 ~~");
				mv.setViewName("redirect:faqlist");
			}
		}else {
			mv.addObject("message", "~~ 로그인 정보가 없습니다 !! 로그인 후 다시 하세요  ~~");
			mv.setViewName("member/loginPage"); 
		}

		return mv;
	}
	
	@RequestMapping(value="/faqinsertf")
	public ModelAndView faqinsertf(ModelAndView mv) {
		mv.setViewName("servicecenter/FAQinsertForm");
		return mv; 
	}
	
	@RequestMapping(value="/faqinsert")
	public ModelAndView faqinsert(ModelAndView mv, FAQVO fvo, RedirectAttributes rttr ) {
		if (service.insert(fvo)>0) {
			rttr.addFlashAttribute("message", "문의가 등록 되었습니다.");
			mv.setViewName("redirect:faqlist");
		}else {
			rttr.addFlashAttribute("message", "문의등록에 실패하셨습니다. 다시 등록해주십시오. ");
			mv.setViewName("servicecenter/FAQinsertForm");
		}
		return mv;
	}
	
	@RequestMapping(value="/faqupdate")
	public ModelAndView faqupdate(ModelAndView mv, FAQVO fvo , RedirectAttributes rttr) {
		if (service.update(fvo)>0) {
			rttr.addFlashAttribute("message", "글 수정이 성공되었습니다.");
			mv.setViewName("redirect:faqlist");
		}else {
			rttr.addFlashAttribute("message","글 수정에 실패하셨습니다. 다시 하여 주십시오.");
			mv.setViewName("redirect:faqdetail?faqnum="+fvo.getFaqnum()+"&jcode=Update");
		}
		return mv ;
	}
	
	@RequestMapping(value="/faqdelete")
	public ModelAndView faqdelete(ModelAndView mv, FAQVO fvo, RedirectAttributes rttr) {
		if (service.delete(fvo)>0) {
			rttr.addFlashAttribute("message","문의가 삭제되셧습니다.");
			mv.setViewName("redirect:faqlist");
		}else {
			rttr.addFlashAttribute("message","문의 삭제에 실패하셨습니다 다시 하여 주십시오.");
			mv.setViewName("redirect:faqdetail?faqnum="+fvo.getFaqnum());
		}
		return mv; 
	}
}// class
