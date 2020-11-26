package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import com.sist.dao.*;
public interface DogMapper {
	
	// 메인 /////////////////////////////////////////////////////////////
	
	// 메인 리스트 출력
		@Select("SELECT no,name,img,content,zone,addr,star,time,regdate,hit,love,num "
				+"FROM (SELECT no,name,img,content,zone,addr,star,time,regdate,hit,love,rownum as num "
				+"FROM (SELECT no,name,img,content,zone,addr,star,time,regdate,hit,love "
				+"FROM park ORDER BY name DESC)) "
				+"WHERE num BETWEEN #{start} AND #{end}")
		public List<DogVO> dogListData(Map map);
	
	// 메인 페이지당 8개로 잘랐을 때 총페이지 수
	@Select("SELECT CEIL(COUNT(*)/9.0) FROM park")
	public int dogTotalPage();
	
	// 메인 조회수 증가
	@Update("UPDATE park SET "
			+"hit=hit+1 "
			+"WHERE no=#{no}")
	public void dogHitIncrement(int no);
	
	// 메인 좋아요 증가
	
	// 메인상세 보기
	@Select("SELECT * FROM park WHERE no=#{no}")
	public DogVO dogDetailData(int no);
	
	// 댓글
	
	
	// 게시판1 /////////////////////////////////////////////////////////////
	
	// 게시판1 리스트 출력
	@Select("SELECT no,subject,id,regdate,hit,num "
			+"FROM (SELECT no,subject,id,regdate,hit,rownum as num "
			+"FROM (SELECT no,subject,id,regdate,hit "
			+"FROM dog_board1 ORDER BY no DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<DogBoardVO> boardListData(Map map);
	
	// 게시판1 페이지당 8개로 잘랐을 때 총페이지 수
	@Select("SELECT CEIL(COUNT(*)/8.0) FROM dog_board1")
	public int boardTotalPage();
	
	// 게시판1 글번호 자동증가, 글쓰기 데이터추가
	@SelectKey(keyProperty="no",resultType=int.class,before=true,
			statement="SELECT NVL(MAX(no)+1,1) as no FROM dog_board1")
	@Insert("INSERT INTO dog_board1(no,subject,id,content,pwd) "
			+"VALUES(#{no},#{subject},#{id},#{content},#{pwd})")
	public void boardInsert(DogBoardVO vo);
	
	// 게시판1 조회수증가
	@Update("UPDATE dog_board1 SET "
			+"hit=hit+1 "
			+"WHERE no=#{no}")
	public void boardHitIncrement(int no);
	
	// 게시판1 상세보기
	@Select("SELECT no,subject,id,content,regdate,hit "
			+"FROM dog_board1 WHERE no=#{no}")
	public DogBoardVO boardDetailData(int no);
	
	// 게시판1 수정
	
	// 게시판1 삭제 
	@Delete("DELETE FROM dog_board1 "
			+"WHERE no=#{no}")
	public void boardDelete(int no);
	
	// 게시판1 댓글
	
	
	// 익명게시판 /////////////////////////////////////////////////////////////

	// 익게 리스트 출력
	@Select("SELECT no,msg,regdate,ip,num "
			+"FROM (SELECT no,msg,regdate,ip,rownum as num "
			+"FROM (SELECT no,msg,regdate,ip "
			+"FROM dog_board3 ORDER BY no DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<DogAnonymousVO> anonyListData(Map map);
		
	// 익게 페이지당 10개로 잘랐을 때 총페이지 수
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM dog_board3")
	public int anonyTotalPage();
		
	// 익게 글번호 자동증가, 글쓰기 데이터추가
	@SelectKey(keyProperty="no",resultType=int.class,before=true,
			statement="SELECT NVL(MAX(no)+1,1) as no FROM dog_board3")
	@Insert("INSERT INTO dog_board3(no,msg,pwd) "
			+"VALUES(#{no},#{msg},#{pwd})")
	public void anonyInsert(DogAnonymousVO vo);
	
	// 익게 수정
		
	// 익게 삭제 
	@Delete("DELETE FROM dog_board3 "
			+"WHERE no=#{no}")
	public void anonyDelete(int no);
		
	// 익게 댓글

}
