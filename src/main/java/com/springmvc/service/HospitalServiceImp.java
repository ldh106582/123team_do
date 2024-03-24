package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.AddressDTO;
import com.springmvc.domain.Hospital;
import com.springmvc.domain.HospitalBooking;
import com.springmvc.domain.HospitalMember;
import com.springmvc.repository.HospitalRepository;

@Service
public class HospitalServiceImp implements HospitalService{
	@Autowired
	HospitalRepository hospitalRepository;

	@Override
	public List<Hospital> getAllhospitals(int page) {
		return hospitalRepository.getAllhospitals(page);
	}
	
	
	// 전체 페이지를 가져오는 함수
	@Override
	public List<Hospital> getCount() {
		// TODO Auto-generated method stub
		return hospitalRepository.getCount();
	}



	@Override
	public Hospital gethosptialByhId(String hid) {
		return hospitalRepository.gethosptialByhId(hid);
	}

	@Override
	public void addhospital(Hospital hospital, String realpath) {
		hospitalRepository.addhospital(hospital, realpath);
	}

	@Override
	public void updateHospital(Hospital hospital, String hid,String realpath) {
		hospitalRepository.updateHospital(hospital,hid,realpath);
	}

	@Override
	public void deleteHospital(String hid) {
		hospitalRepository.deleteHospital(hid);
		
	}

	@Override
	public List<Hospital> gethospitalsByTitle(String title) {
		return hospitalRepository.gethospitalsByTitle(title);
	}


	@Override
	public int myhospitalList(String personId) {
		// TODO Auto-generated method stub
		return hospitalRepository.myhospitalList(personId);
	}


	@Override
	public List<HospitalBooking> todaybookList(String personId) {
		// TODO Auto-generated method stub
		return hospitalRepository.todaybookList(personId);
	}


	@Override
	public List<HospitalBooking> allbooklist(String personId) {
		// TODO Auto-generated method stub
		return hospitalRepository.allbooklist(personId);
	}


	@Override
	public AddressDTO h_rest(String personId) {
		// TODO Auto-generated method stub
		return hospitalRepository.h_rest(personId);
	}


	@Override
	public void publicAPI() {
		// TODO Auto-generated method stub
		hospitalRepository.publicAPI();
	}


	@Override
	public List<Hospital> getMyhospitalList(String personId) {
		return hospitalRepository.getMyhospitalList(personId);
	}
	
}
