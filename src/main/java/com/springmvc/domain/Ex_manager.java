package com.springmvc.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Ex_manager {
	   private String personId;
	   private String personPw;
	   private String personEmail;
	   private String personAddress;
	   private String personName;
	   private String personPhone;
	   private Date personBirth;
	   private String personSex;
	   private String ex_Name;
	   private String ex_Address;
	   private String ex_Phone;
	   private String s_image; // 사업자등록증
	   private String c_image; // 프로필사진
	   private String type;
	public Ex_manager() {
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
	
	public String getEx_Name() {
		return ex_Name;
	}
	public void setEx_Name(String ex_Name) {
		this.ex_Name = ex_Name;
	}
	public String getEx_Address() {
		return ex_Address;
	}
	public void setEx_Address(String ex_Address) {
		this.ex_Address = ex_Address;
	}
	public String getEx_Phone() {
		return ex_Phone;
	}
	public void setEx_Phone(String ex_Phone) {
		this.ex_Phone = ex_Phone;
	}
	public String getS_image() {
		return s_image;
	}
	public void setS_image(String s_image) {
		this.s_image = s_image;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getPersonPhone() {
		return personPhone;
	}
	public void setPersonPhone(String personPhone) {
		this.personPhone = personPhone;
	}
	public Date getPersonBirth() {
		return personBirth;
	}
	public void setPersonBirth(Date personBirth) {
		this.personBirth = personBirth;
	}
	public String getPersonSex() {
		return personSex;
	}
	public void setPersonSex(String personSex) {
		this.personSex = personSex;
	}
	public String getC_image() {
		return c_image;
	}
	public void setC_image(String c_image) {
		this.c_image = c_image;
	}
	
	
	
}
