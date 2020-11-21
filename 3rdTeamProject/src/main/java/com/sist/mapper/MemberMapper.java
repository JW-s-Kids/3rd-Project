package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import java.util.*;

import com.sist.dao.MemberVO;

public interface MemberMapper {
	
	
	// 아이디 존재여부 체크 =================================================================================================
	@Select("SELECT COUNT(*) FROM member WHERE id=#{id}")
	public int memberIdCheck(String id);
	
	// 아이디 일치하면 사용자 정보 가져오기 ================================================================================================
	@Select("SELECT id, name, pwd, admin FROM member WHERE id=#{id}")
	public MemberVO memberLogin(String id);
	
	
	
	// 카카오톡 이메일주소가 디비에 있는지 확인 ===============================================================================================
	@Select("SELECT count(*) FROM member WHERE email = #{email}")
	public int member_isEmail(Map map);
	
	// 카톡 이메일주소가 디비에 없으면  카톡 이메일주소와 닉네임을 디비에 저장 ============================================================================
	@Insert("INSERT INTO member(name, email) VALUES(#{name}, #{email})")
	public void member_insertKakao(Map map);
}	
