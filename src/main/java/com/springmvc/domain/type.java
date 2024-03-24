package com.springmvc.domain;

public class type {

	public type() {
		super();
		// TODO Auto-generated constructor stub
	}
	private String personId;
	private String personPw;
	private String type;
	
	private static type instance;
	
	public static type getInstance() {
		if(instance == null) {
			instance = new type();
	}
		return instance;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
}
