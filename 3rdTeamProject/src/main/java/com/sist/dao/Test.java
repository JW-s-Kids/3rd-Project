package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.stereotype.Component;

@Component
public class Test {

	@Autowired
	private static MongoTemplate mt;
	
	public static void main(String[] args) {
//		Main_totalsearchDAO dao = new Main_totalsearchDAO();
//		String fd = "몽";
//		
//		List<TourVO> list = dao.totalseacrh_tour(fd);
//		
//		for(TourVO vo : list){
//			System.out.println(vo.getTitle());
//		}
		
		String fd = "몽촌역사관";
		
		List<TourVO> list = new ArrayList<TourVO>();
		
//		BasicQuery query = new BasicQuery("{title:{$regex:'.*"+fd+"'}}");
		
		BasicQuery query = new BasicQuery("{title : 몽촌역사관 }");
		
		list = mt.find(query, TourVO.class, "tour");
		
		for(TourVO vo : list){
			System.out.println(vo.getTitle());
		}

	}

}
