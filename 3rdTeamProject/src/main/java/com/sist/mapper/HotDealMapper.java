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
	
	// 핫딜 상세보기
	@Select("SELECT hd_no, hd_name, hd_addr2, hd_contents, hd_roomname, hd_price, hd_service, "
			+"hd_normal, hd_activity, hd_internet, hd_checkin, hd_checkout, hd_img1, hd_img2, hd_img3 "
			+"FROM hotdeal WHERE hd_no=#{hd_no}")
	public HotDealVO hotDealDetailData(int hd_no);
}
