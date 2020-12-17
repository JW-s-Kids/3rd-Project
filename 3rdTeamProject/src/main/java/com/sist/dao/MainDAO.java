package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.sist.mapper.MainMapper;

@Repository
public class MainDAO {
	

	@Autowired
	private MainMapper mapper;
	
	// 메인페이지 (여행지) ===============================================================================================
	public List<TourVO> getTourList(){
		return mapper.getTourList();
	}
	
	
	// 메인페이지 (반려동물 산책코스) ============================================================================================
	public List<DogVO> getParkList(){
		return mapper.getParkList();
	}
	
	
	// 메인페이지 (여행기) ============================================================================================
	public List<DiaryVO> getDiaryList(){
		return mapper.getDiaryList();
	}
	
	// 메인페이지 (맛집순례) ===========================================================================================
	public List<KFoodVO> getKFoodList(){
		return mapper.getKFoodList();
	}
	
	
}
