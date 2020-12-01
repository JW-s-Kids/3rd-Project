package com.sist.dao;

import java.util.*;

/*
 * no NUMBER,
    id VARCHAR2(50),
    subject VARCHAR2(1000),
    content CLOB,
    photo VARCHAR2(1000),
    regdate DATE    DEFAULT SYSDATE,
    hit NUMBER DEFAULT 0,
    reply NUMBER,
    tag VARCHAR2(100),
    good NUMBER,
    addr VARCHAR2(1000)
 */
public class DiaryVO {
	private int no;
	private String id;
	private String subject;
	private String content;
	private String photo;
	private Date regdate;
	private int hit;
	private int reply;
	private String tag;
	private int good;			// 좋아요
	private String addr;		// 다녀간 여행지 주소
	private Date visitdate;		// 여행지에 방문한 일자
	private String thumbnail;	// 썸네일
	
	
	
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public Date getVisitdate() {
		return visitdate;
	}
	public void setVisitdate(Date visitdate) {
		this.visitdate = visitdate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
	
	
}
