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
import service.ProductService;
import service.Product_qnaService;
import vo.ProductVO;
import vo.Product_qnaVO;

@Log4j
@Controller
public class Product_qnaController {

	@Autowired
	Product_qnaService service;
	@Autowired
	ProductService pservice;
	
	@RequestMapping(value = "/pqnareplyForm")
	public ModelAndView pqnareplyForm(ModelAndView mv, Product_qnaVO vo) {
		mv.setViewName("product_qna/prodqna_replyForm");
		log.info("** replyf vo :" + vo);
		return mv;
	}

	@RequestMapping(value = "/pqnareply")
	public ModelAndView pqnareply(ModelAndView mv, Product_qnaVO vo, RedirectAttributes rttr) {
		vo.setStep(vo.getStep()+1);

		if (service.replyInsert(vo) > 0) {
			rttr.addFlashAttribute("message", "답글이 등록 되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "답글등록이 취소 되었습니다");
		}
		mv.setViewName("redirect:pqna_list");
		return mv;
	}

	// CRUD=========================================================
	// Qna list
	@RequestMapping(value = "/pqnaList")
	public ModelAndView pqnaList(ModelAndView mv, HttpServletRequest request ) {
		
		List<Product_qnaVO> list = service.selectList();
		System.out.println(list);
		if (list != null) {
			mv.addObject("pqList", list);
			
		} else {
			mv.addObject("message", "출력할 게시글이 없습니다.");
		}
		mv.setViewName("product_qna/prodqna_list");
		return mv;
	}

	@RequestMapping(value = "/pqnaDetail")
	public ModelAndView pqnaDetail(ModelAndView mv, HttpServletRequest request, Product_qnaVO vo, RedirectAttributes rttr) {

		HttpSession session = request.getSession(false);

		if (session != null && session.getAttribute("loginInfo") != null) {
				
			  vo = service.selectOne(vo);
			if (vo != null) {
				request.setAttribute("pqna_detail", vo);
				if ("Update".equals(request.getParameter("jcode"))) {
					mv.setViewName("product_Board/prodqna_updateForm");
				} else {
					mv.setViewName("product_qna/prodqna_Detail");
				}
			} else {
				rttr.addFlashAttribute("message", "글번호에 해당하는 글을 찾을 수 없습니다 ~~");
				mv.setViewName("redirect:pqnaList"); 
			}
		}else {
			mv.addObject("message", "~~ 로그인 정보가 없습니다 !! 로그인 후 다시 하세요  ~~");
			mv.setViewName("member/mloginPage"); 
		}

		return mv;
	}//qnadetail
	
	@RequestMapping(value="/pqnaInsertForm")
	public ModelAndView pqna_insertForm(ModelAndView mv) {
		mv.setViewName("product_qna/prodqna_insertForm");
		return mv; 
	}
	
	@RequestMapping(value="/pqnaInsert")
	public ModelAndView pqnaInsert(ModelAndView mv, Product_qnaVO vo, RedirectAttributes rttr ) {
		if (service.insert(vo)>0) {
			rttr.addFlashAttribute("message", "댓글이 등록 되었습니다.");
			mv.setViewName("redirect:pqnaList");
		}else {
			rttr.addFlashAttribute("message", "댓글등록에 실패하셨습니다. 다시 등록해주십시오. ");
			mv.setViewName("product_qna/prodqna_insertForm");
		}
		return mv;
	}
	
	@RequestMapping(value="/pqnaUpdate")
	public ModelAndView pqnaUpdate(ModelAndView mv, Product_qnaVO vo , RedirectAttributes rttr) {
		if (service.update(vo)>0) {
			rttr.addFlashAttribute("message", "글 수정이 성공되었습니다.");
			mv.setViewName("redirect:pqnaList");
		}else {
			rttr.addFlashAttribute("message","글 수정에 실패하셨습니다. 다시 하여 주십시오.");
			mv.setViewName("redirect:pqnaDetail?prodqnanum="+vo.getProdqnanum()+"&jcode=Update");
		}
		return mv ;
	}
	
	@RequestMapping(value="/pqnaDelete")
	public ModelAndView pqnaDelete(ModelAndView mv, Product_qnaVO vo, RedirectAttributes rttr) {
		if (service.delete(vo)>0) {
			rttr.addFlashAttribute("message","댓글이 삭제되셧습니다.");
			mv.setViewName("redirect:pqnaList");
		}else {
			rttr.addFlashAttribute("message","댓글 삭제에 실패하셨습니다 다시 하여 주십시오.");
			mv.setViewName("redirect:pqnaDetail?prodqnanum="+vo.getProdqnanum());
		}
		return mv; 
	}

}// class
