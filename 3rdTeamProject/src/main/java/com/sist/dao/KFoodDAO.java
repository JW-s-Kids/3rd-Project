package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.KFoodMapper;
@Repository
public class KFoodDAO {
     @Autowired
     private KFoodMapper mapper;
     
  // _____________음식 리스트[목록] 출력________________
    public List<KFoodVO> kfoodList(Map map)
    {
   	 return mapper.kfoodList(map);
    }
    
 // _____________음식 총 페이지 가져오기________________  
	public int kfoodTotalPage(){
		return mapper.kfoodTotalPage();
	}

// ________________음식 디테일[상세] 출력________________	
	public KFoodVO kfoodDetail(int kf_no){
		return mapper.kfoodDetail(kf_no);
	}
//  ________________조회수________________	
//	public void kfoodHit(int kf_no){
//		mapper.kfoodHit(kf_no);
//	}
// ________________관련 음식점 가져오기________________
//public List<KFoodVO> kfoodLikeKFoodData(String finddata)
//{
//return mapper.kfoodLikeKFoodData(finddata);/
//}

// 	________________Kfood_replyVO________________________________________________
	
	


	
	
	
}