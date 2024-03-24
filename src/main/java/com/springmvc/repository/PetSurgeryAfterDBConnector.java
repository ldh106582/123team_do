package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.PetChart;

public class PetSurgeryAfterDBConnector implements RowMapper<PetSurgeryAfter>{
	
	public PetSurgeryAfter mapRow(ResultSet rs, int rowNum) throws SQLException {
		PetSurgeryAfter petSurgeryAfter = new PetSurgeryAfter();
		petSurgeryAfter.setPetSurgeryAfterNum(rs.getInt(1));
		petSurgeryAfter.setPetSurgeryAfterDate(rs.getDate(2).toLocalDate());
		petSurgeryAfter.setPetSurgeryAfterContent(rs.getString(3));
		petSurgeryAfter.setPetId(rs.getString(4));
		return petSurgeryAfter;
	}
}
