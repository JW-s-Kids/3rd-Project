package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import java.util.*;

@Repository
public class DiaryDAO {
	
	@Autowired
	private DiaryMapper mapper;
	
	
	// 여행기 목록 출력 ==============================================================================================================
	public List<DiaryVO> diaryList(Map map){
		return mapper.diaryList(map);
	}
	
	// 여행기 총페이지 가져오기 ==============================================================================================================
	public int diaryTotalPage(){
		return mapper.diaryTotalPage();
	}
	
	
	// 상세보기 ==============================================================================================================================================
	public DiaryVO diaryDetail(int no){
		return mapper.diaryDetail(no);
	}
	public void diartyHit(int no){
		mapper.diartyHit(no);
	}
	
	
	// 여행기 작성 ===============================================================================================================================================
	public void diaryInsert(DiaryVO vo){
		try {
			mapper.diaryInsert(vo);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
	
	
	
	
	// 여행기 삭제 ========================================================================================================================================
	public void diaryDelete(int no){
		try {
			mapper.diaryDelete(no);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	
	
	
	// 여행기 수정 ======================================================================================================================================
	public void diaryUpdate(Map map){
		try {
			mapper.diaryUpdate(map);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	
	
	
	
	// 댓글 쓰기 =====================================================================================================================================
	public void diary_insertReply(Diary_replyVO vo){
		try {
			mapper.diary_insertReply(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 댓글작성시 게시글 댓글수 증가 =======================================================================================================================
	public void diary_replyIncrement(int no){
		try {
			mapper.diary_replyIncrement(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 댓글 가져오기 =================================================================================================================================
	public List<Diary_replyVO> diary_listReply(int diary_no){
		
		return mapper.diary_listReply(diary_no);
	}
	
	
	// 대댓글 작성 =======================================================================================================================================
	public void diary_replyReplyInsert(int root, Diary_replyVO vo){
		Diary_replyVO parent_vo = mapper.diary_replyParentData(root);
		mapper.diary_replyStepIncrement(parent_vo);
		
		vo.setGi(parent_vo.getGi());
		vo.setGs(parent_vo.getGs() + 1);
		vo.setGt(parent_vo.getGt() + 1);
		vo.setRoot(root);
		
		mapper.diary_replyReplyInsert(vo);
		mapper.diary_replyDepthIncrement(root);
	}
	
	
	// 댓글 수정 =======================================================================================================================================
	public void diary_updateReply(Diary_replyVO vo){
		mapper.diary_updateReply(vo);
	}
	
	
	// 댓글 삭제 ========================================================================================================================================
	public void diary_deleteReply(int no){
		
		try {
			Diary_replyVO vo = mapper.diary_InfoData(no);
			if(vo.getDepth()==0)
			   {
				   mapper.diary_deleteReply(no);
			   }
			   else
			   {
				   mapper.diary_adminMessage(no);
			   }
			mapper.diary_depthDecrement(vo.getRoot());
		} catch (Exception e) {
			
		}
		
	}
	
	
	
	// 스크랩 =============================================================================================================================================
	
	// 스크랩하기 =========================================================================================================
	public void scrapInsert(Diary_scrapVO vo){
		mapper.scrap_insert(vo);
	}

	// 스크랩목록 가져오기 =========================================================================================================
	public List<Diary_scrapVO> scrapListData(String id){
		return mapper.scrapListData(id);
	}

	// 스크랩 여부 확인 =========================================================================================================
	public int scrapCount(Diary_scrapVO vo){
		return mapper.scrapCount(vo);
	}

	// 스크랩 취소 =========================================================================================================
	public void scrapDelete(int no){
		mapper.scrapDelete(no);
	} 
	
	
	// 여행기 검색 ================================================================================================================
	public List<DiaryVO> diaryList_search(Map map){
		return mapper.diaryList_search(map);
	}
}
