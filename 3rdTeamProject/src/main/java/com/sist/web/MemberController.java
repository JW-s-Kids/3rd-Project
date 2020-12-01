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
	public String member_kakao_login(@RequestParam("code") String code, HttpSession session){
		
		try {
			String access_Token = kakao.getAccessToken(code);
			HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
			System.out.println("login Controller : " + userInfo);
			
			if(userInfo.get("email") != null){
				session.setAttribute("userEmail", userInfo.get("email"));
				session.setAttribute("userName", userInfo.get("nickname"));
				session.setAttribute("access_Token", access_Token);
				
				String name = (String)userInfo.get("nickname");
				String email = (String)userInfo.get("email");
				
				
				Map map = new HashMap();
				map.put("name", name);
				map.put("email", email);
				
				dao.member_insertKakao(map);
				System.out.println("name : " + name);
				System.out.println("email : " + email);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
