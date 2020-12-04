package com.sist.dao;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class Main_totalsearchDAO {

	@Autowired
	private MongoTemplate mt;
	
	
	
	// 투어 검색 ======================================================================================================
	public List<TourVO> totalseacrh_tour(String fd){
		List<TourVO> list = new ArrayList<TourVO>();
		
		try {
			
//			Query query = new Query();								// query에 조건 설정
//			int rowSize = 10;
//			int skip = (page * rowSize) - rowSize;
//			query.skip(skip).limit(rowSize);
//			query.with(new Sort(Sort.Direction.ASC, "no"));
			
//			BasicQuery query = new BasicQuery("{title:{$regex:'.*"+fd+"'}}");
//			query.addCriteria(Criteria.where("title").regex(".*"+fd+".*"));
//			query.addCriteria(Criteria.where("title").regex(fd));
			
//			list = mt.find(query, TourVO.class, "tour");
			
			
			BasicQuery query = new BasicQuery("{title:{$regex:'.*"+fd+"'}}");				
			
			list = mt.find(query, TourVO.class, "tour");
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		

		
		return list;
		
		
	}
	
	
}
