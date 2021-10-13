package com.daily.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.OrdersService;
import service.ReviewService;
import service.WishListService;
import vo.OrdersVO;
import vo.ReviewVO;
import vo.WishListVO;

@Controller
public class MypageController {
	@Autowired
	OrdersService ordersservice;
	@Autowired
	WishListService wishservice;
	@Autowired
	ReviewService reviewservice;
	// 기능-------------------------------------------------------------
	@RequestMapping(value = "/wishlistdeleteone")
	public ModelAndView wishlistdeleteone(ModelAndView mv, WishListVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		if(session.getAttribute("loginInfo")!=null) {
			//로그인 상태
			vo.setId((String)session.getAttribute("loginInfo"));
			if(wishservice.deleteOne(vo)>0) {
				//삭제성공 id, wlnum 참고해서 지움
				mv.addObject("complete","T");
			}else {
				//삭제 실패 
				mv.addObject("complete","F");
			}
		}else {
			// 로그인 안한 상태 - 로그인창으로 
			mv.setViewName("member/mloginPage");
		}
		mv.setViewName("redirect:wishlistpage");
		return mv;
	}


	// page 이동 -------------------------------------------------	

	// 주문목록 페이지
	@RequestMapping(value = "/orderListPage")
	public ModelAndView orderListPage(ModelAndView mv, OrdersVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		// 로그인 한 아이디 기준으로 검색 
		if(session.getAttribute("loginInfo")!=null) {
			//로그인상태
			vo.setId((String)session.getAttribute("loginInfo"));
			List<OrdersVO> list = ordersservice.ordersList(vo);
			if(list != null) {
				mv.addObject("orderlist", list);
				mv.setViewName("member/orderPage");
			}else {
				
			}
		}else {
			// 로그인 안한 상태 - 로그인창으로 
			mv.setViewName("member/mloginPage");
		}
		return mv;
	}
	
	// 위시리스트 페이지
	@RequestMapping(value = "/wishlistpage")
	public ModelAndView wishlistpage(ModelAndView mv, WishListVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		// 로그인 한 아이디 기준으로 검색 
		if(session.getAttribute("loginInfo")!=null) {
			//로그인상태
			vo.setId((String)session.getAttribute("loginInfo"));
			List<WishListVO> list = wishservice.WishList(vo);
			if(list.size() > 0) {
				//찜목록 있음
				mv.addObject("wishlist",list);
				mv.addObject("complete","T");
			}else if(list.size() == 0) {
				//찜목록 없음
				mv.addObject("complete","F");
			}
			mv.setViewName("mypage/wishlistpage");
		}else {
			// 로그인 안한 상태 - 로그인창으로 
			mv.setViewName("member/mloginPage");
		}
		System.out.println(mv);
		return mv;
	}

	// 리뷰관리 페이지
	@RequestMapping(value = "/myreviewpage")
	public ModelAndView myreviewpage(ModelAndView mv, ReviewVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		// 로그인 한 아이디 기준으로 검색 
		if(session.getAttribute("loginInfo")!=null) {
			//로그인상태
			vo.setId((String)session.getAttribute("loginInfo"));
			List<ReviewVO> list = reviewservice.myreview(vo);
			if(list.size() > 0) {
				//리뷰 있음
				mv.addObject("myreview",list);
				mv.addObject("complete","T");
			}else if(list.size() == 0) {
				//리뷰 없음
				mv.addObject("complete","F");
			}
			mv.setViewName("mypage/myreviewpage");
		}else {
			// 로그인 안한 상태 - 로그인창으로 
			mv.setViewName("member/mloginPage");
		}
		System.out.println(mv);
		return mv;
	}

}// MemberController
