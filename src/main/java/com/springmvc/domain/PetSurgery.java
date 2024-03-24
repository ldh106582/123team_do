package com.springmvc.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class PetSurgery {
	
	private int petSurgeryNum;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate petSurgeryDate ;
	private String petSurgeryName ;
	private String petSurgeryContent ;
	private String petId;
	public PetSurgery() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getPetSurgeryNum() {
		return petSurgeryNum;
	}
	public void setPetSurgeryNum(int petSurgeryNum) {
		this.petSurgeryNum = petSurgeryNum;
	}
	public LocalDate getPetSurgeryDate() {
		return petSurgeryDate;
	}
	public void setPetSurgeryDate(LocalDate petSurgeryDate) {
		this.petSurgeryDate = petSurgeryDate;
	}
	public String getPetSurgeryName() {
		return petSurgeryName;
	}
	public void setPetSurgeryName(String petSurgeryName) {
		this.petSurgeryName = petSurgeryName;
	}
	public String getPetSurgeryContent() {
		return petSurgeryContent;
	}
	public void setPetSurgeryContent(String petSurgeryContent) {
		this.petSurgeryContent = petSurgeryContent;
	}
	public String getPetId() {
		return petId;
	}
	public void setPetId(String petId) {
		this.petId = petId;
	}

	
	
}
