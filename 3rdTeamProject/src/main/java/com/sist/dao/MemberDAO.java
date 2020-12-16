package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MemberMapper;

import java.util.*;

@Repository
public class MemberDAO {
	
	@Autowired
	private MemberMapper mapper;
	
	
	// (로그인) 아이디 일치여부에 따라 로그인 수행 =====================================================================================================================
	public MemberVO memberLogin(String id, String pwd){
		
		MemberVO vo = new MemberVO();
//		  SqlSession session=ssf.openSession();
		  int count = mapper.memberIdCheck(id);
		  if(count==0)
		  {
			  vo.setMsg("NOID");
		  }
		  else
		  {
			  MemberVO dVO = mapper.memberLogin(id);
		  if(pwd.equals(dVO.getPwd()))
		  {
			  vo.setMsg("OK");
			  vo.setId(dVO.getId());
			  vo.setName(dVO.getName());
			  vo.setAdmin(dVO.getAdmin());
		  }
		  else
		  {
			  vo.setMsg("NOPWD");
			  }
		  }
		  
		  return vo;
	}
	
	
	
	// 카카오톡 이메일주소가 디비에 없으면 디비에 닉네임과 이메일주소 넣기 ===========================================================================================================================
	public void member_insertKakao(Map map){
		
		try {
			int count = mapper.member_isEmail(map);
			
			if(count == 0){
				mapper.member_insertKakao(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	// 카카오톡 계정과 사이트 회원연동 여부 확인 ========================================================================================================================================================
	public String member_ismember(String email){
		
		String ismember_result = "";
		
		try {
			ismember_result = mapper.member_ismember(email);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return ismember_result;
	}
	
	
	
	// 카카오톡 계정 연동 안되어있을 시에 추가 정보 입력 ==========================================================================================================================================
	public void member_getAdditionalInfo(MemberVO vo){
		try {
			mapper.member_getAdditionalInfo(vo);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	// 회원연동 완료 (ISMEMBER 컬럼을 y로 변경) ==============================================================================================
	public void member_interlock_ok(String email){
		try {
			mapper.member_interlock_ok(email);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
}
