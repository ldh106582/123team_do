package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.HospitalBooking;

public interface BookingService {

	List<HospitalBooking> getMyBookList(String personId);

	void addbook(HospitalBooking booking);

	void editbook(String bid, String registDay);

	void deletebook(String bid);

	List<HospitalBooking> getPermisionList(String personId);

	void updateState(String dec, String bid);

	HospitalBooking getbookById(String bid);

	boolean CheckVisitHistory(String personId, String hid);
	
	
}
