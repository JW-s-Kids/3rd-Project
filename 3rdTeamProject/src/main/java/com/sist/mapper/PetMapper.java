package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;


import com.sist.dao.PetVO;
import com.sist.dao.Pet_replyVO;
import com.sist.dao.Pet_scrapVO;

public interface PetMapper {
	// �ݷ����� list
	@Select("SELECT no,subject,id,regdate,hit,reply,num " 
			+ "FROM (SELECT no,subject,id,regdate,hit,reply,rownum as num "
			+ "FROM (SELECT no,subject,id,regdate,hit,reply " 
			+ "FROM dog_board2 ORDER BY no DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<PetVO> petListData(Map map);

	// �ݷ����� Total page
	@Select("SELECT CEIL(COUNT(*)/8.0) FROM dog_board2")
	public int petTotalPage();

	
	

	
	// Detail
	@Select("SELECT no,subject,id,content,regdate,hit FROM dog_board2 WHERE no=#{no}")
	public PetVO petDetailData(int no);

	// Detail-Hit 
	@Update("UPDATE dog_board2 SET hit=hit+1 WHERE no=#{no}")
	public void petHitIncrement(int no);
	
	// Insert
	@SelectKey(keyProperty = "no", resultType = int.class, before = true, statement = "SELECT NVL(MAX(no)+1,1) as no FROM dog_board1")
	@Insert("INSERT INTO dog_board2(no,subject,id,content,pwd) " 
			+ "VALUES(#{no},#{subject},#{id},#{content},#{pwd})")
	public void petInsert(PetVO vo);
		
	// Delete
	@Delete("DELETE FROM dog_board2 WHERE no=#{no}")
	public void petDelete(int no);

	// Update
	@Update("UPDATE dog_board2 SET content = #{content}, subject = #{subject} WHERE no = #{no}")
	public void petUpdate(Map map);
	
	
	
	
	// Reply
	@SelectKey(keyProperty="no", resultType=int.class, before=true,
				statement="SELECT NVL(MAX(no)+1, 1) as no FROM pet_reply")
	@Insert("INSERT INTO pet_reply(no, pet_no, id, content, gi) VALUES(#{no}, #{pet_no}, #{id}, #{content}, (SELECT NVL(MAX(gi)+1,1) FROM pet_reply))")
	public void pet_insertReply(Pet_replyVO vo);
		
	// �ݷ�����list reply ����
	@Update("UPDATE dog_board2 SET reply = reply + 1 WHERE no = #{no}")
	public void pet_replyIncrement(int no);
		
	// reply list
	@Select("SELECT no, pet_no, id, content, regdate, gt FROM pet_reply WHERE pet_no=#{pet_no} ORDER BY gi DESC , gs ASC")
	public List<Pet_replyVO> pet_listReply(int pet_no);
		
		
	// ���� ��� ���
	@Select("SELECT gi, gs, gt FROM pet_reply WHERE no = #{no}")
	public Pet_replyVO pet_replyParentData(int no);
		
	// ��ۼ��� ���� ==========================================================================================================================================
	@Update("UPDATE pet_reply SET gs = gs + 1 WHERE gi = #{gi} AND gs > #{gs}")
	public void pet_replyStepIncrement(Pet_replyVO vo);
		
		
	// ���� �ޱ� ===========================================================================================================================================
	@SelectKey(keyProperty="no", resultType=int.class, before=true,
				statement="SELECT NVL(MAX(no)+1, 1) as no FROM pet_reply")
	@Insert("INSERT INTO pet_reply(no, pet_no, id, content, gi, gs, gt, root, depth) VALUES(#{no}, #{pet_no}, #{id}, #{content}, #{gi}, #{gs}, #{gt}, ${root}, 0)")
	public void pet_replyReplyInsert(Pet_replyVO vo);
		
		
	// �θ��� depth ���� 
	@Update("UPDATE pet_reply SET depth = depth + 1 WHERE no=#{no}")
	public void pet_replyDepthIncrement(int no);
		
		
	// ��� ����
	@Update("UPDATE pet_reply SET content = #{content} WHERE no = #{no}")
	public void pet_updateReply(Pet_replyVO vo);
		
		

	// ��� ������ �θ��� ���� ��������  ========================================================================================================================================
	@Select("SELECT depth, root FROM pet_reply WHERE no = #{no}")
	public Pet_replyVO pet_InfoData(int no);
		
		
	// ��� ���� ========================================================================================================================================
	@Delete("DELETE FROM pet_reply WHERE no = #{no}")
	public void pet_deleteReply(int no);
		
		
	// ��� ������ ������ �޽��� ���� ========================================================================================================================================
	@Update("UPDATE pet_reply SET content = '�����ڰ� ������ ����Դϴ�' WHERE no = #{no}")
	public void pet_adminMessage(int no);
		
		
	// �θ����� depth ���� ========================================================================================================================================
	@Update("UPDATE pet_reply SET depth = depth - 1 WHERE no = #{no}")
	public void pet_depthDecrement(int no);
	
	
	
	
	
	
	// ��ũ�� ����
	@Insert("INSERT INTO pet_scrap VALUES((SELECT NVL(MAX(no)+1,1) FROM pet_Scrap), #{id}, #{pno})")
	public void scrap_insert(Pet_scrapVO vo);
		
	// ��ũ�� ����Ʈ �������� 
	@Select("SELECT * FROM pet_scrap WHERE id = #{id} ORDER BY no DESC")
	public List<Pet_scrapVO> scrapListData(String id);
		
	// ��ũ�� ���� Ȯ��
	@Select("SELECT COUNT(*) FROM pet_scrap WHERE id = #{id} AND pno = #{pno}")
	public int scrapCount(Pet_scrapVO vo);
		
	// ��ũ�� ���
	@Delete("DELETE FROM pet_scrap WHERE no = #{no}")
	public void scrapDelete(int no);
		
}