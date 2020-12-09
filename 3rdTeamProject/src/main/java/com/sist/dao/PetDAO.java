package com.sist.dao;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.PetMapper;

@Repository
public class PetDAO {
	@Autowired
	private PetMapper mapper;
	
	
	// -------------------------list----------------------------------
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
		return mapper.petDetailData(no);
	}
	public void petHitIncrement(int no) {
		mapper.petHitIncrement(no);
	}
	
	
	// 반려동물 Insert
	public void petInsert(PetVO vo) {
		try{
		mapper.petInsert(vo);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
		
	// 반려동물 delete	
	public void petDelete(int no){	
		try{
			mapper.petDelete(no);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
		
	// 반려동물 update
	public void petUpdate(Map map){
		try {
			mapper.petUpdate(map);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	
	
	
	
	//-------------------------------- reply --------------------------------
	
	// 댓글 쓰기 =====================================================================================================================================
		public void pet_insertReply(Pet_replyVO vo){
			try {
				mapper.pet_insertReply(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 댓글작성시 게시글 댓글수 증가 =======================================================================================================================
		public void pet_replyIncrement(int no){
			try {
				mapper.pet_replyIncrement(no);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		// 댓글 가져오기 =================================================================================================================================
		public List<Pet_replyVO> pet_listReply(int pet_no){
			
			return mapper.pet_listReply(pet_no);
		}
		
		
		// 대댓글 작성 =======================================================================================================================================
		public void pet_replyReplyInsert(int root, Pet_replyVO vo){
			Pet_replyVO parent_vo = mapper.pet_replyParentData(root);
			mapper.pet_replyStepIncrement(parent_vo);
			
			vo.setGi(parent_vo.getGi());
			vo.setGs(parent_vo.getGs() + 1);
			vo.setGt(parent_vo.getGt() + 1);
			vo.setRoot(root);
			
			mapper.pet_replyReplyInsert(vo);
			mapper.pet_replyDepthIncrement(root);
		}
		
		
		// 댓글 수정 =======================================================================================================================================
		public void pet_updateReply(Pet_replyVO vo){
			mapper.pet_updateReply(vo);
		}
		
		
		// 댓글 삭제 ========================================================================================================================================
		public void pet_deleteReply(int no){
			
			try {
				Pet_replyVO vo = mapper.pet_InfoData(no);
				if(vo.getDepth()==0)
				   {
					   mapper.pet_deleteReply(no);
				   }
				   else
				   {
					   mapper.pet_adminMessage(no);
				   }
				mapper.pet_depthDecrement(vo.getRoot());
			} catch (Exception e) {
				
			}
			
		}

		
		// 스크랩 =============================================================================================================================================
		
		// 스크랩하기
		public void scrapInsert(Pet_scrapVO vo){
			mapper.scrap_insert(vo);
		}

		// 스크랩목록 가져오기
		public List<Pet_scrapVO> scrapListData(String id){
			return mapper.scrapListData(id);
		}

		// 스크랩 여부 확인
		public int scrapCount(Pet_scrapVO vo){
			return mapper.scrapCount(vo);
		}

		// 스크랩 취소
		public void scrapDelete(int no){
			mapper.scrapDelete(no);
		} 
	}
