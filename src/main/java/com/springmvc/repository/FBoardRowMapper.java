package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.FBoard;

public class FBoardRowMapper implements RowMapper<FBoard>{

	@Override
	public FBoard mapRow(ResultSet rs, int rowNum) throws SQLException {
		FBoard board = new FBoard();
		board.setPersonId(rs.getString(1));
		board.setContext(rs.getString(2));
		board.setTitle(rs.getString(3));
		board.setHit(rs.getInt(4));
		board.setRegistDay(rs.getString(5));
		board.setBoardId(rs.getString(6));
		return board;
	}
	
	

}