package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;


import com.sist.dao.KFoodVO;


public interface KFoodMapper {
//  @Select("SELECT no,title,poster,subject "
//		 +"FROM food_category")
//  public List<KFoodCategoryVO> kfoodCategoryAllData();

	/*
	 * KF_NO       NOT NULL NUMBER         
KF_POSTER   NOT NULL CLOB           
KF_TITLE    NOT NULL VARCHAR2(1000) 
KF_TEL      NOT NULL VARCHAR2(500)  
KF_ADDR1    NOT NULL VARCHAR2(500)  
KF_CONTENT  NOT NULL CLOB           
KF_PARK     NOT NULL VARCHAR2(80)   
KF_TIME     NOT NULL VARCHAR2(500)  
KF_HOLIDAY  NOT NULL VARCHAR2(150)  
KF_DELEMENU NOT NULL VARCHAR2(70)   
KF_TOGO     NOT NULL VARCHAR2(50)   
KF_RESERVE  NOT NULL VARCHAR2(50)   
KF_HIT      NOT NULL VARCHAR2(1000) 
KF_SCORE 

	 */
	
// _____________음식 리스트[목록] 출력________________
  @Select("SELECT kf_no, kf_poster, kf_title, kf_tel, kf_addr1, kf_content, kf_park, kf_time, kf_holiday, kf_delemenu, kf_togo, kf_reserve, kf_hit, kf_score, kf_zone num "
		 + "FROM (SELECT kf_no,kf_poster,kf_title,kf_tel,kf_addr1,kf_content,kf_park,kf_time,kf_holiday,kf_delemenu,kf_togo,kf_reserve,kf_hit,kf_score,kf_zone, rownum as num "
		 + "FROM (SELECT kf_no,kf_poster,kf_title,kf_tel,kf_addr1,kf_content,kf_park,kf_time,kf_holiday,kf_delemenu,kf_togo,kf_reserve,kf_hit,kf_score,kf_zone "
		 + "FROM kfood ORDER BY kf_no)) "
		 + "WHERE num BETWEEN #{start} AND #{end}" )
  public List<KFoodVO> kfoodList(Map map);

// _____________음식 총 페이지 가져오기________________
  @Select("SELECT CEIL(COUNT(*)) FROM kfood")
  public int kfoodTotalPage();
  
  
// ________________음식 디테일[상세] 출력________________
  @Select("SELECT * FROM kfood "
		 +"WHERE kf_no=#{kf_no}")
  public KFoodVO kfoodDetail(int kf_no);
 // @Update("UPDATE kfood SET hit = hit + 1 WHERE kf_no = #{kf_no}")
//	public void kfoodHit(int kf_no);
 
  
  

	
	
//________________관련 음식점 목록 출력________________
//@Select("SELECT kf_no,kf_title,kf_poster, rownum "
//+"FROM kfood "
//+"WHERE rownum<=3 AND "
//+"REGEXP_LIKE(kf_zone,#{finddata})")
//public List<KFoodVO> kfoodLikeKFoodData(String finddata);
  
}






