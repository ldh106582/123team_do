package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.springmvc.controller.ManagerController;
import com.springmvc.domain.type;
import com.springmvc.domain.EApplication;
import com.springmvc.domain.Ex_manager;
import com.springmvc.domain.Hospital;
import com.springmvc.domain.HospitalMember;
import com.springmvc.domain.Person;
import com.springmvc.domain.Pet;
import com.springmvc.domain.Product;
import com.springmvc.domain.ProductMember;

public interface PersonService {
	void setCreatPerson(Person person);
	Person loginSucess(Person person) ;
	void SetUpdatePerson(Person person);
	void SetDeletePerson(String personId);
	// pet이름 가져오는 함수
	List<Pet> getPetName(Person person);
	// pet아이디를 가져오는 함수
	List<Pet> getPetId(Pet pet);
	// update에서 사용할 정보
	Person findPersonById(String id);
	// 프로덕트 매니저가 로그인할 때 가져올 데이터
	ProductMember getPM(String personId);
	// 해당 프로덕트 매니저의 상품을 가죠오는 데이터
	List<Product> getProduct(String personId);
	// 동물병원 의사가 로그인할 때 가져올 데이터
	HospitalMember getHM(String personId);
	// 해당 동물병원의사의 병원정보를 가죠오는 데이터
	List<Hospital> getHopital(String personId);
	// product manager 마이페이지를 수정하는 곳
	void SetUpdatePM(ProductMember productMember);
	 // hospital manager 마이페이지를 수정하는 곳
	void SetUpdateHM(HospitalMember hospitalMember);
	// product manager person 테이블을 수정하는 곳
	void SetUpdatePr(ProductMember productMember);
	 // hospital manager person 테이블을 수정하는 곳
	void SetUpdatePH(HospitalMember hospitalMember);
    // 체험단 관리자가 로그인할 때 가져올 데이터
	Person getEM(String personId);
	// 체험단 신청목록을 로그인할 때 가져올 데이터
	List<EApplication> getEA(String personId);
	  // product manager 회원수정
	ProductMember P_update(String id);
	  // hopital manager 회원수정
	HospitalMember H_update(String id);
	  // EXpreience manager 회원수정
	Ex_manager E_update(String id);
	
	// hospital manager 마이페이지를 수정하는 곳
	void SetUpdateEM(Ex_manager ex_manager);
	
	//product manager 테이블 데이터를 삭제하는 함수
	  //person 테이블 데이터를 삭제하는 함수
	void PM(String personId);
	
	  //병원 manager 테이블 데이터를 삭제하는 함수
	  //person 테이블 데이터를 삭제하는 함수
	void HM(String personId);

	  //체험단 manager 테이블 데이터를 삭제하는 함수
	  //person 테이블 데이터를 삭제하는 함수
	void EM(String personId);
	  // mypage수정시  redirect 하는 함수
	Person getMypage(String personId);
}
