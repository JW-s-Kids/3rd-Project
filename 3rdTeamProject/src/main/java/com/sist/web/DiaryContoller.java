package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiaryContoller {
	
	@RequestMapping("diary/list.do")
	public String diary_list(){
		return "diary/list";
	}
}
