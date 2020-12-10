package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.dao.HotDealVO;

public interface HotDealMapper {

	// 핫딜 목록
	@Select("SELECT hd_no, hd_name, hd_addr1, hd_score, hd_price, hd_img1, num "
			+"FROM (SELECT hd_no, hd_name, hd_addr1, hd_score, hd_price, hd_img1, rownum as num "
			+"FROM (SELECT hd_no, hd_name, hd_addr1, hd_score, hd_price, hd_img1 "
			+"FROM hotdeal)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<HotDealVO> hotDealListData(Map map);
	
	// 핫딜 총페이지
	@Select("SELECT CEIL(COUNT(*)/6.0) FROM hotdeal")
	public int hotDealTotalPage();
}
