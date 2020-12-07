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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpServerErrorException;
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
		
	System.out.println("detail_before 호출 ");
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
	public String meeting_insert_ok(String mname,String maddr,String maddr2,String minwon,String mmsg) {
		System.out.println("insert_ok 실행");
		MeetingVO vo=new MeetingVO();
		try{
			vo.setMname(mname);
			System.out.println("mname:"+mname);
			
			vo.setMaddr(maddr);
			System.out.println("maddr:"+maddr);
			
			vo.setMaddr2(maddr2);
			System.out.println("maddr2:"+maddr2);
			
			vo.setMinwon(Integer.parseInt(minwon));
			System.out.println("minwon:"+minwon);
			
			vo.setMmsg(mmsg);
			System.out.println("mmsg:"+mmsg);
			
			dao.meetingInsert(vo);
			System.out.println("insert_ok 실행완료");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		

		return "redirect:../meeting/list.do";
	}
	
	//모임 수정
	//수정내용 가져오기
	@RequestMapping("update.do")
	public String meetingUpdate(String mno,Model model) {
		MeetingVO vo=dao.meetingDetailData(Integer.parseInt(mno));
		model.addAttribute("vo", vo);
		return "meeting/update";
	}
	//수정하기
	@RequestMapping("update_ok.do")
	public String meetingUpdate_ok(String mno,String mname,String maddr,String maddr2,String minwon,String mmsg) {
		Map map=new HashMap();
		map.put("mno", mno);
		map.put("mname", mname);
		map.put("maddr", maddr);
		map.put("maddr2", maddr2);
		map.put("minwon", minwon);
		map.put("mmsg", mmsg);
		
		dao.meetingUpdate(map);
		return "redirect:../meeting/detail.do?mno="+mno;
	}
	
	//모임 삭제
	@RequestMapping("delete.do")
	public String meetingDelete(String mno) {
		dao.meetingDelete(Integer.parseInt(mno));
		return "redirect:../meeting/list.do";
	}
	
	//모임 검색
	@RequestMapping("find.do")
	public String meeting_find(String page,String fmname,Model model,HttpServletRequest request){
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);		
		int rowSize=6;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		
		System.out.println("fmname:"+fmname);
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("fmname", fmname);
		System.out.println("put 성공");


		int totalpage=dao.meetingFindTotalPage();
		System.out.println("검색총페이지");
		
		List<MeetingVO> fList=dao.meetingFindListData(map);

		model.addAttribute("fList", fList);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		
		System.out.println("검색완료");
		
		return "meeting/list";
	}
	
	
	
	
	
	
	
	
}
