package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.dao.DiaryVO;
import com.sist.dao.Diary_replyVO;
import com.sist.dao.Diary_scrapVO;

import lombok.Delegate;

public interface DiaryMapper {

	// 여행기 목록 출력 ==================================================================================================================================
	@Select("SELECT no, id, subject, content, photo, regdate, hit, reply, tag, good, addr,visitdate, thumbnail, num "
			+ "FROM (SELECT no, id, subject, content, photo, regdate, hit, reply, tag, good, addr,visitdate, thumbnail, rownum as num "
			+ "FROM (SELECT no, id, subject, content, photo, regdate, hit, reply, tag, good, addr,visitdate, thumbnail "
			+ "FROM diary ORDER BY no)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<DiaryVO> diaryList(Map map);
	
	// 여행기 총 페이지 가져오기 ==================================================================================================================================
	@Select("SELECT CEIL(COUNT(*)) FROM diary")
	public int diaryTotalPage();
	
	
	
	
	// 상세보기 ==============================================================================================================================================
	@Select("SELECT * FROM diary WHERE no = #{no}")
	public DiaryVO diaryDetail(int no);
	@Update("UPDATE diary SET hit = hit + 1 WHERE no = #{no}")
	public void diartyHit(int no);
	
	
	
	// 여행기 작성 ===============================================================================================================================================
	@SelectKey(keyProperty="no", resultType=int.class, before=true,
			statement="SELECT NVL(MAX(no)+1, 1) as no FROM diary")
	@Insert("INSERT INTO diary(no, id, subject, content, photo, tag, addr, visitdate, thumbnail) "
			+ "VALUES(#{no}, #{id}, #{subject}, #{content}, #{photo}, '축제', '용산구', '2020-11-21', #{thumbnail})")
	public void diaryInsert(DiaryVO vo);
	
	
	
	// 여행기 삭제 ===============================================================================================================================================
	@Delete("DELETE FROM diary WHERE no = #{no}")
	public void diaryDelete(int no);
	
	
	
	// 여행기 수정 ==============================================================================================================================================
	@Update("UPDATE diary SET content = #{content}, subject = #{subject} WHERE no = #{no}")
	public void diaryUpdate(Map map);
	
	
	
	
	
	
	// 댓글쓰기 ============================================================================================================================================
	@SelectKey(keyProperty="no", resultType=int.class, before=true,
			statement="SELECT NVL(MAX(no)+1, 1) as no FROM diary_reply")
	@Insert("INSERT INTO diary_reply(no, diary_no, id, content, gi) VALUES(#{no}, #{diary_no}, #{id}, #{content}, (SELECT NVL(MAX(gi)+1,1) FROM diary_reply))")
	public void diary_insertReply(Diary_replyVO vo);
	
	// 댓글쓰면 게시글 댓글수 증가
	@Update("UPDATE diary SET reply = reply + 1 WHERE no = #{no}")
	public void diary_replyIncrement(int no);
	
	
	// 댓글목록 출력 ============================================================================================================================================
	@Select("SELECT no, diary_no, id, content, regdate, gt FROM diary_reply WHERE diary_no=#{diary_no} ORDER BY gi DESC , gs ASC")
	public List<Diary_replyVO> diary_listReply(int diary_no);
	
	
	// 부모댓글 정보 가져오기 =========================================================================================================================================
	@Select("SELECT gi, gs, gt FROM diary_reply WHERE no = #{no}")
	public Diary_replyVO diary_replyParentData(int no);
	
	
	
	// 댓글순서 증가 ==========================================================================================================================================
	@Update("UPDATE diary_reply SET gs = gs + 1 WHERE gi = #{gi} AND gs > #{gs}")
	public void diary_replyStepIncrement(Diary_replyVO vo);
	
	
	// 대댓글 달기 ===========================================================================================================================================
	@SelectKey(keyProperty="no", resultType=int.class, before=true,
			statement="SELECT NVL(MAX(no)+1, 1) as no FROM diary_reply")
	@Insert("INSERT INTO diary_reply(no, diary_no, id, content, gi, gs, gt, root, depth) VALUES(#{no}, #{diary_no}, #{id}, #{content}, #{gi}, #{gs}, #{gt}, ${root}, 0)")
	public void diary_replyReplyInsert(Diary_replyVO vo);
	
	
	// 부모댓글 depth 증가 ======================================================================================================================================
	@Update("UPDATE diary_reply SET depth = depth + 1 WHERE no=#{no}")
	public void diary_replyDepthIncrement(int no);
	
	
	// 댓글 수정 ========================================================================================================================================
	@Update("UPDATE diary_reply SET content = #{content} WHERE no = #{no}")
	public void diary_updateReply(Diary_replyVO vo);
	
	

	// 댓글 삭제시 부모댓글 정보 가져오기  ========================================================================================================================================
	@Select("SELECT depth, root FROM diary_reply WHERE no = #{no}")
	public Diary_replyVO diary_InfoData(int no);
	
	
	// 댓글 삭제 ========================================================================================================================================
	@Delete("DELETE FROM diary_reply WHERE no = #{no}")
	public void diary_deleteReply(int no);
	
	
	// 댓글 삭제시 관리자 메시지 삽입 ========================================================================================================================================
	@Update("UPDATE diary_reply SET content = '관리자가 삭제한 댓글입니다' WHERE no = #{no}")
	public void diary_adminMessage(int no);
	
	
	// 부모댓글의 depth 감소 ========================================================================================================================================
	@Update("UPDATE diary_reply SET depth = depth - 1 WHERE no = #{no}")
	public void diary_depthDecrement(int no);
	
	
	
	/*
	 * <!-- 스크랩 저장  -->
	<insert id="scrapInsert" parameterType="JobKnowledgeScrapVO">
	INSERT INTO JobKnowledgeScrap VALUES(
	(SELECT NVL(MAX(no)+1,1) FROM JobKnowledgeScrap),#{id},#{mno}
	)
	</insert>
	 */
	// 스크랩 저장 =========================================================================================================================================
	@Insert("INSERT INTO diary_scrap VALUES((SELECT NVL(MAX(no)+1,1) FROM diary_Scrap), #{id}, #{mno})")
	public void scrap_insert(Diary_scrapVO vo);
	
	
	/*
	 * <!-- 스크랩 리스트 가져오기 -->
	<select id="scrapListData" parameterType="String" resultType="JobKnowledgeScrapVO">
	SELECT * FROM JobKnowledgeScrap
	WHERE id=#{id}
	ORDER BY no DESC
	</select>
	 */
	// 스크랩 리스트 가져오기 ====================================================================================================================================
	@Select("SELECT * FROM diary_scrap WHERE id = #{id} ORDER BY no DESC")
	public List<Diary_scrapVO> scrapListData(String id);
	
	
	/*
	 * <!-- 스크랩 여부 확인 -->
	<select id="scrapCount" parameterType="JobKnowledgeScrapVO" resultType="int">
	SELECT COUNT(*) FROM JobKnowledgeScrap
	WHERE id=#{id} AND mno=#{mno}
	</select>
	 */
	// 스크랩 여부 확인 ====================================================================================================================================
	@Select("SELECT COUNT(*) FROM diary_scrap WHERE id = #{id} AND mno = #{mno}")
	public int scrapCount(Diary_scrapVO vo);
	
	
	
	/*
	 * <!-- 스크랩 취소  -->
	<delete id="scrapDelete" parameterType="int">
	DELETE FROM JobKnowledgeScrap
	WHERE mno=#{no}
	</delete>
	
	 */
	// 스크랩 취소 ====================================================================================================================================
	@Delete("DELETE FROM diary_scrap WHERE no = #{no}")
	public void scrapDelete(int no);
	
	
	
	
	
	
}

