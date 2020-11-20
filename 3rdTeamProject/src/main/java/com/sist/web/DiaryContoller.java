package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.DiaryDAO;
import com.sist.dao.DiaryVO;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class DiaryContoller {
	
	
	@Autowired
	private DiaryDAO dao;
	
	
	// 여행기 리스트 ==================================================================================================================================================
	@RequestMapping("diary/list.do")
	public String diary_list(Model model, String page, HttpSession session, HttpServletRequest request){
		try {
			if (page == null){
				page = "1";
			}
			int currpage = Integer.parseInt(page);						// 현재 페이지
			int totalpage = dao.diaryTotalPage();	// 총 페이지
			int rowSize = 8;											// 한번에 출력될 게시글
			int start = (rowSize*currpage) - (rowSize - 1);				
			int end = (rowSize*currpage);
			int block = 5;												// 페이지 블록
			int startpage=((currpage-1)/block*block)+1;					
			int endpage=((currpage-1)/block*block)+block;
			if(endpage>totalpage) {
				endpage=totalpage;
			}
			
			// 해쉬맵에 시작 / 끝 변수 담기 ------------------------------------------------------
			Map map = new HashMap();
			map.put("start", start);
			map.put("end", end);
			
			
			List<DiaryVO> list = dao.diaryList(map);			// DAO의 메소드 리턴값을 받는 List 변수
			
			// 쿠키 ---------------------------------------------------------------------------------------------------
//			session=request.getSession();
//			String id=(String)session.getAttribute("id");
//			// 쿠키 읽기
//			Cookie[] cookies=request.getCookies();							// 쿠키 배열 생성
//			List<DiaryVO> cList=new ArrayList<DiaryVO>();					// 쿠키를 담을 리스트 생성
//			if(cookies!=null)												// 쿠키가 비어있지 않으면
//			{
//				for(int i=cookies.length-1;i>=0;i--)						// (쿠키길이 - 1)부터 0까지 i를 1씩 감소 (그래야 최신 쿠키가 맨앞에 옴)
//				{
//					if(cookies[i].getName().startsWith(id))							// 쿠키배열의 이름이 id를 시작하면
//					{
//						String no=cookies[i].getValue();								// 변수 no에 쿠키값 넣기
//						DiaryVO vo=DiaryVO.jobknowledgeDetail(Integer.parseInt(no));		// vo에 상세보기를 담아서
//						cList.add(vo);													// 쿠키배열에 vo 담기
//					}
//				}
//			}
//			request.setAttribute("cList", cList);										// 쿠키값이 담긴 리스트를 전송
			
			// 페이지로 보낼 파라미터들 -----------------------------------------------------------
			model.addAttribute("list", list);
			model.addAttribute("block", block);
			model.addAttribute("currpage", currpage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("startpage", startpage);
			model.addAttribute("endpage", endpage);
			
			System.out.println("여행기 목록 컨트롤러");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "diary/list";
	}
	
	
	@RequestMapping("diary/detail.do")
	public String diary_detail(){
		return "diary/detail";
	}
}
