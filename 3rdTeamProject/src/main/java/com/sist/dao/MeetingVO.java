package com.sist.dao;
/*
MNO    NOT NULL NUMBER         
MNAME  NOT NULL VARCHAR2(200)  
MMSG   NOT NULL VARCHAR2(1000) 
MIMG   NOT NULL VARCHAR2(1000) 
MADDR  NOT NULL VARCHAR2(1000) 
MADDR2 NOT NULL VARCHAR2(1000) 
MADDR3 NOT NULL VARCHAR2(1000) 
MADDR4 NOT NULL VARCHAR2(1000) 
MINWON NOT NULL NUMBER         
MJOIN           NUMBER         
HIT             NUMBER   
 */
public class MeetingVO {
	private int mno; //모임번호
	private String mname; //모임제목
	private String mmsg; //모임소개글
	private String mimg; //모임이미지
	private String maddr; //시,군/구
	private String maddr2; //동 이름
	private String maddr3; //도로명 주소
	private String maddr4; //건물/상호명
	private int minwon; //참석 가능인원
	private int mjoin; //현재 참여인원
	private int hit; //조회수
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMmsg() {
		return mmsg;
	}
	public void setMmsg(String mmsg) {
		this.mmsg = mmsg;
	}
	public String getMimg() {
		return mimg;
	}
	public void setMimg(String mimg) {
		this.mimg = mimg;
	}
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public String getMaddr2() {
		return maddr2;
	}
	public void setMaddr2(String maddr2) {
		this.maddr2 = maddr2;
	}
	public String getMaddr3() {
		return maddr3;
	}
	public void setMaddr3(String maddr3) {
		this.maddr3 = maddr3;
	}
	public String getMaddr4() {
		return maddr4;
	}
	public void setMaddr4(String maddr4) {
		this.maddr4 = maddr4;
	}
	public int getMinwon() {
		return minwon;
	}
	public void setMinwon(int minwon) {
		this.minwon = minwon;
	}
	public int getMjoin() {
		return mjoin;
	}
	public void setMjoin(int mjoin) {
		this.mjoin = mjoin;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
}
