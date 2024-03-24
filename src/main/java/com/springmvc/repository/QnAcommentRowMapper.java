package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.QnAComment;

public class QnAcommentRowMapper implements RowMapper<QnAComment>{
	
	@Override
	public QnAComment mapRow(ResultSet rs, int rowNum) throws SQLException {
		QnAComment qnacomment = new QnAComment();
		qnacomment.setQnaId(rs.getString(1));
		qnacomment.setComment(rs.getString(2));
		qnacomment.setRegistDay(rs.getString(3));
		qnacomment.setPersonId(rs.getString(4));
		qnacomment.setCommentId(rs.getString(5));
		
		return qnacomment;
	}
}
