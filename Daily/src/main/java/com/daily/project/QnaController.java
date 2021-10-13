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
import service.QnaService;
import vo.QnaVO;

@Log4j
@Controller
public class QnaController {

	@Autowired
	QnaService service;

	@RequestMapping(value = "/replyf")
	public ModelAndView replyf(ModelAndView mv, QnaVO qvo) {
		mv.setViewName("servicecenter/replyForm");
		log.info("** replyf vo :" + qvo);
		return mv;
	}

	@RequestMapping(value = "/reply")
	public ModelAndView reply(ModelAndView mv, QnaVO qvo, RedirectAttributes rttr) {
		qvo.setStep(qvo.getStep()+1);

		if (service.replyInsert(qvo) > 0) {
			rttr.addFlashAttribute("message", "답글이 등록 되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "답글등록이 취소 되었습니다");
		}
		mv.setViewName("redirect:qnalist");
		return mv;
	}

	// CRUD=========================================================
	// Qna list
	@RequestMapping(value = "/qnalist")
	public ModelAndView qnalist(ModelAndView mv) {
		
		List<QnaVO> list = service.selectList();
		// 관리자 레벨 가져올것 
		if (list != null) {
			mv.addObject("Qnalist", list);
		} else {
			mv.addObject("message", "출력할 게시글이 없습니다.");
		}
		mv.setViewName("servicecenter/Qnalist");
		return mv;
	}

	@RequestMapping(value = "/qnadetail")
	public ModelAndView qnadetail(ModelAndView mv, HttpServletRequest request, QnaVO qvo, RedirectAttributes rttr) {

		HttpSession session = request.getSession(false);

		if (session != null && session.getAttribute("loginInfo") != null) {
				
			  qvo = service.selectOne(qvo);
			if (qvo != null) {
				request.setAttribute("Qnadetail", qvo);
				if ("Update".equals(request.getParameter("jcode"))) {
					mv.setViewName("servicecenter/QnaupdateForm");
				} else {
					mv.setViewName("servicecenter/QnaDetail");
				}
			} else {
				rttr.addFlashAttribute("message", "글번호에 해당하는 글을 찾을 수 없습니다 ~~");
				mv.setViewName("redirect:qnalist"); 
			}
		}else {
			mv.addObject("message", "~~ 로그인 정보가 없습니다 !! 로그인 후 다시 하세요  ~~");
			mv.setViewName("member/loginPage"); 
		}

		return mv;
	}//qnadetail
	
	@RequestMapping(value="/qnainsertf")
	public ModelAndView qnainsertf(ModelAndView mv) {
		mv.setViewName("servicecenter/QnainsertForm");
		return mv; 
	}
	
	@RequestMapping(value="/qnainsert")
	public ModelAndView qnainsert(ModelAndView mv, QnaVO qvo, RedirectAttributes rttr ) {
		if (service.insert(qvo)>0) {
			rttr.addFlashAttribute("message", "문의가 등록 되었습니다.");
			mv.setViewName("redirect:qnalist");
		}else {
			rttr.addFlashAttribute("message", "문의등록에 실패하셨습니다. 다시 등록해주십시오. ");
			mv.setViewName("servicecenter/QnainsertForm");
		}
		return mv;
	}
	
	@RequestMapping(value="/qnaupdate")
	public ModelAndView qnaupdate(ModelAndView mv, QnaVO qvo , RedirectAttributes rttr) {
		if (service.update(qvo)>0) {
			rttr.addFlashAttribute("message", "글 수정이 성공되었습니다.");
			mv.setViewName("redirect:qnalist");
		}else {
			rttr.addFlashAttribute("message","글 수정에 실패하셨습니다. 다시 하여 주십시오.");
			mv.setViewName("redirect:Qnadetail?qnanum="+qvo.getQnanum()+"&jcode=Update");
		}
		return mv ;
	}
	
	@RequestMapping(value="/qnadelete")
	public ModelAndView qnadelete(ModelAndView mv, QnaVO qvo, RedirectAttributes rttr) {
		if (service.delete(qvo)>0) {
			rttr.addFlashAttribute("message","문의가 삭제되셧습니다.");
			mv.setViewName("redirect:qnalist");
		}else {
			rttr.addFlashAttribute("message","문의 삭제에 실패하셨습니다 다시 하여 주십시오.");
			mv.setViewName("redirect:qnadetail?qnanum="+qvo.getQnanum());
		}
		return mv; 
	}
	
	
	
	
	
	
	
	
	
	

}// class
