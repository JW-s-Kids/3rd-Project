package com.sist.dao;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.PetMapper;

@Repository
public class PetDAO {
	@Autowired
	private PetMapper mapper;
	
	// �ݷ����� list ���
	public List<PetVO> petListData(Map map){
		return mapper.petListData(map);
	}
	// �ݷ����� �� ������ ���
	public int petTotalPage(){
		return mapper.petTotalPage();
	}
	
	// �ݷ�����  detail, hit
	public PetVO petDetailData(int no) {
		mapper.petHitIncrement(no);
		return mapper.petDetailData(no);
	}
	
	// Insert
		public void petInsert(PetVO vo) {
			mapper.petInsert(vo);
		}
}
