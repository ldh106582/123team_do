package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.PetChart;
import com.springmvc.domain.PetSurgery;

public class PetSurgeryDBConnector implements RowMapper<PetSurgery> {
	public PetSurgery mapRow(ResultSet rs, int rowNum) throws SQLException {
		PetSurgery petSurgery = new PetSurgery();
		petSurgery.setPetSurgeryNum(rs.getInt(1));
		petSurgery.setPetSurgeryDate(rs.getDate(2).toLocalDate());
		petSurgery.setPetSurgeryName(rs.getString(3));
		petSurgery.setPetSurgeryContent(rs.getString(4));
		petSurgery.setPetId(rs.getString(5));
		return petSurgery;
	}

}
