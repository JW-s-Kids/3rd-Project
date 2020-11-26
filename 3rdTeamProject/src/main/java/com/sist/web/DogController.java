package com.sist.web;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.*;

@Controller
public class DogController {
	@Autowired
	private DogDAO dao;
	
	// 메인 ////////////////////////////////////////////////////////
	
	@RequestMapping("dog/parkmain.do")
	public String park_main(String page, Model model){
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=9;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		int totalpage=dao.dogTotalPage();
		map.put("start", start);
		map.put("end", end);
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		List<DogVO> list=dao.dogListData(map);
		for(DogVO vo:list){
            String s=vo.getContent();
            if(s.length()>100){
                s=s.substring(0,100)+"..";
                vo.setContent(s);
            }
        }
		for(DogVO vo:list){
            String s=vo.getName();
            if(s.length()>8){
                s=s.substring(0,8)+"..";
                vo.setName(s);
            }
        }
		model.addAttribute("list",list);
		model.addAttribute("curpage",curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("BLOCK", BLOCK);
		return "dog/parkmain";
	}
	
	@RequestMapping("dog/parkdetail.do")
	public String park_detail(String no, Model model){
		DogVO vo=dao.dogDetailData(Integer.parseInt(no));
		model.addAttribute("vo", vo);
		return "dog/parkdetail";
	}
	
	
	// 게시판1 /////////////////////////////////////////////////////
	
	@RequestMapping("dogboard/list.do")
	public String dog_board_list(String page, Model model) {
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
		int totalpage=dao.boardTotalPage();
		map.put("start", start);
		map.put("end", end);
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		List<DogBoardVO> list=dao.boardListData(map);
		model.addAttribute("list",list);
		model.addAttribute("curpage",curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("BLOCK", BLOCK);
		return "dogboard/list";
	}
	
	@GetMapping("dogboard/insert.do")
	public String dog_board_insert() {
		return "dogboard/insert";
	}
	
	@PostMapping("dogboard/insert_ok.do")
	public String dog_board_insert_ok(@ModelAttribute("vo") DogBoardVO vo) {
		dao.boardInsert(vo);
		return "redirect:list.do";
	}
	
	@GetMapping("dogboard/detail.do")
	public String dog_board_detail(String no, Model model) {
		DogBoardVO vo=dao.boardDetailData(Integer.parseInt(no));
		model.addAttribute("vo", vo);
		return "dogboard/detail";
	}
	
	
	// 익명게시판 /////////////////////////////////////////////////////
	
	@RequestMapping("dogboard/anonymous.do")
	public String dog_anonyboard_list(String page, Model model) {
		if(page==null)
			page="1";
		Map map=new HashMap();
		int curpage=Integer.parseInt(page);
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		int totalpage=dao.anonyTotalPage();
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		map.put("start", start);
		map.put("end", end);
		List<DogAnonymousVO> list=dao.anonyListData(map);
		model.addAttribute("list",list);
		model.addAttribute("curpage",curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("BLOCK", BLOCK);
		return "dogboard/anonymous";
	}
		
	@PostMapping("dogboard/ano_insert_ok.do")
	public String dog_board_insert_ok(@ModelAttribute("vo") DogAnonymousVO vo) {
		dao.anonyInsert(vo);
		return "redirect:anonymous.do#yong";
	}
		
}
