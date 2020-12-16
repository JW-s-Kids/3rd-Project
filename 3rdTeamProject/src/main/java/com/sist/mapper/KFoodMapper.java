package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.dao.Diary_replyVO;
import com.sist.dao.KFoodVO;
import com.sist.dao.KFood_replyVO;


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
	
// _____________음식점 목록 출력________________
  @Select("SELECT kf_no, kf_poster, kf_title, kf_tel, kf_addr1, kf_content, kf_park, kf_time, kf_holiday, kf_delemenu, kf_togo, kf_reserve, kf_hit, kf_score, kf_zone, num "
			 + "FROM (SELECT kf_no, kf_poster, kf_title, kf_tel, kf_addr1, kf_content, kf_park, kf_time, kf_holiday, kf_delemenu, kf_togo, kf_reserve, kf_hit, kf_score, kf_zone, rownum as num "
			 + "FROM (SELECT kf_no, kf_poster, kf_title, kf_tel, kf_addr1, kf_content, kf_park, kf_time, kf_holiday, kf_delemenu, kf_togo, kf_reserve, kf_hit, kf_score, kf_zone "
			 + "FROM kfood ORDER BY kf_no)) "
			 + "WHERE num BETWEEN #{start} AND #{end}")
  public List<KFoodVO> kfoodList(Map map);

// _____________음식점 총 페이지 가져오기________________
  @Select("SELECT CEIL(COUNT(*)) FROM kfood")
  public int kfoodTotalPage();
  
  
// ________________음식점 상세보기________________
  @Select("SELECT * FROM kfood "
		 +"WHERE kf_no=#{kf_no}")
  public KFoodVO kfoodDetail(int kf_no);
 // @Update("UPDATE kfood SET hit = hit + 1 WHERE kf_no = #{kf_no}")
//	public void kfoodHit(int kf_no);
  
  @Select("SELECT * FROM kfood WHERE kf_zone = #{kf_zone}")
  public List<KFoodVO> kfoodzonetag(String kf_zone);
 
  
  

	
	
//________________愿��젴 �쓬�떇�젏 紐⑸줉 異쒕젰________________
//@Select("SELECT kf_no,kf_title,kf_poster, rownum "
//+"FROM kfood "
//+"WHERE rownum<=3 AND "
//+"REGEXP_LIKE(kf_zone,#{finddata})")
//public List<KFoodVO> kfoodLikeKFoodData(String finddata);
  
  
  
  	//________________댓글쓰기________________ 
  	@SelectKey(keyProperty="no", resultType=int.class, before=true,
			statement="SELECT NVL(MAX(no)+1, 1) as no FROM kfood_reply")
	@Insert("INSERT INTO kfood_reply(no, kfood_no, id, content, gi) VALUES(#{no}, #{kfood_no}, #{id}, #{content}, (SELECT NVL(MAX(gi)+1,1) FROM kfood_reply))")
	public void kfood_insertReply(KFood_replyVO vo);

  	
  	//________________댓글쓰면 게시글 댓글수 증가________________
	//@Update("UPDATE kfood SET reply = reply + 1 WHERE no = #{no}")
	//public void kfood_replyIncrement(int no);  
 

	// ________dao 에서 댓글가저오기________댓글목록 출력________________
	@Select("SELECT no, kfood_no, id, content, regdate, gt FROM kfood_reply WHERE kfood_no=#{kfood_no} ORDER BY gi DESC , gs ASC")
	public List<KFood_replyVO> kfood_listReply(int kfood_no);
			
	// 부모댓글 정보 가져오기 =========================================================================================================================================
	@Select("SELECT gi, gs, gt FROM kfood_reply WHERE no = #{no}")
	public KFood_replyVO kfood_replyParentData(int no);
		
		
		
	// 댓글순서 증가 ==========================================================================================================================================
	@Update("UPDATE kfood_reply SET gs = gs + 1 WHERE gi = #{gi} AND gs > #{gs}")
	public void kfood_replyStepIncrement(KFood_replyVO vo);
		
		
	// 대댓글 달기 ===========================================================================================================================================
	@SelectKey(keyProperty="no", resultType=int.class, before=true,
		statement="SELECT NVL(MAX(no)+1, 1) as no FROM kfood_reply")
	@Insert("INSERT INTO kfood_reply(no, kfood_no, id, content, gi, gs, gt, root, depth) VALUES(#{no}, #{kfood_no}, #{id}, #{content}, #{gi}, #{gs}, #{gt}, ${root}, 0)")
	public void kfood_replyReplyInsert(KFood_replyVO vo);
		
	// 부모댓글 depth 증가 ======================================================================================================================================
	@Update("UPDATE kfood_reply SET depth = depth + 1 WHERE no=#{no}")
	public void kfood_replyDepthIncrement(int no);
		
		
	// 댓글 수정 ========================================================================================================================================
	@Update("UPDATE kfood_reply SET content = #{content} WHERE no = #{no}")
	public void kfood_updateReply(KFood_replyVO vo);
		
		

	// 댓글 삭제시 부모댓글 정보 가져오기  ========================================================================================================================================
	@Select("SELECT depth, root FROM kfood_reply WHERE no = #{no}")
	public KFood_replyVO kfood_InfoData(int no);
		
		
	// 댓글 삭제 ========================================================================================================================================
	@Delete("DELETE FROM kfood_reply WHERE no = #{no}")
	public void kfood_deleteReply(int no);
		
		
	// 댓글 삭제시 관리자 메시지 삽입 ========================================================================================================================================
	@Update("UPDATE kfood_reply SET content = '관리자가 삭제한 댓글입니다' WHERE no = #{no}")
	public void kfood_adminMessage(int no);
		
		
	// 부모댓글의 depth 감소 ========================================================================================================================================
	@Update("UPDATE kfood_reply SET depth = depth - 1 WHERE no = #{no}")
	public void kfood_depthDecrement(int no);
		
	
	
}






