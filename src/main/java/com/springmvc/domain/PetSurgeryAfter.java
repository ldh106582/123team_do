package com.springmvc.domain;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

@SuppressWarnings("serial")
public class PetSurgeryAfter implements Serializable {
	
	private int petSurgeryAfterNum;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate petSurgeryAfterDate ;
	private String petSurgeryAfterContent ;
	private String petId;
	
	public PetSurgeryAfter() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPetSurgeryAfterNum() {
		return petSurgeryAfterNum;
	}

	public void setPetSurgeryAfterNum(int petSurgeryAfterNum) {
		this.petSurgeryAfterNum = petSurgeryAfterNum;
	}

	public LocalDate getPetSurgeryAfterDate() {
		return petSurgeryAfterDate;
	}

	public void setPetSurgeryAfterDate(LocalDate petSurgeryAfterDate) {
		this.petSurgeryAfterDate = petSurgeryAfterDate;
	}

	public String getPetSurgeryAfterContent() {
		return petSurgeryAfterContent;
	}

	public void setPetSurgeryAfterContent(String petSurgeryAfterContent) {
		this.petSurgeryAfterContent = petSurgeryAfterContent;
	}

	public String getPetId() {
		return petId;
	}

	public void setPetId(String petId) {
		this.petId = petId;
	}



	
	
}
