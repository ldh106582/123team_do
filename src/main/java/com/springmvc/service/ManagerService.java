package com.springmvc.service;

import com.springmvc.domain.Ex_manager;
import com.springmvc.domain.HospitalMember;
import com.springmvc.domain.type;
import com.springmvc.domain.ProductMember;

public interface ManagerService {
	void getaddProductManager(ProductMember productMember);
	// 전체 id db에 값을 넣어줌
	void setAllMember(ProductMember productMember);
	// manager 로그인 함수
	type managerlogin(type manager);

	// 전체 id db 데이터를 삭제하는 함수
	void AllmanagerDelete(String managerId);
	// Member 데이터를 삭제하는 함수
	void P_managerDelete(String managerId);
	// mypage로 이동하기 위한 값을 가져옴
	//ProductMember managerPage(String personId);
	
	// prodcut 관리자 회원 정보를 수정하기 전 보여주는 함수
//	ProductMember managerUpdate(String personId);
	
	// 정보를 넣고 보여주는 함수
//	ProductMember setmanagerUpdate(ProductMember productMemId);
	// 병원 manager 회원가입 하는 함수
	void addHospitalManager(HospitalMember hospitalMember);
	 // 전체 db에 데이터를 넣어주는 함수
	void H_setAllMember(HospitalMember hospitalMember);
	  // 체험단 manager 회원가입 하는 함수
	void addEx_Manager(Ex_manager ex_manager);
	 // 전체 db에 데이터를 넣어주는 함수
	void setEx_AllMember(Ex_manager ex_manager);
}
