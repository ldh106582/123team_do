package com.springmvc.repository;

import java.io.IOException;
import java.util.List;

import com.springmvc.domain.AddressDTO;
import com.springmvc.domain.Hospital;
import com.springmvc.domain.HospitalBooking;

public interface HospitalRepository {

	List<Hospital> getAllhospitals(int page);

	// 전체 페이지를 가져오는 함수
	List<Hospital> getCount();
	
	Hospital gethosptialByhId(String hid);

	void addhospital(Hospital hospital, String realpath);

	void updateHospital(Hospital hospital, String hid,String realpath);

	void deleteHospital(String hid);

	List<Hospital> gethospitalsByTitle(String title);

	int myhospitalList(String personId);

	List<HospitalBooking> todaybookList(String personId);

	List<HospitalBooking> allbooklist(String personId);
	
	AddressDTO h_rest(String personId) ;
	
	void publicAPI();

	List<Hospital> getMyhospitalList(String personId);
}
