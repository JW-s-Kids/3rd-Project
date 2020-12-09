package com.sist.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sist.dao.PetDAO;
import com.sist.dao.PetVO;
import com.sist.dao.Pet_replyVO;
import com.sist.dao.Pet_scrapVO;
import com.sist.utils.UploadFileUtils;
	
@Controller
public class PetController {
	@Autowired
	private PetDAO dao;
	
	
	// 반려동물 자랑하기 List
	@RequestMapping("pet/list.do")
	public String pet_list(String page, Model model) {
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=8;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		int totalpage=dao.petTotalPage();
		map.put("start", start);
		map.put("end", end);
		if(endPage>totalpage) {
			endPage=totalpage;
		}
		List<PetVO> list=dao.petListData(map);
		model.addAttribute("list",list);
		model.addAttribute("curpage",curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("BLOCK", BLOCK);
		
		System.out.println("반려동물 게시판 리스트 출력");
		return "pet/list";
	}
	
	
	// 쿠키 저장 
	@RequestMapping("pet/detail_before.do")
	public String pet_detail_before(HttpServletRequest request, HttpServletResponse response) {
		String no = "";
	try {
		
		
		System.out.println("쿠키생성 모델");
		
		// 글번호 no와 세션의 id 출력
		no = request.getParameter("no");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		// 쿠키 생성 
		Cookie cookie = new Cookie(id+"pet" + no, no);				// 쿠키의 키는 (세션아이디 + 글번호)  값은 글번호
		cookie.setMaxAge(60);
		cookie.setPath("/");
		response.addCookie(cookie);
		System.out.println("쿠키이름 : " + cookie.getName() + "값 : " + cookie.getValue());
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	return "redirect:../pet/detail.do?no=" + no;		// 글번호에 해당하는 detail.do로 리다이렉트
}
	
	
	
	// 반려동물 Detail
	@RequestMapping("pet/detail.do")
	public String pet_detail(Model model, String no, HttpSession session, HttpServletRequest request){
		
		try {
			
			PetVO pet_vo = dao.petDetailData(Integer.parseInt(no));
			
			dao.petHitIncrement(Integer.parseInt(no));
			
			List<Pet_replyVO> reply_list = dao.pet_listReply(Integer.parseInt(no));
			
			if(session.getAttribute("id") != null){
			
				// 스크랩 버튼 활성화 여부
				session=request.getSession();
				String id=(String)session.getAttribute("id");
				Pet_scrapVO svo=new Pet_scrapVO();
				svo.setId(id);
				svo.setMno(Integer.parseInt(no));
				int count=dao.scrapCount(svo);
				
				model.addAttribute("count", count);
				
				
				// 쿠키 ---------------------------------------------------------------------------------------------------
				session=request.getSession();
				
				// 쿠키 읽기
				Cookie[] cookies=request.getCookies();							// 쿠키 배열 생성
				List<PetVO> cookie_list=new ArrayList<PetVO>();					// 쿠키를 담을 리스트 생성
				if(cookies!=null)												// 쿠키가 비어있지 않으면
				{
					for(int i=cookies.length-1;i>=0;i--)						// (쿠키길이 - 1)부터 0까지 i를 1씩 감소 (그래야 최신 쿠키가 맨앞에 옴)
					{
						if(cookies[i].getName().startsWith(id + "pet"))							// 쿠키배열의 이름이 id를 시작하면
						{
							String cookie_no=cookies[i].getValue();								// 변수 no에 쿠키값 넣기
							PetVO vo = dao.petDetailData(Integer.parseInt(cookie_no));		// vo에 상세보기를 담아서
							cookie_list.add(vo);													// 쿠키배열에 vo 담기
						}
					}
				}
				model.addAttribute("cookie_list", cookie_list);										// 쿠키값이 담긴 리스트를 전송
			}
			
			
			// 워드클라우드 -----------------------------------------------------------------------------------------
			//nm.naverData(pet_vo.getSubject());
			
			//rm_diary.graph(Integer.parseInt(no));
			
			
			
			
			
			model.addAttribute("pet_vo", pet_vo);
			model.addAttribute("reply_list", reply_list);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "pet/detail";
	}
	
	
	// 반려동물 insert
		@RequestMapping("pet/insert.do")
		public String pet_insert(HttpSession session, HttpServletRequest request){
			
			// 쿠키 ---------------------------------------------------------------------------------------------------
			session=request.getSession();
			String id=(String)session.getAttribute("id");
			// 쿠키 읽기
			Cookie[] cookies=request.getCookies();							// 쿠키 배열 생성
			List<PetVO> cookie_list=new ArrayList<PetVO>();					// 쿠키를 담을 리스트 생성
			if(cookies!=null)												// 쿠키가 비어있지 않으면
			{
				for(int i=cookies.length-1;i>=0;i--)						// (쿠키길이 - 1)부터 0까지 i를 1씩 감소 (그래야 최신 쿠키가 맨앞에 옴)
				{
					if(cookies[i].getName().startsWith(id + "pet"))							// 쿠키배열의 이름이 id를 시작하면
					{
						String cookie_no=cookies[i].getValue();								// 변수 no에 쿠키값 넣기
						PetVO vo = dao.petDetailData(Integer.parseInt(cookie_no));		// vo에 상세보기를 담아서
						cookie_list.add(vo);													// 쿠키배열에 vo 담기
					}
				}
			}
			
			return "pet/insert";
		}
		
		
		
		// 반려동물 Insert_ok.do
		@RequestMapping("pet/insert_ok.do")
		public String pet_insert_ok(String subject, String content, HttpSession session, MultipartFile file){
			
			try {
				System.out.println("반려동물 자랑하기 작성 수행 컨트롤러");
				System.out.println("content : " + content);
				System.out.println("subject : " + subject);
				
				
				String id = (String)session.getAttribute("id");
				System.out.println("id : " + id);
				
				PetVO vo = new PetVO();
				vo.setContent(content);
				vo.setSubject(subject);
				vo.setId(id);
				
				/*
				String uploadPath = "C:/springDev/springStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/3rdTeamProject/resources";
				
				String imgUploadPath = uploadPath + File.separator;
				String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
				String fileName = null;

				if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
					  // 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
					  
					  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

					  // gdsImg에 원본 파일 경로 + 파일명 저장
					  vo.setPoster("..\\resources" + ymdPath + File.separator + fileName);
					  // gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
					  vo.setThumbnail("..\\resources" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
					  
					 } else {  // 첨부된 파일이 없으면
					  fileName = File.separator + File.separator + "none.png";
					  // 미리 준비된 none.png파일을 대신 출력함

					 }*/
				dao.petInsert(vo);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			
			
			
			return "redirect:../pet/list.do";
		}
		
		
		
		
		
		// 반려동물 delete.do
		@RequestMapping("pet/delete.do")
		public String petDelete(String no){
			
			dao.petDelete(Integer.parseInt(no));
			
			return "redirect:../pet/list.do";
		}
		
		
		
		
		
		// 반려동물 자랑하기 update.do
		@RequestMapping("pet/update.do")
		public String petUpdate(String no, Model model){
			
			PetVO pet_vo = dao.petDetailData(Integer.parseInt(no));
			
			model.addAttribute("pet_vo", pet_vo);
			
			return "pet/update";
		}
		
		// 반려동물 자랑하기 update_ok.do
		@RequestMapping("pet/update_ok.do")
		public String petUpdate_ok(String no, String content, String subject){
			
			Map map = new HashMap();
			map.put("no", no);
			map.put("content", content);
			map.put("subject", subject);
			
			dao.petUpdate(map);
			
			System.out.println("반려동물 자랑하기 수정 OK");
			
			return "redirect:../pet/detail.do?no=" + no;
		}
		
		
		
		
		
		// Reply
		@RequestMapping("pet/insert_reply.do")
		public String pet_insertReply(String pet_no, String content, HttpSession session){
			
			try {
				Pet_replyVO vo = new Pet_replyVO();
				String id = (String)session.getAttribute("id");
				vo.setId(id);
				vo.setPet_no(Integer.parseInt(pet_no));
				vo.setContent(content);
				
				dao.pet_replyIncrement(Integer.parseInt(pet_no));
				
				System.out.println("id : " + id);
				System.out.println("pet_no : " + pet_no);
				System.out.println("content : " + content);
				
				dao.pet_insertReply(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			return "redirect:../pet/detail.do?no=" + pet_no;
		}
		
		
		// Reply Reply
		@RequestMapping("pet/insert_replyReply.do")
		public String pet_insertReplyReply(String parent_no, String pet_no, String content, HttpSession session){
			
			try {
				// 부모댓글번호 받기
				// 게시글번호 받기
				// 댓글내용 받기
				String id = (String)session.getAttribute("id");
				
				Pet_replyVO vo = new Pet_replyVO();
				vo.setPet_no(Integer.parseInt(pet_no));
				vo.setContent(content);
				vo.setId(id);
				
				dao.pet_replyReplyInsert(Integer.parseInt(parent_no), vo);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			return "redirect:../pet/detail.do?no=" + pet_no;
		}
		
		
		
		
		// Reply update
		@RequestMapping("pet/updateReply.do")
		public String pet_updateReply(String pet_no, String no, String content){
			try {
				Pet_replyVO vo = new Pet_replyVO();
				vo.setContent(content);
				vo.setNo(Integer.parseInt(no));
				dao.pet_updateReply(vo);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			return "redirect:../pet/detail.do?no=" + pet_no;
		}
		
		
		
		// Reply delete
		@RequestMapping("pet/deleteReply.do")
		public String pet_deleteReply(String no, String pet_no){
			try {
				System.out.println("no : " + no);
				System.out.println("pet_no : " + pet_no);
				dao.pet_deleteReply(Integer.parseInt(no));
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			return "redirect:../pet/detail.do?no=" + pet_no;
		}
		
	
		/*// 반려동물 사진 업로드 (멀티) 
		@RequestMapping("file_uploader_html5.do")
		public void pet_file_uploader_html5(HttpServletRequest request, HttpServletResponse response){
			try { 
				//파일정보 
				String sFileInfo = ""; 
				//파일명을 받는다 - 일반 원본파일명 
				String filename = request.getHeader("file-name"); 
				//파일 확장자 
				String filename_ext = filename.substring(filename.lastIndexOf(".")+1); 
				//확장자를소문자로 변경 
				filename_ext = filename_ext.toLowerCase(); 
				//이미지 검증 배열변수 
				String[] allow_file = {"jpg","png","bmp","gif"}; 
				//돌리면서 확장자가 이미지인지 
				int cnt = 0; 
				for(int i=0; i<allow_file.length; i++) { 
					if(filename_ext.equals(allow_file[i])){
						cnt++; 
					} 
				} 
				//이미지가 아님 
				if(cnt == 0) { 
					PrintWriter print = response.getWriter(); 
					print.print("NOTALLOW_"+filename); 
					print.flush(); 
					print.close(); 
				} 
				else { 
					//이미지이므로 신규 파일로 디렉토리 설정 및 업로드 
					//파일 기본경로 
					String dftFilePath = request.getSession().getServletContext().getRealPath("/"); 
					//파일 기본경로 _ 상세경로 
					String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator +"multiupload" + File.separator; 
					File file = new File(filePath); 
					if(!file.exists()) { 
						file.mkdirs(); 
					} 
					String realFileNm = ""; 
					SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss"); 
					String today= formatter.format(new java.util.Date()); 
					realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf(".")); 
					String rlFileNm = filePath + realFileNm; 
					
					///////////////// 서버에 파일쓰기 ///////////////// 
					InputStream is = request.getInputStream(); 
					OutputStream os=new FileOutputStream(rlFileNm); 
					int numRead; 
					byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))]; 
					while((numRead = is.read(b,0,b.length)) != -1){
						os.write(b,0,numRead); 
					} 
					if(is != null) {
						is.close(); 
					} 
					os.flush(); 
					os.close(); 
					
					///////////////// 서버에 파일쓰기 ///////////////// 
					// 정보 출력 
					sFileInfo += "&bNewLine=true"; 
					// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함 
					sFileInfo += "&sFileName="+ filename;; 
					sFileInfo += "&sFileURL="+"/resources/editor/multiupload/"+realFileNm; 
					PrintWriter print = response.getWriter(); 
					print.print(sFileInfo); 
					print.flush(); print.close(); 
					} 
				} catch (Exception e) {
					e.printStackTrace(); 
				}
		}*/
	}	