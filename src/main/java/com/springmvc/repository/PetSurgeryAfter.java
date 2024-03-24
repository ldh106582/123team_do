package com.springmvc.repository;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class PetSurgeryAfter {
	
	private int PetSurgeryAfterNum;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate PetSurgeryAfterDate ;
	private String PetSurgeryAfterContent ;
	private String petId;
	public PetSurgeryAfter() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public int getPetSurgeryAfterNum() {
		return PetSurgeryAfterNum;
	}


	public void setPetSurgeryAfterNum(int petSurgeryAfterNum) {
		PetSurgeryAfterNum = petSurgeryAfterNum;
	}


	public LocalDate getPetSurgeryAfterDate() {
		return PetSurgeryAfterDate;
	}
	public void setPetSurgeryAfterDate(LocalDate petSurgeryAfterDate) {
		PetSurgeryAfterDate = petSurgeryAfterDate;
	}
	public String getPetSurgeryAfterContent() {
		return PetSurgeryAfterContent;
	}
	public void setPetSurgeryAfterContent(String petSurgeryAfterContent) {
		PetSurgeryAfterContent = petSurgeryAfterContent;
	}
	public String getPetId() {
		return petId;
	}
	public void setPetId(String petId) {
		this.petId = petId;
	}
	

	
}
