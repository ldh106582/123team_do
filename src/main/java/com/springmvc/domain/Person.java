package com.springmvc.domain;

import java.io.Serializable;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

@SuppressWarnings("serial")
public class Person implements Serializable{
	   private String personId;
	   private String personPw;
	   private String personEmail;
	   private String personAddress;
	   private String personName;
	   
	   @DateTimeFormat(pattern = "yyyy-MM-dd")
	   private LocalDate personBirth;
	   private String personSex;
	   private String personPhone;
	   private String type;
	   private String image;
	  
	public Person() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public String getPersonId() {
		return personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}

	public String getPersonPw() {
		return personPw;
	}

	public void setPersonPw(String personPw) {
		this.personPw = personPw;
	}

	public String getPersonEmail() {
		return personEmail;
	}

	public void setPersonEmail(String personEmail) {
		this.personEmail = personEmail;
	}

	public String getPersonAddress() {
		return personAddress;
	}

	public void setPersonAddress(String personAddress) {
		this.personAddress = personAddress;
	}

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}


	public LocalDate getPersonBirth() {
		return personBirth;
	}

	public void setPersonBirth(LocalDate personBirth) {
		this.personBirth = personBirth;
	}

	public String getPersonSex() {
		return personSex;
	}

	public void setPersonSex(String personSex) {
		this.personSex = personSex;
	}

	public String getPersonPhone() {
		return personPhone;
	}

	public void setPersonPhone(String personPhone) {
		this.personPhone = personPhone;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	
	
	   
	   
}
