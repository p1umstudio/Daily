package com.daily.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.MemberService;
import vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	MemberService service;

	// 기능-------------------------------------------------------------

	// ID 중복확인
	@RequestMapping(value = "/idCheck")
	public ModelAndView idCheck(ModelAndView mv, MemberVO vo) {
		// => 전달된 ID 의 존재여부 확인
		// => notNull : 존재 -> 사용불가
		// => Null : 없음 -> 사용가능
		// => 그러므로 전달된 ID 보관해야함
		mv.addObject("newID", vo.getId());
		if (service.mselectOne(vo) != null) {
			mv.addObject("idUse", "F"); // 사용불가
		} else
			mv.addObject("idUse", "T"); // 사용가능
		mv.setViewName("member/idDupCheck");
		return mv;
	} // idCheck

	// 회원가입
	@RequestMapping(value = "/msignup")
	public ModelAndView msignup(ModelAndView mv, MemberVO vo) {
		if (service.minsert(vo) > 0) {
			// 회원가입 성공
			mv.setViewName("redirect:mloginpage");
		} else {
			// 회원가입 실패
			mv.setViewName("redirect:msignuppage");
		}
		return mv;
	}

	// 개인정보 변경
	@RequestMapping(value = "/info_change")
	public ModelAndView info_change(ModelAndView mv, MemberVO vo) {
		if (service.changeinfo(vo) > 0) {
			// 개인정보 수정 성공

		} else {
			// 개인정보 수정 실패

		}
		mv.setViewName("redirect:minfopage");
		return mv;
	}

	
	//로그인
	@RequestMapping(value = "/mlogin")
	public ModelAndView mlogin(ModelAndView mv, MemberVO vo,HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String pw = vo.getPw();

		vo = service.mselectOne(vo);
		if (vo != null) {
			if (vo.getPw().equals(pw)) {
				// 로그인 성공
				session.setAttribute("loginInfo", vo.getId());
				session.setAttribute("rank",vo.getLv());
				mv.setViewName("redirect:home");
			}else {
				// password 틀림
				mv.addObject("message","비밀번호가 일치하지 않습니다. 다시시도해 주세요");
				mv.setViewName("redirect:mloginpage");
			}
		}else {
			mv.setViewName("redirect:mloginpage");
		}
		return mv;
	}


	
	// 로그아웃
	@RequestMapping(value = "/mlogout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mv, RedirectAttributes rttr) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		mv.setViewName("redirect:home");
		return mv;
	}

	// 아이디 찾기
	@RequestMapping(value = "/mfindid")
	public ModelAndView mfindid(HttpServletRequest request, ModelAndView mv, MemberVO vo) {
		vo = service.mfindid(vo);
		mv.addObject("findid", vo);
		mv.setViewName("member/findidResult");
		return mv;
	}

	// 비밀번호 찾기 (회원가입한 확인)
	@RequestMapping(value = "/mfindpwcheck")
	public ModelAndView mfindpwcheck(HttpServletRequest request, ModelAndView mv, MemberVO vo) {
		vo = service.mfindpw(vo);
		if (vo != null) {
			mv.addObject("vo", vo);
			mv.setViewName("member/findpwResult");
		} else {
			mv.setViewName("redirect:mfindpwpage");
		}
		return mv;
	}

	// 비밀번호 변경
	@RequestMapping(value = "/changepw")
	public ModelAndView changepw(ModelAndView mv, MemberVO vo, HttpSession session, HttpServletResponse response) {
		// jsonView 사용시 response 의 한글 처리
		response.setContentType("text/html; charset=UTF-8");
		if (service.changepw(vo) > 0) {
			// 성공
			if (session.getAttribute("loginInfo") != null) {
				// 로그인
				mv.addObject("message", "비밀번호가 변경되었습니다.");
				mv.setViewName("jsonView");
			} else {
				// 비로그인
				mv.addObject("message", "로그인이 필요한 서비스입니다.");
				mv.setViewName("redirect:mloginpage");
			}
		} else {
			mv.addObject("message", "비밀번호가 변경에 실패하였습니다. 다시시도해 주세요");
			if (session.getAttribute("loginInfo") != null) {
				// 로그인
			} else {
				// 비로그인
				mv.addObject("message", "로그인이 필요한 서비스입니다.");
				mv.setViewName("redirect:mloginpage");
			}
		}
		return mv;
	}

	// page 이동 -------------------------------------------------

	// 로그인 페이지
	@RequestMapping(value = "/info_pwchange_page")
	public ModelAndView info_pwchange_page(ModelAndView mv, MemberVO vo, HttpSession session) {
		if (session.getAttribute("loginInfo") != null) {
			vo.setId((String) session.getAttribute("loginInfo"));
			vo = service.mselectOne(vo);
			mv.addObject("Info", vo);
			mv.setViewName("member/info_pwchange_page");
		} else {// 비로그인
			mv.setViewName("redirect:mloginpage");
			mv.addObject("message", "로그인이 필요한 서비스입니다.");
		}
		return mv;
	}

	// 개인정보 변경 페이지
	@RequestMapping(value = "/password_change_page")
	public ModelAndView password_change_page(ModelAndView mv, MemberVO vo, HttpSession session) {
		// 로그인 확인
		if (session.getAttribute("loginInfo") != null) {
			vo.setId((String) session.getAttribute("loginInfo"));
			vo = service.mselectOne(vo);
			mv.addObject("Info", vo);
			mv.setViewName("member/info_change_page");
		} else {// 비로그인
			mv.setViewName("redirect:mloginpage");
			mv.addObject("message", "로그인이 필요한 서비스입니다.");
		}
		return mv;
	}

	// 개인정보 변경 페이지
	@RequestMapping(value = "/info_change_page")
	public ModelAndView info_change_page(ModelAndView mv, MemberVO vo, HttpSession session) {
		// 로그인 확인
		if (session.getAttribute("loginInfo") != null) {
			vo.setId((String) session.getAttribute("loginInfo"));
			vo = service.mselectOne(vo);
			mv.addObject("Info", vo);
			mv.setViewName("member/info_change_page");
		} else {// 비로그인
			mv.setViewName("redirect:mloginpage");
			mv.addObject("message", "로그인이 필요한 서비스입니다.");
		}
		return mv;
	}
	// ajax close 페이지
			@RequestMapping(value = "/closepage")
			public ModelAndView closepage(ModelAndView mv) {
				mv.setViewName("product_qna/close");
				return mv;
			}
	
	// ajax 로그인 페이지
		@RequestMapping(value = "/popmloginpage")
		public ModelAndView popmloginpage(ModelAndView mv) {
			mv.setViewName("member/mloginPageajax");
			return mv;
		}
	
	// 로그인 페이지
	@RequestMapping(value = "/mloginpage")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("member/mloginPage");
		return mv;
	}

	// 회원가입페이지
	@RequestMapping(value = "/msignuppage")
	public ModelAndView msignuppage(ModelAndView mv) {
		mv.setViewName("member/signupPage");
		return mv;
	}

	// 아이디 찾기 페이지
	@RequestMapping(value = "/mfindidpage")
	public ModelAndView mfindidpage(ModelAndView mv) {
		mv.setViewName("member/findidPage");
		return mv;
	}

	// 비밀번호 찾기 패이지
	@RequestMapping(value = "/mfindpwpage")
	public ModelAndView mfindpwpage(ModelAndView mv) {
		mv.setViewName("member/findpwPage");
		return mv;
	}

	// 마이페이지
	@RequestMapping(value = "/mypage")
	public ModelAndView mypage(ModelAndView mv, HttpSession session) {
		if (session.getAttribute("loginInfo") != null) {
			mv.setViewName("member/myPage");
		} else {
			mv.setViewName("redirect:mloginpage");
			mv.addObject("message", "로그인이 필요한 서비스입니다.");
		}
		return mv;
	}

	// 개인정보 페이지
	@RequestMapping(value = "/minfopage")
	public ModelAndView minfopage(ModelAndView mv, HttpServletRequest request, MemberVO vo) {
		HttpSession session = request.getSession(false);
		// 로그인 했을경우
		if (session.getAttribute("loginInfo") != null) {
			vo.setId((String)session.getAttribute("loginInfo"));
			vo = service.mselectOne(vo);
			if (vo != null) {
				mv.addObject("loginInfo", vo);
				mv.setViewName("member/minfopage");
			} else {
				mv.setViewName("member/mloginpage");
			}

		} else {
			// 비로그인 상태
			mv.setViewName("member/mloginpage");
		}
		return mv;
	}

}// MemberController
