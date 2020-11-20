package com.sist.service;

import java.util.*;
import java.io.*;
import java.net.*;
import org.springframework.stereotype.Service;

import com.google.gson.*;

@Service
public class KakaoAPI {
	
	
	// 카카오톡 서버에서 엑세스 토큰 가져오기 ===================================================================================================
	public String getAccessToken (String authorize_code) {
        String access_Token = "";																			// 카카오톡 액세스 토큰
        String refresh_Token = "";																			// 카카오톡 리프레쉬 토큰
        String reqURL = "https://kauth.kakao.com/oauth/token";												// 토큰을 가져올 카카오톡 서버의 주소
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();								// 토큰 가져올 서버와 연결
            
            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);																			// 카카오톡 서버에서 출력 가능한 상태로 설정
            
            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));			// 1.서버에서 출력값 받기  2.서버에서 받은 출력값을 OutputStreamWriter 객체로 인코딩  3.인코딩한 것을 BufferedWriter 인스턴스에 저장
            StringBuilder sb = new StringBuilder();															// StringBuilder : String보다 문자열을 붙이는 성능이 좋음
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=b680389f36f31c90bbb5aea9d43841d6");
            sb.append("&redirect_uri=http://localhost:8067/web/member/kakao_login.do");
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());																		// StringBuilder 객체를 문자열로 형변환 후, BufferedWriter 인스턴스로 읽기
            bw.flush();
            
            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
 
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));			// 카카오톡 서버에서 얻은 값을 BufferedReader로 읽기
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {														// 변수 line에 BufferedReader로 읽은 값들을 저장하고, 변수 line이 끝날 때까지 result에 같다 붙이기
                result += line;
            }
            System.out.println("response body : " + result);
            
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);														// 변수 result에 저장된 값들을 파싱하여 element 변수에 넣기
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        
        return access_Token;
    }
	
	
	
	
	
	

// 카카오톡 서버에서 유저정보 가져오기 ===========================================================================================================
	public HashMap<String, Object> getUserInfo (String access_Token) {
	    
	    //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("response body : " + result);
	        
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String email = kakao_account.getAsJsonObject().get("email").getAsString();
	        
	        userInfo.put("nickname", nickname);
	        userInfo.put("email", email);
	        
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    
	    return userInfo;
	}
	
	
	
	
	// 카카오톡 로그아웃 ======================================================================================================================================
	public void kakaoLogout(String access_Token) {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	}
	
	
	// 카카오톡 계정과 함께 로그아웃 ==============================================================================================================================
	public void kakaoLogout_entire(){
		String reqURL = "https://kauth.kakao.com/oauth/logout?client_id=b680389f36f31c90bbb5aea9d43841d6&logout_redirect_uri=http://localhost:8067/web/main/main.do";
		
		try {
			URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
