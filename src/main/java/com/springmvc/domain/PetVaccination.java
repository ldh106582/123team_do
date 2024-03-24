package com.springmvc.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class PetVaccination {
	
	private int petVaccinationNum;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate petVaccinationDate;
	private String petVaccination;
	private String petVaccinationCotent;
	private String petId;
	
	public PetVaccination() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getPetVaccinationNum() {
		return petVaccinationNum;
	}
	public void setPetVaccinationNum(int petVaccinationNum) {
		this.petVaccinationNum = petVaccinationNum;
	}


	public LocalDate getPetVaccinationDate() {
		return petVaccinationDate;
	}
	public void setPetVaccinationDate(LocalDate petVaccinationDate) {
		this.petVaccinationDate = petVaccinationDate;
	}
	public String getPetVaccination() {
		return petVaccination;
	}
	public void setPetVaccination(String petVaccination) {
		this.petVaccination = petVaccination;
	}
	public String getPetVaccinationCotent() {
		return petVaccinationCotent;
	}
	public void setPetVaccinationCotent(String petVaccinationCotent) {
		this.petVaccinationCotent = petVaccinationCotent;
	}
	public String getPetId() {
		return petId;
	}
	public void setPetId(String petId) {
		this.petId = petId;
	}
	
}
