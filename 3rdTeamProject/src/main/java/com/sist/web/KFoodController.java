package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.service.NaverManager;

@Controller
public class KFoodController {
   @Autowired
   private KFoodDAO kfdao;

   @Autowired
   private NaverManager nm;
//   @Autowired
 //  private RManager rm;
//________________음식점 리스트 ___________________
   @RequestMapping("kfood/list.do")
   public String kfood_list(Model model, String page, HttpSession session, HttpServletRequest request){
			try {
				if (page == null){
					page = "1";
				}
				int currpage = Integer.parseInt(page);					
				int totalpage = kfdao.kfoodTotalPage();	//dao 
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
				
//	______________________________음식점 리스트 목록 잘라 오기 _______________________________
				List<KFoodVO> list = kfdao.kfoodList(map);	
				for(KFoodVO vo:list){
					String s=vo.getKf_content();
					if(s.length()>20){
						s=s.substring(0,20)+"..";
						vo.setKf_content(s);
					}
				}
				// 쿠키 ---------------------------------------------------------------------------------------------------
			
			//	session=request.getSession();
			//	String id=(String)session.getAttribute("id");
				// 쿠키 읽기
				Cookie[] cookies=request.getCookies();							// 쿠키 배열 생성
				List<KFoodVO> cList=new ArrayList<KFoodVO>();					// 쿠키를 담을 리스트 생성
				if(cookies!=null)												// 쿠키가 비어있지 않으면
				{
					for(int i=cookies.length-1;i>=0;i--)						// (쿠키길이 - 1)부터 0까지 i를 1씩 감소 (그래야 최신 쿠키가 맨앞에 옴)
					{
						if(cookies[i].getName().startsWith("m"))							// 쿠키배열의 이름이 id를 시작하면
						{
						//	String no=cookies[i].getValue();								// 변수 no에 쿠키값 넣기
						//	KFoodVO vo = kfdao.kfoodDetail(Integer.parseInt(cookie_no));
							KFoodVO vo=kfdao.kfoodDetail(Integer.parseInt(cookies[i].getValue()));		// vo에 상세보기를 담아서
							cList.add(vo);													// 쿠키배열에 vo 담기
						}
					}
				}
				request.setAttribute("cList", cList);
				
				
				
				
				
				
				model.addAttribute("list", list);
				model.addAttribute("block", block);
				model.addAttribute("currpage", currpage);
				model.addAttribute("totalpage", totalpage);
				model.addAttribute("startpage", startpage);
				model.addAttribute("endpage", endpage);
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			return "kfood/list";
		}


// 상세보기 전에 쿠키 생성하기
/*	@RequestMapping("kfood/detail_before.do")
	public String kfood_detail_before(HttpServletRequest request, HttpServletResponse response) {
			String no = "";
		try {
		//	System.out.println("쿠키생성 모델");
			
			// 글번호 no와 세션의 id 가져오기-----------------------------
			
			no = request.getParameter("no");
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			
			// 쿠키 생성 ----------------------------------------------
			Cookie cookie = new Cookie(id+"kfood" + no, no);				// 쿠키의 키는 (세션아이디 + 글번호)  값은 글번호
			cookie.setMaxAge(60);
			cookie.setPath("/");
			response.addCookie(cookie);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:../kfood/detail.do?no=" + no;		// 글번호에 해당하는 detail.do로 리다이렉트
	}*/
   
//________________음식 상세보기 ___________________________________________
	@RequestMapping("kfood/detail.do")
	public String kfood_detail(Model model, String no,HttpSession session, HttpServletRequest request){
		try {
//			request.setCharacterEncoding("utf-8");
//			System.out.println("게시글 상세페이지");
			
			KFoodVO kfood_vo = kfdao.kfoodDetail(Integer.parseInt(no));				// DAO의 상세보기 메소드 리턴값을 vo에 담기 
			
//			kfdao.kfoodHit(Integer.parseInt(no));
			
//			List<KFood_replyVO> reply_list = kfdao.kfood_listReply(Integer.parseInt(no));
			
//			List<JobKnowledgeVO> list = JobKnowledgeDAO.jobknowledgeDetailReply(Integer.parseInt(no));	// list에 답변글들을 담기
			
			if(session.getAttribute("i") != null){
				
			
				// 스크랩 버튼 활성화 여부  X -------------------------------------
			//	session=request.getSession();
			//	String id=(String)session.getAttribute("id");
			//	KFood_scrapVO svo=new KFood_scrapVO();
			//	svo.setId(id);
			//	svo.setMno(Integer.parseInt(no));
			//	int count=dao.scrapCount(svo);
				
			//	model.addAttribute("count", count);
				
				
				// 쿠키 ---------------------------------------------------------------------------------------------------
				session=request.getSession();
	//			String id=(String)session.getAttribute("id");
				// 쿠키 읽기
				Cookie[] cookies=request.getCookies();							// 쿠키 배열 생성
				List<KFoodVO> cookie_list=new ArrayList<KFoodVO>();					// 쿠키를 담을 리스트 생성
				if(cookies!=null)												// 쿠키가 비어있지 않으면
				{
					for(int i=cookies.length-1;i>=0;i--)						// (쿠키길이 - 1)부터 0까지 i를 1씩 감소 (그래야 최신 쿠키가 맨앞에 옴)
					{
						if(cookies[i].getName().startsWith(i + "kfood"))							// 쿠키배열의 이름이 id를 시작하면
						{
							String cookie_no=cookies[i].getValue();								// 변수 no에 쿠키값 넣기
							KFoodVO vo = kfdao.kfoodDetail(Integer.parseInt(cookie_no));		// vo에 상세보기를 담아서
							cookie_list.add(vo);													// 쿠키배열에 vo 담기
						}
					}
				}
				model.addAttribute("cookie_list", cookie_list);										// 쿠키값이 담긴 리스트를 전송
			}
			
			
			// 워드클라우드 -----------------------------------------------------------------------------------------
//			nm.naverData(kfood_vo.getKf_content());
			
//			rm_kfood.graph(Integer.parseInt(no));
			
			
			
			
			
			model.addAttribute("kfood_vo", kfood_vo);
//			model.addAttribute("reply_list", reply_list);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "kfood/detail";
	}

	

}




