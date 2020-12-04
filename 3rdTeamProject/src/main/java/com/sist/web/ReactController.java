package com.sist.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.TourVO;
import com.sist.news.Item;
import com.sist.news.NewsManager;

@RestController
@CrossOrigin(origins="http://localhost:3000")	
public class ReactController {
	
	@Autowired
	private NewsManager mgr;
	
	
	// 리액트로 뉴스 페이지 전송 ====================================================================
	@RequestMapping(value="react_news/list.do", produces="text/plain;charset=UTF-8")
	public String news_list(String fd, String page){
		
		String json = "";
		
		if(fd == null){
			fd = "서울 여행지";
		}
		List<Item> list = mgr.newsAllData(fd);
		
		for(Item i : list){
			i.setDay(new SimpleDateFormat("yyyy-MM-dd").format(new Date(i.getPubDate())));	 		// PubDate를 변환해서 day에 담기 new Date(i.getPubDate())
		}
		
		
		
		/*
		 * private String title;
			private String link;
			private String description;
			private String pubDate;
			private String author;
			private String day;
		 */
		try{
			JSONArray arr = new JSONArray();
			for(Item vo : list){
				JSONObject obj = new JSONObject();
				obj.put("title", vo.getTitle());
				obj.put("link", vo.getLink());
				obj.put("description", vo.getDescription());
				obj.put("pubDate", vo.getPubDate());
				obj.put("author", vo.getAuthor());
				obj.put("day", vo.getDay());
				arr.add(obj);
				System.out.println(vo.getTitle());
			}
			json = arr.toJSONString();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
//		model.addAttribute("list", list);
		
		return json;
	}
	
	
	
	

}
