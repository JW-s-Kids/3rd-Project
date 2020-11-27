package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.PetDAO;
import com.sist.dao.PetVO;


	
	/*
	 @RequestMapping("pet/list.do")
	  public String pet_list(Model model, String page, HttpSession session, HttpServletRequest request){
		  
		 	try {
					if (page == null)
					{
						page = "1";
					}
						int currpage = Integer.parseInt(page);			
						int totalpage = dao.petTotalPage();			
						int rowSize = 8;											
						int start = (rowSize*currpage) - (rowSize - 1);				
						int end = (rowSize*currpage);
						int block = 5;									
						int startpage=((currpage-1)/block*block)+1;					
						int endpage=((currpage-1)/block*block)+block;
						if(endpage>totalpage) {
							endpage=totalpage;
					}
				
				Map map = new HashMap();
				map.put("start", start);
				map.put("end", end);
				
				List<PetVO> list = dao.petListData(map);			
				
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
		  return "pet/list";
	  }
	 
	 // 반려동물 자랑하기 detail
	 @RequestMapping("pet/detail.do")
	 public String pet_detail(Model model, String no){
			
			try {
					PetVO pet_vo = dao.petDetailData(Integer.parseInt(no)); 
					model.addAttribute("pet_vo", pet_vo);
				}catch (Exception e) 
				{
					System.out.println(e.getMessage());
				}
			return "pet/detail";
		}

	// 반려동물 자랑하기 insert
	 @RequestMapping("pet/insert.do")
	 public String pet_insert(){
			return "pet/insert";
		}
	
	 @RequestMapping("pet/insert_ok.do")
	public String pet_insert_ok(@ModelAttribute("vo") PetVO vo) {
		dao.petInsert(vo);
		return "redirect:list.do";
	}*/
@Controller
public class PetController {
	@Autowired
	private PetDAO dao;
	// 반려동물 자랑하기 List
	
	@RequestMapping("pet/list.do")
	public String pet_list(String page, Model model) {
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=8;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		int totalpage=dao.petTotalPage();
		map.put("start", start);
		map.put("end", end);
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		List<PetVO> list=dao.petListData(map);
		model.addAttribute("list",list);
		model.addAttribute("curpage",curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("BLOCK", BLOCK);
		return "pet/list";
	}
	
	@GetMapping("pet/insert.do")
	public String pet_insert() {
		return "pet/insert";
	}
	
	@PostMapping("pet/insert_ok.do")
	public String pet_insert_ok(@ModelAttribute("vo")PetVO vo) {
		dao.petInsert(vo);
		return "redirect:list.do";
	}
	
	@GetMapping("pet/detail.do")
	public String pet_detail(String no, Model model) {
		PetVO vo=dao.petDetailData(Integer.parseInt(no));
		model.addAttribute("vo", vo);
		return "pet/detail";
	}
	
	
}