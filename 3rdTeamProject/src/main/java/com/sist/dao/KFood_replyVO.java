package com.sist.dao;

import java.util.Date;

public class KFood_replyVO {
	private int no;
	private int kfood_no;
	private String id;
	private Date regdate;
	private String content;
	private int gi;
	private int gs;
	private int gt;
	private int root;
	private String msg;
	private int depth;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getKfood_no() {
		return kfood_no;
	}
	public void setKfood_no(int kfood_no) {
		this.kfood_no = kfood_no;
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
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
}
