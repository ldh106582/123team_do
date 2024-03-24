package com.springmvc.repository;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.HospitalBooking;

@Repository
public class BookingRepositoryImp implements BookingRepository{
	
	private JdbcTemplate template;
	
	@Autowired
	public void setJdbcTemplate(DataSource dataSource) 
	{
		this.template = new JdbcTemplate(dataSource);
	}

	String SQL = null;
	@Override
	public List<HospitalBooking> getMyBookList(String personId) {
		SQL = "select * from HApllication where personId='"+personId+"'";
		List<HospitalBooking> list = template.query(SQL, new BookingRowMapper());
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		return list;
	}
	@Override
	public void addbook(HospitalBooking booking) {
		SQL = "insert into HApllication values(?,?,?,?,?,?,?,?,?,?)";
		template.update(SQL,booking.getRegistDay(),booking.getPersonId(),getBid(),booking.getMid(),booking.getHospitalName(),booking.getHid(),booking.getPetId(),booking.getContext(),"처리중","before");
		
	}
	private String getBid() {
		String str = Long.toString(System.currentTimeMillis());
		return str;
	}
	
	@Override
	public void editbook(String bid, String registDay) {
		SQL = "update HApllication set registDay=?,state=? where bid='"+bid+"'";
		template.update(SQL,registDay,"처리중");
		
	}
	@Override
	public void deletebook(String bid) {
		SQL = "delete from HApllication where bid='"+bid+"'";
		template.update(SQL);
	}
	@Override
	public List<HospitalBooking> getPermisionList(String personId) {
		SQL = "select * from HApllication where mid='"+personId+"' and state='"+"처리중"+"'";
		List<HospitalBooking> list = template.query(SQL, new BookingRowMapper());
		return list;
	}
	@Override
	public void updateState(String dec, String bid) {
		SQL = "update HApllication set state=? where bid=?";
		template.update(SQL,dec,bid);
		
	}
	@Override
	public HospitalBooking getbookById(String bid) {
		HospitalBooking booking = new HospitalBooking();
		SQL = "select * from HApllication where bid='"+bid+"'";
		List<HospitalBooking> list = template.query(SQL, new BookingRowMapper());
		booking = list.get(0);
		return booking;
	}
	@Override
	public boolean CheckVisitHistory(String personId, String hid) {
		SQL = "select * from HApllication where hid='"+hid+"' and personId='"+personId+"'";
		List<HospitalBooking> list = template.query(SQL, new BookingRowMapper());
		if(list == null || list.isEmpty()) {
			return false;
		}
		return true;
	}
	
}
