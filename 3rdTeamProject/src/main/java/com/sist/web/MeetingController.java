package com.sist.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.*;
@Controller
@RequestMapping("meeting/")
public class MeetingController {
	@Autowired
	private MeetingDAO dao;
	
	
	//모임 리스트
	@RequestMapping("list.do")
	public String meeting_list(String page,Model model,HttpServletRequest request){
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		// 현재 페이지 데이터값을 읽어 온다
		Map map=new HashMap();
		int rowSize=6;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		map.put("start", start);
		map.put("end", end);
		List<MeetingVO> list=dao.meetingListData(map);
		// 총페이지 
		int totalpage=dao.meetingTotalPage();
		
		//쿠키
		List<MeetingVO> cList=new ArrayList<MeetingVO>();
		Cookie[] cookies=request.getCookies();
		if(cookies!=null){
			for(int i=cookies.length-1;i>=0;i--){//최신 쿠키부터 출력
				if(cookies[i].getName().startsWith("m")){ //다른쿠키도 저장되어 있기 때문에 m으로 저장된 쿠키만 가져온다
					MeetingVO vo=dao.meetingDetailData(Integer.parseInt(cookies[i].getValue()));
					cList.add(vo);
				}
			}
		}
		System.out.println("사이즈"+cList.size());
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("list", list);
		model.addAttribute("cList", cList);
		
		return "meeting/list";
	}
	
	@RequestMapping("detail_before.do")
	public String meeting_detail_before(int mno,HttpServletResponse response){
		
	System.out.println("detail_befor 호출 ");
	Cookie cookie=new Cookie("m"+mno, String.valueOf(mno));//쿠키생성,다른 쿠키와 구별하기 위해 m으로 저장
	cookie.setMaxAge(60*60*24);//쿠키기간 설정
	response.addCookie(cookie);//클라이언트에 쿠키 저장
	
	return "redirect:detail.do?mno="+mno;
}
	
	//모임 상세보기
	@RequestMapping("detail.do")
	public String meeting_detail(int mno,Model model) {
		MeetingVO vo=dao.meetingDetailData(mno);
		model.addAttribute("vo", vo);
		return "meeting/detail";
	}
	
	//모임추가
	@RequestMapping("insert.do")
	public String meeting_insert() {
		return "meeting/insert";
	}
	@RequestMapping("insert_ok.do")
	public String meeting_insert_ok(MeetingVO vo) {
		dao.meetingInsert(vo);
		return "redirect:../meeting/list.do";
	}
	
	
	
	
	
	
	
	
	
	
}
