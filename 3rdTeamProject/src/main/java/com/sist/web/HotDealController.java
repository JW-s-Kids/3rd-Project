package com.sist.web;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		List<HotDealVO> cList=new ArrayList<HotDealVO>();
		Cookie[] cookies=request.getCookies();
		if(cookies!=null) {
			for(int i=cookies.length-1; i>=0; i--) {
				if(cookies[i].getName().startsWith("h")) {
					HotDealVO vo=dao.hotDealDetailData(Integer.parseInt(cookies[i].getValue()));
					cList.add(vo);
				}
			}
		}
		model.addAttribute("cList", cList);
		
		return "hotdeal/list";
		
	}
	
	// 쿠키
	@RequestMapping("hotdeal_before.do")
	public String hotdeal_before(int hd_no, HttpServletResponse response) {
		
		Cookie cookie=new Cookie("h"+hd_no, String.valueOf(hd_no));
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		return "redirect:detail.do?hd_no="+hd_no;
	}
	
	// 핫딜 상세보기
	@RequestMapping("detail.do")
	public String hotdeal_detail(int hd_no, Model model) {
		HotDealVO vo=dao.hotDealDetailData(hd_no);
		model.addAttribute("vo", vo);
		return "hotdeal/detail";
	}
	
}
