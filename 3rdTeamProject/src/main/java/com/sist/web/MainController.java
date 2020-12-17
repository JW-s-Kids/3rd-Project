package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.*;
import com.sist.mapper.MainMapper;
import java.util.*;

@Controller
public class MainController {
	
	@Autowired
	private MainDAO dao;
	
	@RequestMapping("main/main.do")
	public String main_main(Model model){
		
		
		main_tour(model);
		main_diary(model);
		main_park(model);
		main_Kfood(model);
		
		return "main";
	}
	
	
	// 메인페이지 (여행지) ===============================================================================================
//	public String main_tour(Model model){
//		
//		List<TourVO> tour_list = dao.getTourList();
//		
//		model.addAttribute("tour_list", tour_list);
//		
//		return "tour";
//	}
	
	
	
	// 메인페이지 (여행지) ===============================================================================================
	public void main_tour(Model model){
		
		List<TourVO> tour_list = dao.getTourList();
		
		model.addAttribute("tour_list", tour_list);
	}
	// 메인페이지 (반려동물 산책코스) ===============================================================================================
	public void main_park(Model model){
		
		List<DogVO> park_list = dao.getParkList();
		
		model.addAttribute("park_list", park_list);
	}
	// 메인페이지 (여행기) ===============================================================================================
	public void main_diary(Model model){
		
		List<DiaryVO> diary_list = dao.getDiaryList();
		
		model.addAttribute("diary_list", diary_list);
	}
	// 메인페이지 (맛집순례) ================================================================================================
	public void main_Kfood(Model model){
		List<KFoodVO> kfood_list = dao.getKFoodList();
		
		model.addAttribute("kfood_list", kfood_list);
	}
	
	
	
	
	
	// 통합 검색 페이지만 출력 ===========================================================================================================
	@RequestMapping("main/totalsearch.do")
	public String main_totalsearch(){
		return "main/totalsearch";
	}
	
	
	
	
}
