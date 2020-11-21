package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.dao.DiaryVO;

import lombok.Delegate;

public interface DiaryMapper {

	// 여행기 목록 출력 ==================================================================================================================================
	@Select("SELECT no, id, subject, content, photo, regdate, hit, reply, tag, good, addr,visitdate, num "
			+ "FROM (SELECT no, id, subject, content, photo, regdate, hit, reply, tag, good, addr,visitdate, rownum as num "
			+ "FROM (SELECT no, id, subject, content, photo, regdate, hit, reply, tag, good, addr,visitdate "
			+ "FROM diary ORDER BY no)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<DiaryVO> diaryList(Map map);
	
	// 여행기 총 페이지 가져오기 ==================================================================================================================================
	@Select("SELECT CEIL(COUNT(*)) FROM diary")
	public int diaryTotalPage();
	
	
	
	
	// 상세보기 ==============================================================================================================================================
	@Select("SELECT * FROM diary WHERE no = #{no}")
	public DiaryVO diaryDetail(int no);
	@Update("UPDATE diary SET hit = hit + 1 WHERE no = #{no}")
	public void diartyHit(int no);
	
	
	
	// 여행기 작성 ===============================================================================================================================================
	@SelectKey(keyProperty="no", resultType=int.class, before=true,
			statement="SELECT NVL(MAX(no)+1, 1) as no FROM diary")
	@Insert("INSERT INTO diary(no, id, subject, content, photo, tag, addr, visitdate) "
			+ "VALUES(#{no}, #{id}, #{subject}, #{content}, '테스트사진', '축제', '용산구', '2020-11-21')")
	public void diaryInsert(DiaryVO vo);
	
	
	
	// 여행기 삭제 ===============================================================================================================================================
	@Delete("DELETE FROM diary WHERE no = #{no}")
	public void diaryDelete(int no);
}
