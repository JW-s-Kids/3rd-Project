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
}
