package com.sist.dao;

import java.util.*;
/*
 * NO          NUMBER         
DIARY_NO    NUMBER         
ID          VARCHAR2(100)  
REGDATE     DATE           
MSG         VARCHAR2(100)  
GI          NUMBER         
GS          NUMBER         
GT          NUMBER         
ROOT        NUMBER         
CONTENT     VARCHAR2(2000) 
 */
public class Diary_replyVO {
	private int no;
	private int diary_no;
	private String id;
	private Date regdate;
	private String content;
	private int gi;
	private int gs;
	private int gt;
	private int root;
	private String msg;
	private int depth;
	
	
	
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getDiary_no() {
		return diary_no;
	}
	public void setDiary_no(int diary_no) {
		this.diary_no = diary_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getGi() {
		return gi;
	}
	public void setGi(int gi) {
		this.gi = gi;
	}
	public int getGs() {
		return gs;
	}
	public void setGs(int gs) {
		this.gs = gs;
	}
	public int getGt() {
		return gt;
	}
	public void setGt(int gt) {
		this.gt = gt;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}
