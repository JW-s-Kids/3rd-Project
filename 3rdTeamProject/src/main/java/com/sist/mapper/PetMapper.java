package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.dao.PetVO;

public interface PetMapper {
	// 반려동물 list
	@Select("SELECT no,subject,id,regdate,hit,num " 
			+ "FROM (SELECT no,subject,id,regdate,hit,rownum as num "
			+ "FROM (SELECT no,subject,id,regdate,hit " 
			+ "FROM dog_board2 ORDER BY no DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<PetVO> petListData(Map map);

	// 반려동물 Total page
	@Select("SELECT CEIL(COUNT(*)/8.0) FROM dog_board2")
	public int petTotalPage();

	
	// 글번호 자동증가, 글쓰기 데이터추가
	@SelectKey(keyProperty = "no", resultType = int.class, before = true, statement = "SELECT NVL(MAX(no)+1,1) as no FROM dog_board1")
	@Insert("INSERT INTO dog_board2(no,subject,id,content,pwd) " 
	+ "VALUES(#{no},#{subject},#{id},#{content},#{pwd})")
	public void petInsert(PetVO vo);

	
	// Hit 
	@Update("UPDATE dog_board2 SET " 
			+ "hit=hit+1 " 
			+ "WHERE no=#{no}")
	public void petHitIncrement(int no);

	
	// Detail
	@Select("SELECT no,subject,id,content,regdate,hit " 
			+ "FROM dog_board2 WHERE no=#{no}")
	public PetVO petDetailData(int no);

	
	// Update

	
	// Delete
	@Delete("DELETE FROM dog_board2 " 
			+ "WHERE no=#{no}")
	public void petDelete(int no);

	
	// Reply

}