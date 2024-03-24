package com.springmvc.domain;

import java.io.Serializable;

//여긴 모든 personId를 확인하는 dto

@SuppressWarnings("serial")
public class Ajax implements Serializable{
	
	public Ajax() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String personId;

	public String getPersonId() {
		return personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}
	
	
}
