package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.springmvc.domain.AnimalHopital;
import com.springmvc.domain.BoardComment;



public class AnimalHopitalRowMapper implements RowMapper<AnimalHopital>
{
	@Override
	public AnimalHopital mapRow(ResultSet rs, int rowNum) throws SQLException {
		AnimalHopital animalHopital = new AnimalHopital();
		animalHopital.setHopitalName(rs.getString(1));
		return animalHopital;
	}
}
