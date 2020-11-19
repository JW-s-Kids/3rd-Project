package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiaryContoller {
	
	
	// 여행기 리스트 ==================================================================================================================================================
	@RequestMapping("diary/list.do")
	public String diary_list(){
		return "diary/list";
	}
	
	
	@RequestMapping("diary/detail.do")
	public String diary_detail(){
		return "diary/detail";
	}
}
