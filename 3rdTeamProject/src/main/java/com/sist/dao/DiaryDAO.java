package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import java.util.*;

@Repository
public class DiaryDAO {
	
	@Autowired
	private DiaryMapper mapper;
	
	
	// 여행기 목록 출력 ==============================================================================================================
	public List<DiaryVO> diaryList(Map map){
		return mapper.diaryList(map);
	}
	
	// 여행기 총페이지 가져오기 ==============================================================================================================
	public int diaryTotalPage(){
		return mapper.diaryTotalPage();
	}
}
