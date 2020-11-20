package com.sist.mapper;

import java.util.*;
import org.apache.ibatis.annotations.Select;

import com.sist.dao.DiaryVO;

public interface DiaryMapper {

	// 여행기 목록 출력 ==================================================================================================================================
	@Select("SELECT no, id, subject, content, photo, regdate, hit, reply, tag, good, addr, num "
			+ "FROM (SELECT no, id, subject, content, photo, regdate, hit, reply, tag, good, addr, rownum as num "
			+ "FROM (SELECT no, id, subject, content, photo, regdate, hit, reply, tag, good, addr "
			+ "FROM diary ORDER BY no)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<DiaryVO> diaryList(Map map);
	
	// 여행기 총 페이지 가져오기 ==================================================================================================================================
	@Select("SELECT CEIL(COUNT(*)) FROM diary")
	public int diaryTotalPage();
}
