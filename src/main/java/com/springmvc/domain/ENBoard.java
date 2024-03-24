package com.springmvc.domain;

// 체험단 공고
public class ENBoard {

	public ENBoard () {
		
	}
	private String title;
	private String context;
	private String registDay;
	private int hit;
	private String boardId;
	private String animal;
	private String experience;
	private String personId;
	
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
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String BoardId) {
		this.boardId = BoardId;
	}
	public String getAnimal() {
		return animal;
	}
	public void setAnimal(String animal) {
		this.animal = animal;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getPersonId() {
		return personId;
	}
	public void setPersonId(String managerId) {
		this.personId = managerId;
	}
	
	
}
