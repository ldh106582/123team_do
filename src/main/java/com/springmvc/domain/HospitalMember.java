package com.springmvc.domain;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

@SuppressWarnings("serial")
public class HospitalMember implements Serializable {
	private String personId;
	private String personPw;
	private String personEmail;
	private String personAddress;
	private String personName;
	private String personPhone;
	private Date personBirth;
	private String personSex;
	private String hospitalName;
	private String hospitalAddress;
	private String hospitalPhone;
	private String s_image; // 사업자등록증
	private String type;
	private String h_image; // 병원자격증
	private String image;
	
	public HospitalMember() {
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
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public String getHospitalAddress() {
		return hospitalAddress;
	}
	public void setHospitalAddress(String hospitalAddress) {
		this.hospitalAddress = hospitalAddress;
	}
	public String getHospitalPhone() {
		return hospitalPhone;
	}
	public void setHospitalPhone(String hospitalPhone) {
		this.hospitalPhone = hospitalPhone;
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
	public String getH_image() {
		return h_image;
	}
	public void setH_image(String h_image) {
		this.h_image = h_image;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}


}
