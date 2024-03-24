package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.springmvc.domain.Hospital;

public class HospitalRowMapper implements RowMapper<Hospital>{
	
	@Override
	public Hospital mapRow(ResultSet rs, int rowNum) throws SQLException {

		Hospital hopital = new Hospital();		

		hopital.setName(rs.getString(1));
		hopital.setAddr(rs.getString(2));
		hopital.setNumber(rs.getString(3));
		hopital.setRuntime(rs.getString(4));
		hopital.setHid(rs.getString(5));
		hopital.setParking(rs.getString(6));
		hopital.setDescription(rs.getString(7));
		hopital.setPersonId(rs.getString(8));
		hopital.setImage(rs.getString(9));
		hopital.setX(rs.getString(10));
		hopital.setY(rs.getString(11));
		hopital.setReviewScore(rs.getFloat(12));
		hopital.setReviewCount(rs.getInt(13));
		return hopital;
	}
	
}