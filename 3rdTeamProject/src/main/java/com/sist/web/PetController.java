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
	
	
	// �ݷ����� �ڶ��ϱ� List
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
		
		System.out.println("�ݷ����� �Խ��� ����Ʈ ���");
		return "pet/list";
	}
	
	
	// ��Ű ���� 
	@RequestMapping("pet/detail_before.do")
	public String pet_detail_before(HttpServletRequest request, HttpServletResponse response) {
		String no = "";
	try {
		
		
		System.out.println("��Ű���� ��");
		
		// �۹�ȣ no�� ������ id ���
		no = request.getParameter("no");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		// ��Ű ���� 
		Cookie cookie = new Cookie(id+"pet" + no, no);				// ��Ű�� Ű�� (���Ǿ��̵� + �۹�ȣ)  ���� �۹�ȣ
		cookie.setMaxAge(60);
		cookie.setPath("/");
		response.addCookie(cookie);
		System.out.println("��Ű�̸� : " + cookie.getName() + "�� : " + cookie.getValue());
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	return "redirect:../pet/detail.do?no=" + no;		// �۹�ȣ�� �ش��ϴ� detail.do�� �����̷�Ʈ
}
	
	
	
	// �ݷ����� Detail
	@RequestMapping("pet/detail.do")
	public String pet_detail(Model model, String no, HttpSession session, HttpServletRequest request){
		
		try {
			
			PetVO pet_vo = dao.petDetailData(Integer.parseInt(no));
			
			dao.petHitIncrement(Integer.parseInt(no));
			
			List<Pet_replyVO> reply_list = dao.pet_listReply(Integer.parseInt(no));
			
			if(session.getAttribute("id") != null){
			
				// ��ũ�� ��ư Ȱ��ȭ ����
				session=request.getSession();
				String id=(String)session.getAttribute("id");
				Pet_scrapVO svo=new Pet_scrapVO();
				svo.setId(id);
				svo.setMno(Integer.parseInt(no));
				int count=dao.scrapCount(svo);
				
				model.addAttribute("count", count);
				
				
				// ��Ű ---------------------------------------------------------------------------------------------------
				session=request.getSession();
				
				// ��Ű �б�
				Cookie[] cookies=request.getCookies();							// ��Ű �迭 ����
				List<PetVO> cookie_list=new ArrayList<PetVO>();					// ��Ű�� ���� ����Ʈ ����
				if(cookies!=null)												// ��Ű�� ������� ������
				{
					for(int i=cookies.length-1;i>=0;i--)						// (��Ű���� - 1)���� 0���� i�� 1�� ���� (�׷��� �ֽ� ��Ű�� �Ǿտ� ��)
					{
						if(cookies[i].getName().startsWith(id + "pet"))							// ��Ű�迭�� �̸��� id�� �����ϸ�
						{
							String cookie_no=cookies[i].getValue();								// ���� no�� ��Ű�� �ֱ�
							PetVO vo = dao.petDetailData(Integer.parseInt(cookie_no));		// vo�� �󼼺��⸦ ��Ƽ�
							cookie_list.add(vo);													// ��Ű�迭�� vo ���
						}
					}
				}
				model.addAttribute("cookie_list", cookie_list);										// ��Ű���� ��� ����Ʈ�� ����
			}
			
			
			// ����Ŭ���� -----------------------------------------------------------------------------------------
			//nm.naverData(pet_vo.getSubject());
			
			//rm_diary.graph(Integer.parseInt(no));
			
			
			
			
			
			model.addAttribute("pet_vo", pet_vo);
			model.addAttribute("reply_list", reply_list);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "pet/detail";
	}
	
	
	// �ݷ����� insert
		@RequestMapping("pet/insert.do")
		public String pet_insert(HttpSession session, HttpServletRequest request){
			
			// ��Ű ---------------------------------------------------------------------------------------------------
			session=request.getSession();
			String id=(String)session.getAttribute("id");
			// ��Ű �б�
			Cookie[] cookies=request.getCookies();							// ��Ű �迭 ����
			List<PetVO> cookie_list=new ArrayList<PetVO>();					// ��Ű�� ���� ����Ʈ ����
			if(cookies!=null)												// ��Ű�� ������� ������
			{
				for(int i=cookies.length-1;i>=0;i--)						// (��Ű���� - 1)���� 0���� i�� 1�� ���� (�׷��� �ֽ� ��Ű�� �Ǿտ� ��)
				{
					if(cookies[i].getName().startsWith(id + "pet"))							// ��Ű�迭�� �̸��� id�� �����ϸ�
					{
						String cookie_no=cookies[i].getValue();								// ���� no�� ��Ű�� �ֱ�
						PetVO vo = dao.petDetailData(Integer.parseInt(cookie_no));		// vo�� �󼼺��⸦ ��Ƽ�
						cookie_list.add(vo);													// ��Ű�迭�� vo ���
					}
				}
			}
			
			return "pet/insert";
		}
		
		
		
		// �ݷ����� Insert_ok.do
		@RequestMapping("pet/insert_ok.do")
		public String pet_insert_ok(String subject, String content, HttpSession session, MultipartFile file){
			
			try {
				System.out.println("�ݷ����� �ڶ��ϱ� �ۼ� ���� ��Ʈ�ѷ�");
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
					  // ���� ��ǲ�ڽ��� ÷�ε� ������ ���ٸ�(=÷�ε� ������ �̸��� ���ٸ�)
					  
					  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

					  // gdsImg�� ���� ���� ��� + ���ϸ� ����
					  vo.setPoster("..\\resources" + ymdPath + File.separator + fileName);
					  // gdsThumbImg�� ����� ���� ��� + ����� ���ϸ� ����
					  vo.setThumbnail("..\\resources" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
					  
					 } else {  // ÷�ε� ������ ������
					  fileName = File.separator + File.separator + "none.png";
					  // �̸� �غ�� none.png������ ��� �����

					 }*/
				dao.petInsert(vo);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			
			
			
			return "redirect:../pet/list.do";
		}
		
		
		
		
		
		// �ݷ����� delete.do
		@RequestMapping("pet/delete.do")
		public String petDelete(String no){
			
			dao.petDelete(Integer.parseInt(no));
			
			return "redirect:../pet/list.do";
		}
		
		
		
		
		
		// �ݷ����� �ڶ��ϱ� update.do
		@RequestMapping("pet/update.do")
		public String petUpdate(String no, Model model){
			
			PetVO pet_vo = dao.petDetailData(Integer.parseInt(no));
			
			model.addAttribute("pet_vo", pet_vo);
			
			return "pet/update";
		}
		
		// �ݷ����� �ڶ��ϱ� update_ok.do
		@RequestMapping("pet/update_ok.do")
		public String petUpdate_ok(String no, String content, String subject){
			
			Map map = new HashMap();
			map.put("no", no);
			map.put("content", content);
			map.put("subject", subject);
			
			dao.petUpdate(map);
			
			System.out.println("�ݷ����� �ڶ��ϱ� ���� OK");
			
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
				// �θ��۹�ȣ �ޱ�
				// �Խñ۹�ȣ �ޱ�
				// ��۳��� �ޱ�
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
		
	
		/*// �ݷ����� ���� ���ε� (��Ƽ) 
		@RequestMapping("file_uploader_html5.do")
		public void pet_file_uploader_html5(HttpServletRequest request, HttpServletResponse response){
			try { 
				//�������� 
				String sFileInfo = ""; 
				//���ϸ��� �޴´� - �Ϲ� �������ϸ� 
				String filename = request.getHeader("file-name"); 
				//���� Ȯ���� 
				String filename_ext = filename.substring(filename.lastIndexOf(".")+1); 
				//Ȯ���ڸ��ҹ��ڷ� ���� 
				filename_ext = filename_ext.toLowerCase(); 
				//�̹��� ���� �迭���� 
				String[] allow_file = {"jpg","png","bmp","gif"}; 
				//�����鼭 Ȯ���ڰ� �̹������� 
				int cnt = 0; 
				for(int i=0; i<allow_file.length; i++) { 
					if(filename_ext.equals(allow_file[i])){
						cnt++; 
					} 
				} 
				//�̹����� �ƴ� 
				if(cnt == 0) { 
					PrintWriter print = response.getWriter(); 
					print.print("NOTALLOW_"+filename); 
					print.flush(); 
					print.close(); 
				} 
				else { 
					//�̹����̹Ƿ� �ű� ���Ϸ� ���丮 ���� �� ���ε� 
					//���� �⺻��� 
					String dftFilePath = request.getSession().getServletContext().getRealPath("/"); 
					//���� �⺻��� _ �󼼰�� 
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
					
					///////////////// ������ ���Ͼ��� ///////////////// 
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
					
					///////////////// ������ ���Ͼ��� ///////////////// 
					// ���� ��� 
					sFileInfo += "&bNewLine=true"; 
					// img �±��� title �Ӽ��� �������ϸ����� ��������ֱ� ���� 
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