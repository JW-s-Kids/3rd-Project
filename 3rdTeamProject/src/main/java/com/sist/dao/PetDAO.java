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
		return mapper.petDetailData(no);
	}
	public void petHitIncrement(int no) {
		mapper.petHitIncrement(no);
	}
	
	
	// �ݷ����� Insert
	public void petInsert(PetVO vo) {
		try{
		mapper.petInsert(vo);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
		
	// �ݷ����� delete	
	public void petDelete(int no){	
		try{
			mapper.petDelete(no);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
		
	// �ݷ����� update
	public void petUpdate(Map map){
		try {
			mapper.petUpdate(map);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	
	
	
	
	//-------------------------------- reply --------------------------------
	
	// ��� ���� =====================================================================================================================================
		public void pet_insertReply(Pet_replyVO vo){
			try {
				mapper.pet_insertReply(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// ����ۼ��� �Խñ� ��ۼ� ���� =======================================================================================================================
		public void pet_replyIncrement(int no){
			try {
				mapper.pet_replyIncrement(no);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		// ��� �������� =================================================================================================================================
		public List<Pet_replyVO> pet_listReply(int pet_no){
			
			return mapper.pet_listReply(pet_no);
		}
		
		
		// ���� �ۼ� =======================================================================================================================================
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
		
		
		// ��� ���� =======================================================================================================================================
		public void pet_updateReply(Pet_replyVO vo){
			mapper.pet_updateReply(vo);
		}
		
		
		// ��� ���� ========================================================================================================================================
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

		
		// ��ũ�� =============================================================================================================================================
		
		// ��ũ���ϱ�
		public void scrapInsert(Pet_scrapVO vo){
			mapper.scrap_insert(vo);
		}

		// ��ũ����� ��������
		public List<Pet_scrapVO> scrapListData(String id){
			return mapper.scrapListData(id);
		}

		// ��ũ�� ���� Ȯ��
		public int scrapCount(Pet_scrapVO vo){
			return mapper.scrapCount(vo);
		}

		// ��ũ�� ���
		public void scrapDelete(int no){
			mapper.scrapDelete(no);
		} 
	}
