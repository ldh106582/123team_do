package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.springmvc.repository.PersonRepository;

@Service
public class PersonServciceImp implements PersonService{

	@Autowired
	PersonRepository psersonRepository;

	@Override
	public void setCreatPerson(Person person) 
	{
		System.out.println("createservice");
		psersonRepository.setCreatPerson(person);
		
	}

	@Override
	public Person loginSucess(Person person) {
		
		return psersonRepository.loginSucess (person);
	}

	@Override
	public void SetUpdatePerson(Person person) {
		// TODO Auto-generated method stub
		psersonRepository.SetUpdatePerson(person);
	}

	@Override
	public void SetDeletePerson(String personId) {
		// TODO Auto-generated method stub
		psersonRepository.SetDeletePerson(personId);
	}

	@Override
	public List<Pet> getPetName(Person person) {
		// TODO Auto-generated method stub
		return psersonRepository.getPetName(person);
	}

	@Override
	public List<Pet> getPetId(Pet pet) {
		// TODO Auto-generated method stub
		return psersonRepository.getPetId(pet);
	}
	// update에서 사용할 정보
	@Override
	public Person findPersonById(String id) {
		// TODO Auto-generated method stub
		return psersonRepository.findPersonById(id);
	}
	// 프로덕트 매니저가 로그인할 때 가져올 데이터
	@Override
	public ProductMember getPM(String personId) {
		// TODO Auto-generated method stub
		return psersonRepository.getPM(personId);
	}
	// 해당 프로덕트 매니저의 상품을 가죠오는 데이터
	@Override
	public List<Product> getProduct(String personId) {
		// TODO Auto-generated method stub
		return psersonRepository.getProduct(personId);
	}
	// 동물병원 의사가 로그인할 때 가져올 데이터

	@Override
	public HospitalMember getHM(String personId) {
		// TODO Auto-generated method stub
		return psersonRepository.getHM(personId);
	}
	// 해당 동물병원의사의 병원정보를 가죠오는 데이터

	@Override
	public List<Hospital> getHopital(String personId) {
		// TODO Auto-generated method stub
		return psersonRepository.getHopital(personId);
	}
	// product manager 마이페이지를 수정하는 곳
	@Override
	public void SetUpdatePM(ProductMember productMember) {
		// TODO Auto-generated method stub
		psersonRepository.SetUpdatePM(productMember);
	}
	 // hospital manager 마이페이지를 수정하는 곳
	@Override
	public void SetUpdateHM(HospitalMember hospitalMember) {
		// TODO Auto-generated method stub
		psersonRepository.SetUpdateHM(hospitalMember);
	}
	// product manager person 테이블을 수정하는 곳
	@Override
	public void SetUpdatePr(ProductMember productMember) {
		// TODO Auto-generated method stub
		psersonRepository.SetUpdatePr(productMember);
	}
	//HospitalMember hospitalMember
	@Override
	public void SetUpdatePH(HospitalMember hospitalMember) {
		// TODO Auto-generated method stub
		psersonRepository.SetUpdatePH(hospitalMember);
	}

	@Override
	public Person getEM(String personId) {
		// TODO Auto-generated method stub
		return psersonRepository.getEM(personId);
	}

	@Override
	public List<EApplication> getEA(String personId) {
		// TODO Auto-generated method stub
		return psersonRepository.getEA(personId);
	}
	  // product manager 회원수정
	@Override
	public ProductMember P_update(String id) {
		// TODO Auto-generated method stub
		return psersonRepository.P_update(id);
	}
	  // hopital manager 회원수정
	@Override
	public HospitalMember H_update(String id) {
		// TODO Auto-generated method stub
		return psersonRepository.H_update(id);
	}
	  // EXpreience manager 회원수정
	@Override
	public Ex_manager E_update(String id) {
		// TODO Auto-generated method stub
		return psersonRepository.E_update(id);
	}
	 // hospital manager 마이페이지를 수정하는 곳
    // hospital manager person 테이블을 수정하는 곳
	@Override
	public void SetUpdateEM(Ex_manager ex_manager) {
		// TODO Auto-generated method stub
		psersonRepository.SetUpdateEM(ex_manager);
	}
	//product manager 테이블 데이터를 삭제하는 함수
	  //person 테이블 데이터를 삭제하는 함수
	@Override
	public void PM(String personId) {
		// TODO Auto-generated method stub
		psersonRepository.PM(personId);
	}
	  //병원 manager 테이블 데이터를 삭제하는 함수
	  //person 테이블 데이터를 삭제하는 함수
	@Override
	public void HM(String personId) {
		// TODO Auto-generated method stub
		psersonRepository.HM(personId);
	}
	  //체험단 manager 테이블 데이터를 삭제하는 함수
	  //person 테이블 데이터를 삭제하는 함수
	@Override
	public void EM(String personId) {
		// TODO Auto-generated method stub
		psersonRepository.EM(personId);
	}
	  // mypage수정시  redirect 하는 함수
	@Override
	public Person getMypage(String personId) {
		// TODO Auto-generated method stub
		return psersonRepository.getMypage(personId);
	}

	
	

}
