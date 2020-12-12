package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.HotDealDAO;
import com.sist.dao.HotDealVO;

@Controller
@RequestMapping("hotdeal/")
public class HotDealController {
	
	@Autowired
	private HotDealDAO dao;
	
	// 핫딜 목록
	@RequestMapping("list.do")
	public String hotdeal_list(String page, Model model, HttpServletRequest request) {
		
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		int totalpage=dao.hotDealTotalPage();
		Map map=new HashMap();
		
		int rowSize=6;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		int block=5;
		int startpage=((curpage-1)/block*block)+1;
		int endpage=((curpage-1)/block*block)+block;
		
		if(endpage>totalpage) 
			endpage=totalpage;
		
		map.put("start", start);
		map.put("end", end);
		List<HotDealVO> list=dao.hotDealListData(map);
		
		model.addAttribute("list", list);
		model.addAttribute("block", block);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("curpage", curpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		return "hotdeal/list";
		
	}
	
	// 핫딜 상세보기
	@RequestMapping("detail.do")
	public String hotdeal_detail(int hd_no, Model model) {
		HotDealVO vo=dao.hotDealDetailData(hd_no);
		model.addAttribute("vo", vo);
		return "hotdeal/detail";
	}
	
}
