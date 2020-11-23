package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.MeetingVO;
import com.sist.dao.*;
@Controller
public class MeetingController {
	@Autowired
	private MeetingDAO dao;
	@RequestMapping("meeting/list.do")
	public String meeting_list(String page,Model model){
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
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("list", list);
		return "meeting/list";
	}
}
