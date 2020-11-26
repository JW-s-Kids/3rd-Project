package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.DogMapper;

@Repository
public class DogDAO {
	@Autowired
	private DogMapper mapper;
	
	// 메인 ////////////////////////////////////////////////////////
	
	// 메인 목록 읽기
	public List<DogVO> dogListData(Map map){
		return mapper.dogListData(map);
	}
	
	// 게시판1 총페이지 읽기
	public int dogTotalPage() {
		return mapper.dogTotalPage();
	}
	
	// 게시판1 조회수증가,상세보기
	public DogVO dogDetailData(int no) {
		mapper.dogHitIncrement(no);
		return mapper.dogDetailData(no);
	}
	
	
	// 게시판1 /////////////////////////////////////////////////////
	
	// 게시판1 목록 읽기
	public List<DogBoardVO> boardListData(Map map){
		return mapper.boardListData(map);
	}
	
	// 게시판1 총페이지 읽기
	public int boardTotalPage() {
		return mapper.boardTotalPage();
	}
	
	// 게시판1 조회수증가,상세보기
	public DogBoardVO boardDetailData(int no) {
		mapper.boardHitIncrement(no);
		return mapper.boardDetailData(no);
	}
	
	// 게시판1 추가
	public void boardInsert(DogBoardVO vo) {
		mapper.boardInsert(vo);
	}
	
	// 익명게시판 /////////////////////////////////////////////////////
	
	// 익게 목록 읽기
	public List<DogAnonymousVO> anonyListData(Map map){
		return mapper.anonyListData(map);
	}
		
	// 익게 총페이지 읽기
	public int anonyTotalPage() {
		return mapper.anonyTotalPage();
	}
		
	// 익게 추가
	public void anonyInsert(DogAnonymousVO vo) {
		mapper.anonyInsert(vo);
	}
}
