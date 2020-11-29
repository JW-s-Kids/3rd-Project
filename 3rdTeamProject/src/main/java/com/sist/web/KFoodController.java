package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.dao.*;
//import com.sist.naver.NaverManager;
@Controller
@RequestMapping("kfood/")
// 6FQw_o8z3yxlzPREeUJr
// wsJ4F6HtPN
public class KFoodController {
   @Autowired
   private KFoodDAO kfdao;
//   @Autowired
//   private ReplyDAO rdao;
//   @Autowired
//   private NaverManager nm;
//   @Autowired
//   private RManager rm;
//________________음식점 리스트 ___________________
   @RequestMapping("list.do")
   public String kfood_list(Model model)
   {
	   List<KFoodVO> list=kfdao.kfoodAllData();
	   model.addAttribute("list", list);
	   return "kfood/list";
   }
//   @RequestMapping("kfood_category.do")
//   public String kfood_category(int kf_no,Model model)
//   {
//	   List<KFoodVO> list=kfdao.kfoodCategoryListData(kf_no);
//	   for(KFoodVO vo:list)
//	   {
//		   String s=vo.getKf_poster();
		   //s=s.substring(0,s.indexOf("^"));
		   //vo.setPosterOne(s);
		   
//		   String ss=vo.getKf_addr1();
//		   StringTokenizer st=new StringTokenizer(ss,"지");
//		   vo.setKf_addr1(st.nextToken());
		 //  String sss=st.nextToken();
		 //  sss=sss.substring(2);
		 //  vo.setAddr2(sss);
//	   }
//	   KFoodVO vo=kfdao.kfoodCategoryInfoData(kf_no);
//	   model.addAttribute("list", list);
//	   model.addAttribute("vo", vo);
//	   return "kfood/category";
//  }
   @RequestMapping("kfood_detail.do")
   public String kfood_detail(int kf_no,String page,Model model)
   {
	   //아직 안고침 임시 
	   KFoodVO vo=kfdao.kfoodListData(kf_no);
	   String s=vo.getKf_addr1();
	   StringTokenizer st=new StringTokenizer(s,"지");
	   vo.setKf_addr1(st.nextToken());
	  // vo.setAddr2("지"+st.nextToken());
	   
	   String type=vo.getKf_delemenu();
	   st=new StringTokenizer(type,"/");
	   String result="";
	   while(st.hasMoreTokens())
	   {
		   result+=st.nextToken().trim()+"|";
	   }
	   result=result.substring(0,result.lastIndexOf("|"));
//	   List<KFoodVO> list=kfdao.foodLikeRecipeData(result);
	   if(page==null)
		   page="1";
	   int curpage=Integer.parseInt(page);
//	   List<KFoodVO> rList=rdao.replyListData(no, curpage);
//	   nm.naverData(vo.getTitle());
	   //rm.graph(no);
//	   model.addAttribute("vo", vo);
//	   model.addAttribute("list", list);
//	   model.addAttribute("rList", rList);
	   return "kfood/kfood_detail";
   }
}
//   @RequestMapping("reply_insert.do")
//   public String reply_insert(int cno,String msg,HttpSession session)
//   {
//	   String id=(String)session.getAttribute("id");
//	   String name=(String)session.getAttribute("name");
//	   ReplyVO vo=new ReplyVO();
//	   vo.setCno(cno);
//	   vo.setMsg(msg);
//	   vo.setId(id);
//	   vo.setName(name);
//	   rdao.replyInsert(vo);
//	   return "redirect:../food/food_detail.do?no="+cno;
//   }
//   @RequestMapping("reply_delete.do")
//   public String reply_delete(int no,int cno)
//   {
//	   rdao.reply_delete(no);
//	   return "redirect:../food/food_detail.do?no="+cno;
//   }
//   @RequestMapping("reply_update.do")
//   public String reply_update(int no,int cno,String msg)
//   {
//	   rdao.reply_update(no, msg);
//	   return "redirect:../food/food_detail.do?no="+cno;
//   }
//}





