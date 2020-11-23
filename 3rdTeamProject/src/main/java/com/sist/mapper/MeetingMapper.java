package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.dao.MeetingVO;

public interface MeetingMapper {
	//모임 리스트
	@Select("SELECT mno,mname,mmsg,mimg,maddr,maddr2,minwon,mjoin,hit,num "
			+"FROM (SELECT mno,mname,mmsg,mimg,maddr,maddr2,minwon,mjoin,hit,rownum as num "
			+"FROM (SELECT mno,mname,mmsg,mimg,maddr,maddr2,minwon,mjoin,hit "
			+"FROM meeting)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<MeetingVO> meetingListData(Map map);
	
	//모임 총페이지
	@Select("SELECT CEIL(COUNT(*)/6.0) FROM meeting")
	public int meetingTotalPage();
	
	//조회수 증가
	@Update("UPDATE meeting SET hit=hit+1 WHERE mno=#{mno}")
	public int meetingHitIncrement();
	
	//참여 인원 증가
	@Update("UPDATE meeting SET mjoin=mjoin+1 WHERE mno=#{mno}")
	public int meetingJoinHitIncrement();
	
	
	
	
	
	
	
	
}
