package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.DiaryDAO;
import com.sist.dao.DiaryVO;
import com.sist.dao.Diary_replyVO;
import com.sist.dao.Diary_scrapVO;
import com.sist.service.NaverManager;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class DiaryContoller {
	
	
	@Autowired
	private DiaryDAO dao;
	
	@Autowired
	private NaverManager nm;
	
	@Autowired
	private RManager_diary rm_diary;
	
	
	// 여행기 리스트 ==================================================================================================================================================
	@RequestMapping("diary/list.do")
	public String diary_list(Model model, String page, HttpSession session, HttpServletRequest request){
		try {
			if (page == null){
				page = "1";
			}
			int currpage = Integer.parseInt(page);						// 현재 페이지
			int totalpage = dao.diaryTotalPage();	// 총 페이지
			int rowSize = 8;											// 한번에 출력될 게시글
			int start = (rowSize*currpage) - (rowSize - 1);				
			int end = (rowSize*currpage);
			int block = 5;												// 페이지 블록
			int startpage=((currpage-1)/block*block)+1;					
			int endpage=((currpage-1)/block*block)+block;
			if(endpage>totalpage) {
				endpage=totalpage;
			}
			
			// 해쉬맵에 시작 / 끝 변수 담기 ------------------------------------------------------
			Map map = new HashMap();
			map.put("start", start);
			map.put("end", end);
			
			
			List<DiaryVO> list = dao.diaryList(map);			// DAO의 메소드 리턴값을 받는 List 변수
			
			// 쿠키 ---------------------------------------------------------------------------------------------------
//			session=request.getSession();
//			String id=(String)session.getAttribute("id");
//			// 쿠키 읽기
//			Cookie[] cookies=request.getCookies();							// 쿠키 배열 생성
//			List<DiaryVO> cList=new ArrayList<DiaryVO>();					// 쿠키를 담을 리스트 생성
//			if(cookies!=null)												// 쿠키가 비어있지 않으면
//			{
//				for(int i=cookies.length-1;i>=0;i--)						// (쿠키길이 - 1)부터 0까지 i를 1씩 감소 (그래야 최신 쿠키가 맨앞에 옴)
//				{
//					if(cookies[i].getName().startsWith(id))							// 쿠키배열의 이름이 id를 시작하면
//					{
//						String no=cookies[i].getValue();								// 변수 no에 쿠키값 넣기
//						DiaryVO vo=DiaryVO.jobknowledgeDetail(Integer.parseInt(no));		// vo에 상세보기를 담아서
//						cList.add(vo);													// 쿠키배열에 vo 담기
//					}
//				}
//			}
//			request.setAttribute("cList", cList);										// 쿠키값이 담긴 리스트를 전송
			
			// 페이지로 보낼 파라미터들 -----------------------------------------------------------
			model.addAttribute("list", list);
			model.addAttribute("block", block);
			model.addAttribute("currpage", currpage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("startpage", startpage);
			model.addAttribute("endpage", endpage);
			
			System.out.println("여행기 목록 컨트롤러");
			System.out.println(request.getRealPath(""));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "diary/list";
	}
	
	
	
	
	
	// 상세보기 전에 쿠키 생성하기
	@RequestMapping("diary/detail_before.do")
	public String diary_detail_before(HttpServletRequest request, HttpServletResponse response) {
			String no = "";
		try {
			
			
			System.out.println("쿠키생성 모델");
			
			// 글번호 no와 세션의 id 가져오기-----------------------------
			
			no = request.getParameter("no");
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			
			// 쿠키 생성 ----------------------------------------------
			Cookie cookie = new Cookie(id+"diary" + no, no);				// 쿠키의 키는 (세션아이디 + 글번호)  값은 글번호
			cookie.setMaxAge(60);
			cookie.setPath("/");
			response.addCookie(cookie);
			System.out.println("쿠키이름 : " + cookie.getName() + "값 : " + cookie.getValue());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return "redirect:../diary/detail.do?no=" + no;		// 글번호에 해당하는 detail.do로 리다이렉트
	}
	
	
	
	
	
	
	
	// 상세보기 ====================================================================================================================================================
	@RequestMapping("diary/detail.do")
	public String diary_detail(Model model, String no, HttpSession session, HttpServletRequest request){
		
		try {
//			request.setCharacterEncoding("utf-8");
//			System.out.println("게시글 상세페이지");
			
			DiaryVO diary_vo = dao.diaryDetail(Integer.parseInt(no));				// DAO의 상세보기 메소드 리턴값을 vo에 담기 
			
			dao.diartyHit(Integer.parseInt(no));
			
			List<Diary_replyVO> reply_list = dao.diary_listReply(Integer.parseInt(no));
			
//			List<JobKnowledgeVO> list = JobKnowledgeDAO.jobknowledgeDetailReply(Integer.parseInt(no));	// list에 답변글들을 담기
			
			if(session.getAttribute("id") != null){
				
			
				// 스크랩 버튼 활성화 여부 -------------------------------------
				session=request.getSession();
				String id=(String)session.getAttribute("id");
				Diary_scrapVO svo=new Diary_scrapVO();
				svo.setId(id);
				svo.setMno(Integer.parseInt(no));
				int count=dao.scrapCount(svo);
				
				model.addAttribute("count", count);
				
				
				// 쿠키 ---------------------------------------------------------------------------------------------------
				session=request.getSession();
	//			String id=(String)session.getAttribute("id");
				// 쿠키 읽기
				Cookie[] cookies=request.getCookies();							// 쿠키 배열 생성
				List<DiaryVO> cookie_list=new ArrayList<DiaryVO>();					// 쿠키를 담을 리스트 생성
				if(cookies!=null)												// 쿠키가 비어있지 않으면
				{
					for(int i=cookies.length-1;i>=0;i--)						// (쿠키길이 - 1)부터 0까지 i를 1씩 감소 (그래야 최신 쿠키가 맨앞에 옴)
					{
						if(cookies[i].getName().startsWith(id + "diary"))							// 쿠키배열의 이름이 id를 시작하면
						{
							String cookie_no=cookies[i].getValue();								// 변수 no에 쿠키값 넣기
							DiaryVO vo = dao.diaryDetail(Integer.parseInt(cookie_no));		// vo에 상세보기를 담아서
							cookie_list.add(vo);													// 쿠키배열에 vo 담기
						}
					}
				}
				model.addAttribute("cookie_list", cookie_list);										// 쿠키값이 담긴 리스트를 전송
			}
			
			
			// 워드클라우드 -----------------------------------------------------------------------------------------
			nm.naverData(diary_vo.getSubject());
			
			rm_diary.graph(Integer.parseInt(no));
			
			
			
			
			
			model.addAttribute("diary_vo", diary_vo);
			model.addAttribute("reply_list", reply_list);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "diary/detail";
	}
	
	
	
	
	
	
	
	// 여행기 작성 페이지만 출력 ===========================================================================================================================================================
	@RequestMapping("diary/insert.do")
	public String diary_insert(HttpSession session, HttpServletRequest request){
		
		// 쿠키 ---------------------------------------------------------------------------------------------------
		session=request.getSession();
		String id=(String)session.getAttribute("id");
		// 쿠키 읽기
		Cookie[] cookies=request.getCookies();							// 쿠키 배열 생성
		List<DiaryVO> cookie_list=new ArrayList<DiaryVO>();					// 쿠키를 담을 리스트 생성
		if(cookies!=null)												// 쿠키가 비어있지 않으면
		{
			for(int i=cookies.length-1;i>=0;i--)						// (쿠키길이 - 1)부터 0까지 i를 1씩 감소 (그래야 최신 쿠키가 맨앞에 옴)
			{
				if(cookies[i].getName().startsWith(id + "diary"))							// 쿠키배열의 이름이 id를 시작하면
				{
					String cookie_no=cookies[i].getValue();								// 변수 no에 쿠키값 넣기
					DiaryVO vo = dao.diaryDetail(Integer.parseInt(cookie_no));		// vo에 상세보기를 담아서
					cookie_list.add(vo);													// 쿠키배열에 vo 담기
				}
			}
		}
		
		return "diary/insert";
	}
	
	// 여행기 작성 수행 ===========================================================================================================================================================
	@RequestMapping("diary/insert_ok.do")
	public String diary_insert_ok(String subject, String content, HttpSession session){
		
		try {
			System.out.println("여행기 작성 수행 컨트롤러");
			System.out.println("content : " + content);
			System.out.println("subject : " + subject);
			
			
			String id = (String)session.getAttribute("id");
			System.out.println("id : " + id);
			
			DiaryVO vo = new DiaryVO();
			vo.setContent(content);
			vo.setSubject(subject);
			vo.setId(id);
			dao.diaryInsert(vo);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		
		
		return "redirect:../diary/list.do";
	}
	
	
	
	
	
	// 여행기 삭제 ===========================================================================================================================================================
	@RequestMapping("diary/delete.do")
	public String diaryDelete(String no){
		
		dao.diaryDelete(Integer.parseInt(no));
		
		return "redirect:../diary/list.do";
	}
	
	
	
	
	
	// 여행기 수정 전 내용 가져오기 ==============================================================================================================================================
	@RequestMapping("diary/update.do")
	public String diaryUpdate(String no, Model model){
		
		DiaryVO diary_vo = dao.diaryDetail(Integer.parseInt(no));
		
		model.addAttribute("diary_vo", diary_vo);
		
		return "diary/update";
	}
	
	// 여행기 수정 수행 =====================================================================================================================================================
	@RequestMapping("diary/update_ok.do")
	public String diaryUpdate_ok(String no, String content, String subject){
		
		Map map = new HashMap();
		map.put("no", no);
		map.put("content", content);
		map.put("subject", subject);
		
		dao.diaryUpdate(map);
		
		System.out.println("여행기 수정 OK");
		
		return "redirect:../diary/detail.do?no=" + no;
	}
	
	
	
	
	
	// 댓글 달기 =====================================================================================================================================================
	@RequestMapping("diary/insert_reply.do")
	public String diary_insertReply(String diary_no, String content, HttpSession session){
		
		try {
			Diary_replyVO vo = new Diary_replyVO();
			String id = (String)session.getAttribute("id");
			vo.setId(id);
			vo.setDiary_no(Integer.parseInt(diary_no));
			vo.setContent(content);
			
			dao.diary_replyIncrement(Integer.parseInt(diary_no));
			
			System.out.println("id : " + id);
			System.out.println("diaty_no : " + diary_no);
			System.out.println("content : " + content);
			
			dao.diary_insertReply(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:../diary/detail.do?no=" + diary_no;
	}
	
	
	// 대댓글 달기 =====================================================================================================================================================
	@RequestMapping("diary/insert_replyReply.do")
	public String diary_insertReplyReply(String parent_no, String diary_no, String content, HttpSession session){
		
		try {
			// 부모댓글번호 받기
			// 게시글번호 받기
			// 댓글내용 받기
			String id = (String)session.getAttribute("id");
			
			Diary_replyVO vo = new Diary_replyVO();
			vo.setDiary_no(Integer.parseInt(diary_no));
			vo.setContent(content);
			vo.setId(id);
			
			dao.diary_replyReplyInsert(Integer.parseInt(parent_no), vo);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "redirect:../diary/detail.do?no=" + diary_no;
	}
	
	
	
	
	// 댓글 수정 =====================================================================================================================================================
	@RequestMapping("diary/updateReply.do")
	public String diary_updateReply(String diary_no, String no, String content){
		try {
			Diary_replyVO vo = new Diary_replyVO();
			vo.setContent(content);
			vo.setNo(Integer.parseInt(no));
			dao.diary_updateReply(vo);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "redirect:../diary/detail.do?no=" + diary_no;
	}
	
	
	
	// 댓글 삭제 =====================================================================================================================================================
	@RequestMapping("diary/deleteReply.do")
	public String diary_deleteReply(String no, String diary_no){
		try {
			System.out.println("no : " + no);
			System.out.println("diary_no : " + diary_no);
			dao.diary_deleteReply(Integer.parseInt(no));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "redirect:../diary/detail.do?no=" + diary_no;
	}
	
	
	
	
	
	
	
	// 스크랩하기 ==============================================================================================================
	@RequestMapping("diary/scrap.do")
	public String diary_scrap(String no, HttpSession session)
	{
		System.out.println("스크랩하기");
		String id=(String)session.getAttribute("id");
		Diary_scrapVO vo=new Diary_scrapVO();
		vo.setId(id);
		vo.setMno(Integer.parseInt(no));
		dao.scrapInsert(vo);
		return "redirect:../diary/detail.do?no="+no;
	}
	
	
	
	// 스크랩 취소 ==============================================================================================================
	@RequestMapping("diary/scrap_cancel.do")
	public String diary_scrap_cancel(String no)
	{
		dao.scrapDelete(Integer.parseInt(no));
		return "redirect:../member/mypage.do";
	}
	
	
	
	// 스크랩목록 가져오기 ==========================================================================================================
	@RequestMapping("diary/scrap_list.do")
	public String diary_scrapList(HttpServletRequest request, HttpSession session, Model model)
	{
		session=request.getSession();					// 세션 생성
		String id=(String)session.getAttribute("id");				// id를 세션id로 
		
		  
		List<Diary_scrapVO> scrap_List=dao.scrapListData(id);				// 찜 리스트 가져오기
		List<DiaryVO> boardList=new ArrayList<DiaryVO>();						// boardList(게시글VO 리스트 객체) 생성
		for(Diary_scrapVO scrap_vo : scrap_List) {											// 스크랩리스트 전부 for문 돌리기
		DiaryVO board_vo=dao.diaryDetail(scrap_vo.getMno());				// board_vo(게시글 VO 객체)에 detail 메소드 넣기 (파라미터는 스크랩VO의 mno컬럼(글번호))
//			String story=mvo.getStory();								
//		board_vo.setScrap_no(scrap_vo.getNo());														// board_vo(게시글VO)의 scrap_no(찜번호 컬럼)에 scrap_vo의 번호(no) 넣기
//			if(story.length()>150) {
//			  
//			story=story.substring(0,150)+"...";
//			mvo.setStory(story);
//			}
		boardList.add(board_vo);											// 게시글VO리스트에 게시글VO객체 넣기
		}
		model.addAttribute("boardList", boardList);							// 게시글VO리스트를 전송
		
		System.out.println("스크랩목록 가져오기");
		
		
		return "scrap_list";
		
//		request.setAttribute("mypage_jsp", "../jobKnowledge/scrapList2.jsp");
//	    return "../mypage/mymain.jsp";
//			  request.setAttribute("jobKnowledge_jsp", "../jobKnowledge/scrapList2.jsp");
		
//			return "../jobKnowledge/box.jsp";
	}
	
}
