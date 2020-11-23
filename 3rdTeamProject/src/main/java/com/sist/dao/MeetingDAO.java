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
	
}
