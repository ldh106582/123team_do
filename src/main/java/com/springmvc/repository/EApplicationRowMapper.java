package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.springmvc.domain.EApplication;


public class EApplicationRowMapper implements RowMapper<EApplication>{

	@Override
	public EApplication mapRow(ResultSet rs, int rowNum) throws SQLException {
		EApplication application = new EApplication();
		application.setExperience(rs.getString(1));
		application.setAnimal(rs.getString(2));
		application.setRegistDay(rs.getString(3));
		application.setState(rs.getString(4));
		application.setPersonId(rs.getString(5));
		application.setTitle(rs.getString(6));
		application.setEid(rs.getString(7));
		application.setMid(rs.getString(8));
		application.setBoardId(rs.getString(9));
		application.setAlarm(rs.getString(10));

		return application;
	}
	
	

}
