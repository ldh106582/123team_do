package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.ENBoard;

public class ENBoardRowMapper implements RowMapper<ENBoard>{
	
	@Override
	public ENBoard mapRow(ResultSet rs, int rowNum) throws SQLException {
		ENBoard board = new ENBoard();
		board.setContext(rs.getString(1));
		board.setTitle(rs.getString(2));
		board.setHit(rs.getInt(3));
		board.setRegistDay(rs.getString(4));
		board.setExperience(rs.getString(5));
		board.setAnimal(rs.getString(6));
		board.setBoardId(rs.getString(7));
		board.setPersonId(rs.getString(8));
		
		return board;
	}
	
}