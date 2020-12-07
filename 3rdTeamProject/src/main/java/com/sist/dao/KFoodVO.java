package com.sist.dao;

public class KFoodVO {
/*	CREATE TABLE KFood(
			 KF_NO   NUMBER,                 --넘버
			KF_POSTER CLOB NOT NULL,            --사진
			KF_TITLE   VARCHAR2(1000) NOT NULL, --업체명 
			KF_TEL    VARCHAR2(500) NOT NULL,    --전화번호
			KF_ADDR1    VARCHAR2(500) NOT NULL, --주소
			KF_CONTENT   CLOB NOT NULL, --내용
			KF_PARK    VARCHAR2(80)   NOT NULL, --주차
			KF_TIME     VARCHAR2(500)  NOT NULL,  --영업시간
			KF_HOLIDAY  VARCHAR2(150)  NOT NULL, --휴일
			KF_DELEMENU VARCHAR2(70)  NOT NULL, --대표메뉴
			KF_TOGO     VARCHAR2(50)   NOT NULL, --포장
			KF_RESERVE  VARCHAR2(80)   NOT NULL, --예약
			KF_HIT     VARCHAR2(1000)   NOT NULL,
			KF_SCORE   VARCHAR2(30)   NOT NULL
			);
			*/
	private int kf_no;
	private String kf_poster,
					kf_title,
					kf_tel,	
					kf_addr1,
					kf_content,
					kf_park,
					kf_time,
					kf_holiday,
					kf_delemenu,
					kf_togo,
					kf_reserve,
					kf_hit,
					kf_score,
					kf_zone;
					
	public String getKf_zone() {
		return kf_zone;
	}
	public void setKf_zone(String kf_zone) {
		this.kf_zone = kf_zone;
	}
	public int getKf_no() {
		return kf_no;
	}
	public void setKf_no(int kf_no) {
		this.kf_no = kf_no;
	}
	public String getKf_poster() {
		return kf_poster;
	}
	public void setKf_poster(String kf_poster) {
		this.kf_poster = kf_poster;
	}
	public String getKf_title() {
		return kf_title;
	}
	public void setKf_title(String kf_title) {
		this.kf_title = kf_title;
	}
	public String getKf_tel() {
		return kf_tel;
	}
	public void setKf_tel(String kf_tel) {
		this.kf_tel = kf_tel;
	}
	public String getKf_addr1() {
		return kf_addr1;
	}
	public void setKf_addr1(String kf_addr1) {
		this.kf_addr1 = kf_addr1;
	}
	public String getKf_content() {
		return kf_content;
	}
	public void setKf_content(String kf_content) {
		this.kf_content = kf_content;
	}
	public String getKf_park() {
		return kf_park;
	}
	public void setKf_park(String kf_park) {
		this.kf_park = kf_park;
	}
	public String getKf_time() {
		return kf_time;
	}
	public void setKf_time(String kf_time) {
		this.kf_time = kf_time;
	}
	public String getKf_holiday() {
		return kf_holiday;
	}
	public void setKf_holiday(String kf_holiday) {
		this.kf_holiday = kf_holiday;
	}
	public String getKf_delemenu() {
		return kf_delemenu;
	}
	public void setKf_delemenu(String kf_delemenu) {
		this.kf_delemenu = kf_delemenu;
	}
	public String getKf_togo() {
		return kf_togo;
	}
	public void setKf_togo(String kf_togo) {
		this.kf_togo = kf_togo;
	}
	public String getKf_reserve() {
		return kf_reserve;
	}
	public void setKf_reserve(String kf_reserve) {
		this.kf_reserve = kf_reserve;
	}
	public String getKf_hit() {
		return kf_hit;
	}
	public void setKf_hit(String kf_hit) {
		this.kf_hit = kf_hit;
	}
	public String getKf_score() {
		return kf_score;
	}
	public void setKf_score(String kf_score) {
		this.kf_score = kf_score;
	}
				

}

