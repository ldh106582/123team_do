package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.PetVaccination;

public class PetVaccinationDBConnector implements RowMapper<PetVaccination>{
	public PetVaccination mapRow(ResultSet rs, int rowNum) throws SQLException {
		PetVaccination petVaccination = new PetVaccination();
		
		petVaccination.setPetVaccinationNum(rs.getInt(1));
		petVaccination.setPetVaccinationDate(rs.getDate(2).toLocalDate());
		petVaccination.setPetVaccination(rs.getString(3));
		petVaccination.setPetVaccinationCotent(rs.getString(4));
		petVaccination.setPetId(rs.getString(5));
		return petVaccination;
	}

}
