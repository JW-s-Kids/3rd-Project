package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

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
  @Select("SELECT kf_no,kf_poster,kf_title,kf_addr1,kf_content,kf_hit,kf_score, "
		 +"FROM food_list "
		 +"WHERE kf_no=#{kf_no}")
  public List<KFoodVO> kfoodAllData();
  
//  @Select("SELECT title,subject "
//		 +"FROM food_category "
//		 +"WHERE no=#{no}")
//  public KFoodVO kfoodCategoryInfoData(int kf_no);
 
 //_______________음식 디테일[상세] 출력__________________________
  @Select("SELECT * FROM kfood "
		 +"WHERE kf_no=#{kf_no}")
  public KFoodVO kfoodListData(int kf_no);
  
//  @Select("SELECT title,poster,chef,rownum "
//		 +"FROM recipe "
//		 +"WHERE rownum<=5 AND "
//		 +"REGEXP_LIKE(title,#{finddata})")// 국수 / 면   => 국수|면
//  public List<RecipeVO> foodLikeRecipeData(String finddata);
  
  @Select("SELECT no,poster,title,rownum "
		 +"FROM food_detail "
		 +"WHERE rownum<=12 AND "
		 +"addr LIKE '%'||#{gu}||'%'")
  public List<KFoodVO> kfoodLocationFindData(String gu);
  
  @Select("SELECT no,title,poster,rownum "
		 +"FROM (SELECT no,title,poster "
		 +"FROM food_detail ORDER BY good DESC) "
		 +"WHERE rownum<=5")
  public List<KFoodVO> kfoodTop10();
  
//  @Select("SELECT no,title,poster,rownum "
//		 +"FROM recipe "
//		 +"WHERE rownum<=5")
  
 // public List<RecipeVO> recipeTop10();
  
}






