package com.daily.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Pageing.PageMaker;
import Pageing.Searchpage;
import service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
   
   @Autowired
   ProductService service; // 전역 변수 서비스
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
   public String home(Locale locale, Model model) {
	  Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
      
      String formattedDate = dateFormat.format(date);
      
      model.addAttribute("serverTime", formattedDate );
      
      return "home";
   }//home
   
   //매장위치
   @RequestMapping(value = "/kakaotest")
   public ModelAndView kakaotest(ModelAndView mv) {
      mv.setViewName("kakao/kakaoTest");
      return mv;
   } //kakaotest

   //고객센터 
   
   
   //keywordsearchlist 
      @RequestMapping(value="pkplist")
      public ModelAndView pkplist(ModelAndView mv ,Searchpage spage , PageMaker pageMaker) {
    	 mv.addObject("keyword",spage.getKeyword());
         spage.setSnoEno();
         System.out.println(spage);
         mv.addObject("spList",service.keywordsearchList(spage));
         
         pageMaker.setPage(spage);
         
         pageMaker.setTotalRowCount(service.searchRowsCount(spage));
      
         System.out.println("*** pageMaker =>"+ pageMaker);
         mv.addObject("pageMaker",pageMaker);
         mv.setViewName("product_Board/ppageSearchList");
         System.out.println("keyword = " +spage.getKeyword());
        
         return mv;
      }

}//class