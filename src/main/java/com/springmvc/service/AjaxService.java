package com.springmvc.service;

public interface AjaxService {
	// productmanager 아이디 확인하는 함수
	boolean productManager(String userId);
	// 소비자 아이디확인 함수
	boolean member(String userId);

	// hospital manager 아이디 확인하는 함수
	boolean h_managerId(String userId);
	
	// 체험단 manager 아이디 확인하는 함수
	boolean Ex_mangerId(String userId);
	
	// pet 아이디 확인하는 함수
	boolean petId(String userId);
}

