package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.dao.MemberDAO;
import com.sist.dao.MemberVO;
import com.sist.service.KakaoAPI;

@Controller
public class MemberController {
	
	@Autowired
	private KakaoAPI kakao;
	
	@Autowired
	private MemberDAO dao;

	// 로그인화면 출력 =========================================================================================================================
	@RequestMapping("member/login.do")
	public String member_login(){
		return "member/login";
	}
	
	// 카카오톡 로그인 ==================================================================================================================
	@RequestMapping("member/kakao_login.do")
	public String member_kakao_login(@RequestParam("code") String code, HttpSession session, Model model){
		
		String result = "";
		
		try {
			String access_Token = kakao.getAccessToken(code);
			HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
			System.out.println("login Controller : " + userInfo);
			
			if(userInfo.get("email") != null){
				session.setAttribute("userEmail", userInfo.get("email"));
				session.setAttribute("userName", userInfo.get("nickname"));
				session.setAttribute("id", userInfo.get("nickname"));
				session.setAttribute("access_Token", access_Token);
				
				String name = (String)userInfo.get("nickname");
				String email = (String)userInfo.get("email");
				
				Map map = new HashMap();
				map.put("name", name);
				map.put("email", email);
				
				dao.member_insertKakao(map);
				System.out.println("name : " + name);
				System.out.println("email : " + email);
				
				String ismember = dao.member_ismember((String)userInfo.get("email"));
				System.out.println("ismember : " + ismember);
				
				if(ismember == "y"){
					System.out.println("카카오톡 연동됨");
					result = "redirect:../main/main.do";
				}
				else {
					System.out.println("카카오톡 연동 안 됨");
					model.addAttribute("email", (String)userInfo.get("email"));
					result = "member/getAdditionalInfo";
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
//		return "redirect:../main/main.do";
	}
	
	
	// 회원 미연동시 추가정보 입력 ==============================================================================================================
	// INSERT INTO member(id, pwd, birthday, sex, tel) VALUES(#{id}, #{pwd}, #{birthday}, #{sex}, #{tel})
	@RequestMapping("member/getAdditionalInfo_ok.do")
	public String getAdditionalInfo_ok(String id, String pwd, String sex, String tel, String email, HttpSession session){
		
		try {
			System.out.println("아이디 : " + id);
			System.out.println("비번 : " + pwd);
			System.out.println("성별 : " + sex);
			System.out.println("전화번호 : " + tel);
			System.out.println("이메일 : " + email);
			MemberVO vo = new MemberVO();
			vo.setId(id);
			vo.setPwd(pwd);
			vo.setSex(sex);
			vo.setTel(tel);
			vo.setEmail(email);
			dao.member_getAdditionalInfo(vo);		// 추가 정보 삽입
			dao.member_interlock_ok(email);			// ISMEMBER 컬럼을 y로 변경
			
			session.setAttribute("id", id);
		} catch (Exception e) {
			e.getMessage();
		}
		
		
		
		return "redirect:../main/main.do";
	}
	
	
	
	
	// 카카오톡 로그아웃 ===================================================================================================================
	@RequestMapping("member/kakao_logout.do")
	public String logout(HttpSession session) {
	    kakao.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("userId");
	    session.invalidate();
//	    kakao.kakaoLogout_entire();
	    return "redirect:../main/main.do";
	}
	
	
	
	// 로그인 ok ===========================================================================================================================
	@RequestMapping("member/login_ok.do")
	public String member_login_ok(String id, String pwd, HttpSession session, Model model){
		
		MemberVO vo = dao.memberLogin(id, pwd);
		if(vo.getMsg().equals("OK"))
		{
		   session.setAttribute("id", vo.getId());
		   session.setAttribute("name", vo.getName());
		   session.setAttribute("admin", vo.getAdmin());
		}
		   
		model.addAttribute("msg", vo.getMsg());
		System.out.println("로그인 OK");
		
		return "redirect:../main/main.do";
	}
	
	// 로그아웃 ===============================================================================================================================
	@RequestMapping("member/logout.do")
	public String member_logout(HttpSession session){
		session.invalidate();
		return "redirect:../main/main.do";
	}
	
	
	// 마이페이지 =========================================================================================================================================
	@RequestMapping("member/mypage.do")
	public String member_mypage(){
		return "member/mypage";
	}
	
	// 마이페이지에서 회원정보수정 페이지 가져오기 ===============================================================================================================
	@RequestMapping("member/update.do")
	public String member_update(){
		return "member/update";
	}

	
}
