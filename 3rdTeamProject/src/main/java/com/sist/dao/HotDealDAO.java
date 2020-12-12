package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.HotDealMapper;

@Repository
public class HotDealDAO {

	@Autowired
	private HotDealMapper mapper;
	
	// 핫딜 목록
	public List<HotDealVO> hotDealListData(Map map) {
		return mapper.hotDealListData(map);
	}
	
	// 핫딜 총페이지
	public int hotDealTotalPage() {
		return mapper.hotDealTotalPage();
	}
	
	// 핫딜 상세보기
	public HotDealVO hotDealDetailData(int hd_no) {
		return mapper.hotDealDetailData(hd_no);
	}

}
