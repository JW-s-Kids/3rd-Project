package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
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
	
	//참여 인원 증가
	@Update("UPDATE meeting SET mjoin=mjoin+1 WHERE mno=#{mno}")
	public int meetingJoinHitIncrement();
	
	//상세보기
	//조회수 증가하고
	@Update("UPDATE meeting SET hit=hit+1 WHERE mno=#{mno}")
	public int meetingHitIncrement(int mno);
	//상세보기로
	@Select("SELECT mno,mname,mmsg,mimg,maddr,maddr2,maddr3,minwon,mjoin,hit "
			+"FROM meeting WHERE mno=#{mno}")
	public MeetingVO meetingDetailData(int mno);
	
	
	//모임추가
	@SelectKey(keyProperty="mno",resultType=int.class,before=true,
			statement="SELECT NVL(MAX(mno)+1,1) as mno FROM meeting")
	@Insert("INSERT INTO meeting(mno,mname,mmsg,maddr,maddr2,minwon) "
			+"VALUES(#{mno},#{mname},#{mmsg},#{maddr},#{maddr2},#{minwon})")
	public void meetingInsert(MeetingVO vo);
	
	//모임수정
	
	
	
	
	
	
	
	
	
	
	
}