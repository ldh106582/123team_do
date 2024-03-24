package com.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Ex_manager;
import com.springmvc.domain.HospitalMember;
import com.springmvc.domain.type;
import com.springmvc.domain.ProductMember;
import com.springmvc.repository.ManagerRepository;

@Service
public class ManagerServiceImp implements ManagerService{
	@Autowired
	ManagerRepository productMemberRepository;
	
	@Override
	public void getaddProductManager(ProductMember productMember) {
		// TODO Auto-generated method stub
		productMemberRepository.getaddProductManager(productMember);
	}
	
	// 전체 id db에 값을 넣어줌
	
	@Override
	public void setAllMember(ProductMember productMember) {
		// TODO Auto-generated method stub
		productMemberRepository.setAllMember(productMember);
	}

	// manager 로그인 함수
	@Override
	public type managerlogin(type manager) {
		// TODO Auto-generated method stub
		return productMemberRepository.managerlogin(manager);
	}
	// 전체 id db 데이터를 삭제하는 함수	
	@Override
	public void AllmanagerDelete(String managerId) {
		// TODO Auto-generated method stub
		productMemberRepository.AllmanagerDelete(managerId);
	}
	// Member 데이터를 삭제하는 함수
	@Override
	public void P_managerDelete(String managerId) {
		// TODO Auto-generated method stub
		productMemberRepository.P_managerDelete(managerId);
	}
	
	/*// mypage로 이동하기 위한 값을 가져옴
	@Override
	public ProductMember managerPage(String personId) {
		// TODO Auto-generated method stub
		return productMemberRepository.managerPage(personId);
	}*/
	
	// prodcut 관리자 회원 정보를 수정하기 전 보여주는 함수
/*	@Override
	public ProductMember managerUpdate(String personId) {
		// TODO Auto-generated method stub
		return productMemberRepository.managerUpdate(personId);
	}
	
	// 수정 후 보여주기 위해 데이터를 가져옴
	@Override
	public ProductMember setmanagerUpdate(ProductMember productMemId) {
		// TODO Auto-generated method stub
		return productMemberRepository.setmanagerUpdate(productMemId);
	}*/
	
	// 병원 manager 회원가입 하는 함수
	@Override
	public void addHospitalManager(HospitalMember hospitalMember) {
		// TODO Auto-generated method stub
		productMemberRepository.addHospitalManager(hospitalMember);
	}
	 // 전체 db에 데이터를 넣어주는 함수
	@Override
	public void H_setAllMember(HospitalMember hospitalMember) {
		// TODO Auto-generated method stub
		productMemberRepository.H_setAllMember(hospitalMember);
	}
	  // 체험단 manager 회원가입 하는 함수
	@Override
	public void addEx_Manager(Ex_manager ex_manager) {
		// TODO Auto-generated method stub
		productMemberRepository.addEx_Manager(ex_manager);

	}
	 // 전체 db에 데이터를 넣어주는 함수
	@Override
	public void setEx_AllMember(Ex_manager ex_manager) {
		// TODO Auto-generated method stub
		productMemberRepository.setEx_AllMember(ex_manager);
	}

	

	
}
