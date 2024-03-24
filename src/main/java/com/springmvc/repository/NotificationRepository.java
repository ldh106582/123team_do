package com.springmvc.repository;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.EApplication;
import com.springmvc.domain.HospitalBooking;

@Repository
public class NotificationRepository {
	
	private JdbcTemplate template;

	@Autowired
	public void setJdbctemplate(DataSource dataSource) {
	     this.template = new JdbcTemplate(dataSource);
	}
	 
	String select = "";
    String update = "";

    String registDay = null;
    LocalDateTime now = null;
    DateTimeFormatter formatter = null;
    LocalDateTime reservation = null;
    HospitalBooking hospitalBooking =null;
    EApplication eApplication =null;
    String pattern = "yyyy-MM-dd HH:mm:ss";
    String before = "before";
    
	public HospitalBooking testhnotify(String personId) {
		select = "select * from HApllication where personId='"+personId+"' and alarm='"+before+"'";
		System.out.println(personId);
		List<HospitalBooking> list = template.query(select, new BookingRowMapper());
		if(list.isEmpty()) {
			return null;
		}
		for(int i=0;i<list.size();i++) {
			hospitalBooking = list.get(i);
			registDay = hospitalBooking.getRegistDay();
			now = LocalDateTime.now();
			formatter = DateTimeFormatter.ofPattern(pattern);
	        reservation = LocalDateTime.parse(registDay, formatter);
	     // 시간 비교
	        Duration duration = Duration.between(now, reservation);
	        long seconds = duration.toSeconds();
	        if (seconds <= 600 && seconds >= 420) {
	        	update = "update HApllication set alarm=? where bid=?";
	        	template.update(update,"after",hospitalBooking.getBid());
	            return hospitalBooking;
	        }
		}
		return null;
	}

	public EApplication testenotify(String personId) {
		select = "select * from EApllication where personId='"+personId+"' and alarm='"+before+"'";
		
		
		List<EApplication> list = template.query(select, new EApplicationRowMapper());
		if(list.isEmpty()) {
			return null;
		}
		for(int i=0;i<list.size();i++) {
			eApplication = list.get(i);
			registDay = eApplication.getRegistDay();
			now = LocalDateTime.now();
			formatter = DateTimeFormatter.ofPattern(pattern);
	        reservation = LocalDateTime.parse(registDay, formatter);
	        
	     // 시간 비교
	        Duration duration = Duration.between(now, reservation);
	        long seconds = duration.toSeconds();
	        if (seconds <= 600 && seconds >= 420) {
	        	update = "update HApllication set alarm=? where Eid=?";
	        	template.update(update,"after",eApplication.getEid());
	            return eApplication;
	        }
		}
		return null;
	}
	
}
