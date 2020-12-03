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
	
	
// ________________음식점 댓글쓰기________________
	public void kfood_insertReply(KFood_replyVO vo){
		try {
			mapper.kfood_insertReply(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
// ________________댓글작성시 게시글 댓글수 증가 ________________
	public void kfood_replyIncrement(int no){
		try {
			mapper.kfood_replyIncrement(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
// ________________댓글 가져오기  ________________	
	public List<KFood_replyVO> kfood_listReply(int kfood_no){
		
		return mapper.kfood_listReply(kfood_no);
	}
	
	
// ________________대댓글 작성  ________________
	public void kfood_replyReplyInsert(int root, KFood_replyVO vo){
		KFood_replyVO parent_vo = mapper.kfood_replyParentData(root);
		mapper.kfood_replyStepIncrement(parent_vo);
		
		vo.setGi(parent_vo.getGi());
		vo.setGs(parent_vo.getGs() + 1);
		vo.setGt(parent_vo.getGt() + 1);
		vo.setRoot(root);
		
		mapper.kfood_replyReplyInsert(vo);
		mapper.kfood_replyDepthIncrement(root);
	}
	
	
// ________________댓글 수정  ________________
	public void kfood_updateReply(KFood_replyVO vo){
		mapper.kfood_updateReply(vo);
	}
	
	
// ________________댓글 삭제  ________________
	public void kfood_deleteReply(int no){
		
		try {
			KFood_replyVO vo = mapper.kfood_InfoData(no);
			if(vo.getDepth()==0)
			   {
				   mapper.kfood_deleteReply(no);
			   }
			   else
			   {
				   mapper.kfood_adminMessage(no);
			   }
			mapper.kfood_depthDecrement(vo.getRoot());
		} catch (Exception e) {
			
		}
		
	}

	
	
	
}