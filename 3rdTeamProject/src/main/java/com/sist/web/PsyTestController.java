package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PsyTestController {
  @RequestMapping("psyTest/main.do")
  public String psyTest_main(){
	  System.out.println("테스트창 출력");
	  return "psyTest/main";
  }
}
