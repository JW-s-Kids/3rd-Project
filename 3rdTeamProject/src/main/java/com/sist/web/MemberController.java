package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.service.KakaoAPI;

@Controller
public class MemberController {
	
	@Autowired
	private KakaoAPI kakao;

	@RequestMapping("member/login.do")
	public String member_login(){
		return "member/login";
	}
	
	// 카카오톡 로그인 ==================================================================================================================
	@RequestMapping("member/kakao_login.do")
	public String member_kakao_login(@RequestParam("code") String code, HttpSession session){
		
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);
		
		if(userInfo.get("email") != null){
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("access_Token", access_Token);
		}
		
		return "main";
	}
	
	
	// 카카오톡 로그아웃 ===================================================================================================================
	@RequestMapping("member/kakao_logout.do")
	public String logout(HttpSession session) {
	    kakao.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("userId");
	    return "main";
	}

	
}
