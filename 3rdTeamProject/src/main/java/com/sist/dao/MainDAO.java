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
}