package com.springmvc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.HospitalBooking;
import com.springmvc.repository.BookingRepository;

@Service
public class BookingServiceImp implements BookingService{
	
	@Autowired
	private BookingRepository bookingrepository;

	@Override
	public List<HospitalBooking> getMyBookList(String personId) {
		return bookingrepository.getMyBookList(personId);
	}

	@Override
	public void addbook(HospitalBooking booking) {
		bookingrepository.addbook(booking);
		
	}

	@Override
	public void editbook(String bid, String registDay) {
		bookingrepository.editbook(bid,registDay);
		
	}

	@Override
	public void deletebook(String bid) {
		bookingrepository.deletebook(bid);
		
	}

	@Override
	public List<HospitalBooking> getPermisionList(String personId) {
		return bookingrepository.getPermisionList(personId);
	}

	@Override
	public void updateState(String dec, String bid) {
		bookingrepository.updateState(dec,bid);
	}

	@Override
	public HospitalBooking getbookById(String bid) {
		return bookingrepository.getbookById(bid);
	}

	@Override
	public boolean CheckVisitHistory(String personId, String hid) {
		// TODO Auto-generated method stub
		return bookingrepository.CheckVisitHistory(personId,hid);
	}


}
