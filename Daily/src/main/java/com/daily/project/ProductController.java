package com.daily.project;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Pageing.PageMaker;
import Pageing.PageRow;
import Pageing.Searchpage;
import lombok.extern.log4j.Log4j;
import service.ProductService;
import vo.ProductVO;

@Log4j
@Controller
public class ProductController {

	@Autowired
	ProductService service; // 전역 변수 서비스
	
	
	//optionsearchlist 
			@RequestMapping(value="poslist")
			public ModelAndView poslist(ModelAndView mv,Searchpage spage, PageMaker pageMaker,HttpServletRequest request) {
				
				try {
					log.info("currpage 값 확인 =>"+request.getParameter("currPage")); 
					//페이징 uri의 현재페이지 값을 set
					spage.setCurrpage(Integer.parseInt(request.getParameter("currPage")));
				} catch (NumberFormatException e) {
					System.out.println("잘못된 currpage 입니다");
				}
				
				//페이지 값 내용 열 set
				spage.setSnoEno();
				List<ProductVO> list = service.optionsearchList(spage);
				//옵션 선택 쿼리;
				mv.addObject("spList",list);
				
				//시작번호 끝 번호
				pageMaker.setPage(spage);
				
				//페이지바 총개수 set
				pageMaker.setTotalRowCount(service.searchRowsCount(spage));
				
				mv.addObject("pageMaker",pageMaker);
				mv.setViewName("product_Board/ppageSearchList");
				System.out.println("list=="+list);
				return mv;
			}
	
	//상품 리스트
	@RequestMapping(value = "/pdlist")
	public ModelAndView pdlist(ModelAndView mv) {
		List<ProductVO> list = service.selectList();
		if(list != null ) {  
			System.out.println("** List =>"+list);
			mv.addObject("Product", list); //product에 list를 담는
		}else {
			mv.addObject("message","현재 상품을 준비중입니다. 조금만 기다려주세요." );
		}
		mv.setViewName("product_Board/productList");
		return mv;
	}
	
	//상품 등록 폼
	@RequestMapping(value = "/pdregistf")
	public ModelAndView pdregistf(ModelAndView mv) {
		mv.setViewName("product_Board/productRegist");
		return mv;
	}
	
	//상품 등록
	@RequestMapping(value = "/pdregist")
	public ModelAndView pdregist(ModelAndView mv, ProductVO vo, HttpServletRequest request )throws IOException {
		// => 1-1) 이클립스 개발환경(배포전)윈도우버전
		// => E:\MTest\MyWork\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\Spring03\
		// => Mac : /Users/h-h/Documents/MTest/MyWork/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Daily/
		// => 1-2) 톰캣 서버에 배포후 : 서버내에서의 위치가 됨 (위치는 달라질수 있음)
		// => E:\MTest\IDESet\apache-tomcat-9.0.41\webapps\Spring03\
		//이미지 업로드
		String realPath = request.getRealPath("/");
		System.out.println("** real=>"+realPath);
		
		if(realPath.contains(".eclipse."))
			realPath = "/Users/h-h/Documents/project/Daily/src/main/webapp/resources/uploadImage/";
		else realPath += "resources/uploadImage/";
		//폴더 확인 
		File f1 = new File(realPath); //realPath에 있는 경로에 파일이 있는지 확인
			if(!f1.exists()) f1.mkdir(); // 만약 없다면 폴더를 생성
			String file1, file2 = "resources/uploadImage"+"/belt1.jpg"; 
			 //DB+파일경로 업로드 위한 기본 이미지값 지정
		MultipartFile imagef = vo.getImagef();
		if(imagef != null && !imagef.isEmpty()) {
			file1 = realPath + imagef.getOriginalFilename();
			//uploadfilef에 있는 모든 값중에[ex)aaa.gif]파일명만 추출 메소드
			imagef.transferTo(new File(file1));
			//업로드한 파일을 지정한 파일에 저장하는 메소드
			
			file2 = "resources/uploadImage/"+imagef.getOriginalFilename();
			//DB에 저장할 값
		}
		vo.setImage(file2);
			
		if(service.insert(vo) > 0) {
			mv.addObject("message","상품 등록이 완료되었습니다.");
			mv.setViewName("home");
		}else {
			mv.addObject("message", "상품 등록이 실패하였습니다. 다시 시도해주세요!");
			mv.setViewName("product_Board/productRegist");
		}
		return mv;
	}
	
	//상품 디테일
	@RequestMapping(value = "/pddetail")
	public ModelAndView pddetail(ModelAndView mv, ProductVO vo, HttpServletRequest request, RedirectAttributes rttr) {
		//service.countUp(vo);
		vo = service.selectOne(vo);
		System.out.println("디테일VO"+vo);
		if(vo != null) {
			request.setAttribute("Product", vo);
			if("U".equals(request.getParameter("jcode"))) {
				//업데이트로 넘어가기
				System.out.println("11");
				mv.setViewName("product_Board/productUpdateF");
			}else {
				System.out.println("22");
				mv.setViewName("product_Board/productDetail");
			}
		}else {
			System.out.println("33");
			mv.addObject("message","해당 상품을 찾을 수 없습니다.");
			mv.setViewName("redirect:pdlist");
		}
		return mv;
	}
	
	//상품 수정
	@RequestMapping(value = "/pdupdate")
	public ModelAndView pdupdate(ModelAndView mv,ProductVO vo, RedirectAttributes rttr, HttpServletRequest request)throws IOException {
		
		String realPath = request.getRealPath("/");
		System.out.println("** real=>"+realPath);
		
		if(realPath.contains(".eclipse."))
			realPath = "/Users/h-h/Documents/project/Daily/src/main/webapp/resources/uploadImage/";
		else realPath += "resources/uploadImage/";
		//폴더 확인 
		File f1 = new File(realPath); //realPath에 있는 경로에 파일이 있는지 확인
			if(!f1.exists()) f1.mkdir(); // 만약 없다면 폴더를 생성
			String file1, file2 = "resources/uploadImage"+"/belt1.jpg"; 
			 //DB+파일경로 업로드 위한 기본 이미지값 지정
		MultipartFile imagef = vo.getImagef();
		if(imagef != null && !imagef.isEmpty()) {
			file1 = realPath + imagef.getOriginalFilename();
			//uploadfilef에 있는 모든 값중에[ex)aaa.gif]파일명만 추출 메소드
			imagef.transferTo(new File(file1));
			//업로드한 파일을 지정한 파일에 저장하는 메소드
			
			file2 = "resources/uploadImage/"+imagef.getOriginalFilename();
			//DB에 저장할 값
		}
		vo.setImage(file2);
		
		if(service.update(vo) > 0) {
	     //업데이트 성공
		 rttr.addFlashAttribute("message","상품 업데이트 성공!");
		 mv.setViewName("redirect:pdlist");
		}else {
		 //업데이트 실패
		 rttr.addFlashAttribute("message","상품 업데이트 실패. 확인 후 다시해주세요!");
		 mv.setViewName("redirect:pddetail?productnum="+vo.getProductnum()+"&jcode=U");
		}
		return mv;
	}
	
	//상품 삭제
	@RequestMapping(value = "/pddelete")
	public ModelAndView pddelete(ModelAndView mv,ProductVO vo, RedirectAttributes rttr) {
		if(service.delete(vo) > 0) {
			//삭제 성공
			rttr.addFlashAttribute("message","상품이 성공적으로 삭제 되었습니다.");
			mv.setViewName("redirect:pdlist");
		}else {
			//삭제 실패
			rttr.addFlashAttribute("message","상품 삭제가 실패 하였습니다.");
			mv.setViewName("redirect:pddetail?productnum="+vo.getProductnum());
		}
		return mv;
	}
	
	
}//class
