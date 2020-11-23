package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.*;

@Controller
public class TourController {
	
	@Autowired
	private TourDAO dao;
	
	 @RequestMapping("tour/list.do")
	  public String tour_list(Model model, String page, HttpSession session, HttpServletRequest request){
		  
		 	try {
					if (page == null)
					{
						page = "1";
					}
						int currpage = Integer.parseInt(page);			// 현재 페이지
						int totalpage = dao.tourTotalPage();			// 총 페이지
						int rowSize = 6;											
						int start = (rowSize*currpage) - (rowSize - 1);				
						int end = (rowSize*currpage);
						int block = 5;									// 페이지 블록
						int startpage=((currpage-1)/block*block)+1;					
						int endpage=((currpage-1)/block*block)+block;
						if(endpage>totalpage) {
							endpage=totalpage;
					}
				
			
				Map map = new HashMap();
				map.put("start", start);
				map.put("end", end);
				
				
				List<TourVO> list = dao.tourList(map);			
				
				model.addAttribute("list", list);
				model.addAttribute("block", block);
				model.addAttribute("currpage", currpage);
				model.addAttribute("totalpage", totalpage);
				model.addAttribute("startpage", startpage);
				model.addAttribute("endpage", endpage);
				
				}
		 		catch (Exception e) 
		 		 {
					e.printStackTrace();
				 }
			
		  return "tour/list";
	  }
	 
////////////////상세보기////////////////
		@RequestMapping("tour/detail.do")
		public String tour_detail(Model model, String no){
			
			try {
					TourVO tour_vo = dao.tourDetail(Integer.parseInt(no)); 
					model.addAttribute("tour_vo", tour_vo);
				}catch (Exception e) 
				{
					System.out.println(e.getMessage());
				}
			return "tour/detail";
		}
}
