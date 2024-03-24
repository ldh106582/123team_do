package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.QnA;

public class QnArowMapper implements RowMapper<QnA>{

	@Override
	public QnA mapRow(ResultSet rs, int rowNum) throws SQLException {
		QnA QnA = new QnA();
		QnA.setPersonId(rs.getString(1));
		QnA.setProductId(rs.getString(2));
		QnA.setTitle(rs.getString(3));
		QnA.setContext(rs.getString(4));
		QnA.setRegistDay(rs.getString(5));
		QnA.setImage(rs.getString(6));
		QnA.setQnaId(rs.getString(7));
		return QnA;
	}
	

}