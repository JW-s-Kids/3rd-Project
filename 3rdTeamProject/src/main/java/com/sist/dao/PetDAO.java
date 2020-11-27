package com.sist.dao;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.PetMapper;

@Repository
public class PetDAO {
	@Autowired
	private PetMapper mapper;
	
	// 반려동물 list 출력
	public List<PetVO> petListData(Map map){
		return mapper.petListData(map);
	}
	// 반려동물 총 페이지 출력
	public int petTotalPage(){
		return mapper.petTotalPage();
	}
	
	// 반려동물  detail, hit
	public PetVO petDetailData(int no) {
		mapper.petHitIncrement(no);
		return mapper.petDetailData(no);
	}
	
	// Insert
		public void petInsert(PetVO vo) {
			mapper.petInsert(vo);
		}
}
