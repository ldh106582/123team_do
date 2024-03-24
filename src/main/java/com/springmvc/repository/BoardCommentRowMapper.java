package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.BoardComment;


public class BoardCommentRowMapper implements RowMapper<BoardComment>{

	@Override
	public BoardComment mapRow(ResultSet rs, int rowNum) throws SQLException {
		BoardComment boardComment = new BoardComment();
		boardComment.setBoardId(rs.getString(1));
		boardComment.setComment(rs.getString(2));
		boardComment.setRegistDay(rs.getString(3));
		boardComment.setPersonId(rs.getString(4));
		boardComment.setCommentId(rs.getString(5));
		
		return boardComment;
	}
	
	

}
