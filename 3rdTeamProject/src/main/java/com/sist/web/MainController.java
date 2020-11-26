package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.MainDAO;
import com.sist.dao.TourVO;
import com.sist.mapper.MainMapper;
import java.util.*;

@Controller
public class MainController {
	
	@Autowired
	private MainDAO dao;
	
	@RequestMapping("main/main.do")
	public String main_main(Model model){
		
		List<TourVO> tour_list = dao.getTourList();
		
		model.addAttribute("tour_list", tour_list);
		
		return "main";
	}
	
	
	// 메인페이지 (여행지) ===============================================================================================
	public String main_tour(Model model){
		
		List<TourVO> tour_list = dao.getTourList();
		
		model.addAttribute("tour_list", tour_list);
		
		return "tour";
	}
}
