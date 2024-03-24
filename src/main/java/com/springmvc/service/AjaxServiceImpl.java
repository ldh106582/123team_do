package com.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.repository.AjaxRepository;

@Service
public class AjaxServiceImpl implements AjaxService {

	@Autowired
	private AjaxRepository ajaxRepository;

	// product 관리자 아이디확인 함수
	@Override
	public boolean productManager(String userId) {
		if(ajaxRepository.productManager(userId)) {
			return true;
		} else {
			return false;
		}
		
	}
	// 소비자 아이디확인 함수
	@Override
	public boolean member(String userId) {
		if(ajaxRepository.member(userId)) {
			return true;
		} else {
		return false;
	}
  }
	// hospital manager 아이디 확인하는 함수
	@Override
	public boolean h_managerId(String userId) 
	{
		if(ajaxRepository.h_managerId(userId))
		{
			return true;
		}
		else 
		{
			return false;			
		}
	}
	// 체험단 manager 아이디 확인하는 함수
	@Override
	public boolean Ex_mangerId(String userId) 
	{
		if(ajaxRepository.Ex_mangerId(userId))
		{
			return true;
		}
		else 
		{
			return false;
		}

	}
	
	// pet 아이디 확인하는 함수
	@Override
	public boolean petId(String userId) {
		if(ajaxRepository.petId(userId)) 
		{
			return true;
		} else 
		{
		return false;
		}
	}
	
}
