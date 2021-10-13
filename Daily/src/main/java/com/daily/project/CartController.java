package com.daily.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;
import service.CartService;
import vo.CartVO;

@Log4j
@Controller
public class CartController {
	
	@Autowired
	CartService service;
	
	// 장바구니 담기
	@RequestMapping(value = "/addCart")
	public ModelAndView addCart(ModelAndView mv,CartVO cvo, HttpSession session,RedirectAttributes rttr) {
		//로그인 여부 확인
		String loginID = (String) session.getAttribute("loginInfo");
		System.out.println("*******login= "+loginID);
		if(loginID != null) {
			//로그인 상태
			cvo.setId(loginID);
			System.out.println("1");
			if(service.addCart(cvo)>0) {
				System.out.println("2");
				mv.addObject("success","T");
			}else {
				System.out.println("3");
				mv.addObject("success","F");
			}
		}else{//로그인 안한 상태
			System.out.println("4");
		mv.addObject("success","S");
		}
		mv.setViewName("jsonView");
		return mv;
	}
		
	// 장바구니 목록
	@RequestMapping(value = "/cartlist")
	public ModelAndView cartlist(ModelAndView mv, HttpSession session,RedirectAttributes rttr) {
		Map<String,Object> map = new HashMap<>();
		//hashmap은 map(key,value)로 이뤄져 있고,
        //key값은 중복이 불가능 하고 value는 중복이 가능하다.
        //value에 null값도 사용이 가능하다.
        //전달할 정보가 많을 경우에는 HashMap<>을 사용하는 것이 좋다.
        //장바구니에 담을 값들이 많기 때문에 여기선 HashMap<>를 사용한다.
		String loginInfo = (String)session.getAttribute("loginInfo");
		// 로그인 정보 확인
		if(loginInfo != null) {
			List<CartVO> list = service.cartList(loginInfo); // 장바구니 목록
			int sumMoney = service.sumMoney(loginInfo); // 금액 합계
			map.put("sumMoney",sumMoney);
			map.put("list", list);
			map.put("count",list.size()); //레코드 갯수
			
			mv.addObject("map", map); //데이터를 저장
			mv.setViewName("product_Board/cartList");
			
		}else {
			//로그인 안한경우
			rttr.addFlashAttribute("message", "로그인이 필요한 서비스 입니다.");
			mv.setViewName("redirect:mloginpage");
		}
		return mv;
	}
	// 장바구니 수정
	@RequestMapping(value = "/updateCart")
	public ModelAndView updateCart(ModelAndView mv,CartVO cvo, HttpSession session) {
		//로그인 확인
		System.out.println("** CVO =>"+ cvo);
		String loginInfo = (String)session.getAttribute("loginInfo");
		if(loginInfo != null) {
			cvo.setId(loginInfo);
			if(service.updateCart(cvo)>0) {
				mv.addObject("success", "T");
			}else {
				mv.addObject("success", "F"); // 로그인 정보는 있지만 업데이트 안됨
			}
		}else {
			mv.addObject("success", "F");
			System.out.println("**loginID is null**");
		}	
		mv.setViewName("jsonView");
		return mv;
		}
	
	// 장바구니 개별삭제
	@RequestMapping(value = "/deleteCart")
	public ModelAndView deleteCart(ModelAndView mv, CartVO cvo) {
		if(service.deleteCart(cvo)>0) {
			mv.addObject("message", "상품이 삭제 되었습니다.");
			mv.setViewName("redirect:cartlist");
		}else {
			mv.addObject("message", "상품 삭제 실패, 다시 시도해주세요.");
			mv.setViewName("redirect:productList");
		}
		return mv;
	}
	
	// 장바구니 전체삭제
	@RequestMapping(value = "/deleteAll")
	public ModelAndView deleteAll(ModelAndView mv, CartVO cvo, HttpSession session) {
		String loginInfo = null;
		if(session != null) {
			loginInfo = (String) session.getAttribute("loginInfo");
			if(loginInfo != null) {
				cvo.setId(loginInfo);
				if(service.deleteAll(cvo)>0) {
					mv.addObject("success", "T");
				}else {
					mv.addObject("success", "F"); //로그인정보는 있지만 삭제데이터 0
				}
			}else {
			mv.addObject("success", "F");
			System.out.println("**loginID is null**");
			}
		}else {
			mv.addObject("success", "F");
			System.out.println("**Session is null**");
		}
		mv.setViewName("jsonView");
		return mv;
	}//deleteAll
	
	
	
	
	
	
}//class
