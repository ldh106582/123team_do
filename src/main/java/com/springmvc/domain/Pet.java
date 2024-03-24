package com.springmvc.domain;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

@SuppressWarnings("serial")
public class Pet implements Serializable{
	private String petId;
	private String petName;
	private String petType;
	private String petVarity;
	private String petSex;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate petBirth;
	private String personId;
	private String petImage;
	
	public Pet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getPetId() {
		return petId;
	}

	public void setPetId(String petId) {
		this.petId = petId;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getPetType() {
		return petType;
	}

	public void setPetType(String petType) {
		this.petType = petType;
	}

	public String getPetVarity() {
		return petVarity;
	}

	public void setPetVarity(String petVarity) {
		this.petVarity = petVarity;
	}

	public String getPetSex() {
		return petSex;
	}

	public void setPetSex(String petSex) {
		this.petSex = petSex;
	}

	public LocalDate getPetBirth() {
		return petBirth;
	}

	public void setPetBirth(LocalDate petBirth) {
		this.petBirth = petBirth;
	}

	public String getPersonId() {
		return personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}
	public String getPetImage() {
		return petImage;
	}

	public void setPetImage(String petImage) {
		this.petImage = petImage;
	}

	
	
}
