package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.dao.DiaryVO;
import com.sist.dao.TourVO;

public interface TourMapper {

	

/////////////////////////여행지 목록 출력/////////////////////////
	@Select("SELECT tno,title,address,tel,bhour,bday,notice,trans,photo,content,site,thema,tag, num "
			+ "FROM (SELECT tno,title,address,tel,bhour,bday,notice,trans,photo,content,site,thema,tag, rownum as num "
			+ "FROM (SELECT tno,title,address,tel,bhour,bday,notice,trans,photo,content,site,thema,tag "
			+ "FROM tour ORDER BY tno)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<TourVO> tourList(Map map);
	
/////////////////////////여행지 총 페이지 가져오기/////////////////////////
	@Select("SELECT CEIL(COUNT(*)) FROM tour")
	public int tourTotalPage();

///////////////////////// 상세보기 /////////////////////////
	@Select("SELECT * FROM tour WHERE tno=#{no}")
	public TourVO tourDetail(int no);
	
///////////////////////// 관련 여행지 가져오기 /////////////////////////
	@Select("SELECT tno,title,photo,rownum "
			+"FROM tour "
			+"WHERE rownum<=3 AND "
			+"REGEXP_LIKE(thema,#{finddata})")
	public List<TourVO> tourLikeTourData(String finddata);
	
}
