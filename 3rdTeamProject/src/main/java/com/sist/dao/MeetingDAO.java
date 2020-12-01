package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MeetingMapper;

@Repository
public class MeetingDAO {
	@Autowired
	private MeetingMapper mapper;
	
	//모임리스트
	public List<MeetingVO> meetingListData(Map map){
		return mapper.meetingListData(map);
	}
	
	//모임총페이지
	public int meetingTotalPage() {
		return mapper.meetingTotalPage();
	}
	
	//상세보기
	public MeetingVO meetingDetailData(int mno) {
		mapper.meetingHitIncrement(mno);
		return mapper.meetingDetailData(mno);
		
	}
	
	//모임추가
	public void meetingInsert(MeetingVO vo) {
		try {
			mapper.meetingInsert(vo);
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
		
	}
	
	//모임수정
	public void meetingUpdate(Map map) {
		try {
			mapper.meetingUpdate(map);
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
	
	//모임 삭제
	public void meetingDelete(int mno) {
		try {
			mapper.meetingDelete(mno);
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
			
	}
	//모임검색
	public List<MeetingVO> meetingFindListData(Map map){
		return mapper.meetingFindListData(map);
	}
	
	
	

	
	//참여인원증가
	public int meetingJoinHitIncrement(int mno){
		return mapper.meetingJoinHitIncrement();
	}
	
}
