package com.sist.dao;

import java.util.*;
public class Test {

	public static void main(String[] args) {
		Main_totalsearchDAO dao = new Main_totalsearchDAO();
		String fd = "몽";
		
		List<TourVO> list = dao.totalseacrh_tour(fd);
		
		for(TourVO vo : list){
			System.out.println(vo.getTitle());
		}

	}

}
