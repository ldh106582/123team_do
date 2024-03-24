package com.springmvc.domain;

public class FBoard {
	
	public FBoard () {
		
	}
	private String title;
	private String context;
	private String registDay;
	private int hit;
	private String personId;
	private String boardId;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getRegistDay() {
		return registDay;
	}
	public void setRegistDay(String RegistDay) {
		this.registDay = RegistDay;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getPersonId() {
		// 세션에서 받아오기
		return personId;
	}
	public void setPersonId(String setPersonId) {
		this.personId = setPersonId;
	}
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String BoardId) {
		this.boardId = BoardId;
	}
	
	
}
