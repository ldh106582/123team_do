package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.HospitalBooking;

public class BookingRowMapper implements RowMapper<HospitalBooking>{
	
	@Override
	public HospitalBooking mapRow(ResultSet rs, int rowNum) throws SQLException {
		HospitalBooking booking = new HospitalBooking();
		booking.setRegistDay(rs.getString(1));
		booking.setPersonId(rs.getString(2));
		booking.setBid(rs.getString(3));
		booking.setMid(rs.getString(4));
		booking.setHospitalName(rs.getString(5));
		booking.setHid(rs.getString(6));
		booking.setPetId(rs.getString(7));
		booking.setContext(rs.getString(8));
		booking.setState(rs.getString(9));
		booking.setAlarm(rs.getString(10));
		return booking;
	}
}
