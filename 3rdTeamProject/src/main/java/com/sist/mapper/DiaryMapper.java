package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.dao.DiaryVO;
import com.sist.dao.Diary_replyVO;

import lombok.Delegate;

public interface DiaryMapper {

	// 여행기 목록 출력 ==================================================================================================================================
	@Select("SELECT no, id, subject, content, photo, regdate, hit, reply, tag, good, addr,visitdate, num "
			+ "FROM (SELECT no, id, subject, content, photo, regdate, hit, reply, tag, good, addr,visitdate, rownum as num "
			+ "FROM (SELECT no, id, subject, content, photo, regdate, hit, reply, tag, good, addr,visitdate "
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
	@Insert("INSERT INTO diary(no, id, subject, content, photo, tag, addr, visitdate) "
			+ "VALUES(#{no}, #{id}, #{subject}, #{content}, '테스트사진', '축제', '용산구', '2020-11-21')")
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
	
	
/*
 * <select id="replyInfoData" resultType="ReplyVO" parameterType="int">									<!-- 댓글삭제시 부모댓글 정보 가져오기 -->
    SELECT depth,root FROM movie_reply
    WHERE no=#{no}
  </select>
 */
	// 댓글 삭제시 부모댓글 정보 가져오기  ========================================================================================================================================
	@Select("SELECT depth, root FROM diary_reply WHERE no = #{no}")
	public Diary_replyVO diary_InfoData(int no);
	
	/*
	 * <delete id="replyDelete" parameterType="int">															<!-- 댓글 삭제 -->
    DELETE FROM movie_reply
    WHERE no=#{no}
  </delete>
	 */
	// 댓글 삭제 ========================================================================================================================================
	@Delete("DELETE FROM diary_reply WHERE no = #{no}")
	public void diary_deleteReply(int no);
	
	/*
	 * <update id="replyMsgUpdate" parameterType="int">														
    UPDATE movie_reply SET
    msg='관리자가 삭제한 댓글입니다'
    WHERE no=#{no}
  </update>
	 */
	// 댓글 삭제시 관리자 메시지 삽입 ========================================================================================================================================
	@Update("UPDATE diary_reply SET content = '관리자가 삭제한 댓글입니다' WHERE no = #{no}")
	public void diary_adminMessage(int no);
	
	/*
	 * <update id="replyDepthDecrement" parameterType="int">													<!-- 부모댓글 depth 감소 -->
    UPDATE movie_reply SET
    depth=depth-1
    WHERE no=#{no}
  </update>
	 */
	// 부모댓글의 depth 감소 ========================================================================================================================================
	@Update("UPDATE diary_reply SET depth = depth - 1 WHERE no = #{no}")
	public void diary_depthDecrement(int no);
}

