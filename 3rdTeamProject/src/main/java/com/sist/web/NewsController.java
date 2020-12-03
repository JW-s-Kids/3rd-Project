package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NewsController {

	@RequestMapping("news/list.do")
	public String news_list(){
		return "news/list";
	}
}
