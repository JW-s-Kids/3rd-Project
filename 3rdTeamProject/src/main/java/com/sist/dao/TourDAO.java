package com.sist.dao;

import java.util.*;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;

@Repository
public class TourDAO {

	@Autowired
	private TourMapper mapper;
	
	
//////////////여행지 목록 출력 ////////////////
	public List<TourVO> tourList(Map map)
	{
		return mapper.tourList(map);
	}
////////////////여행지 총페이지 가져오기////////////////
	public int tourTotalPage()
	{
		return mapper.tourTotalPage();
	}
////////////////상세보기////////////////
	public TourVO tourDetail(int no)
	{
		return mapper.tourDetail(no);
	}
		
	
}
	