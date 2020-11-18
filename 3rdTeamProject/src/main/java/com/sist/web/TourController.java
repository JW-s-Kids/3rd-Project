package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TourController {
	 @RequestMapping("tour/list.do")
	  public String tour_list(){
		  
		  return "tour/list";
	  }
	
}
