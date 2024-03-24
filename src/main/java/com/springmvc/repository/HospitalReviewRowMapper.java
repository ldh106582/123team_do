package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.HospitalReview;

public class HospitalReviewRowMapper implements RowMapper<HospitalReview>{

	@Override
	public HospitalReview mapRow(ResultSet rs, int rowNum) throws SQLException {
		HospitalReview reviews = new HospitalReview();
		reviews.setHid(rs.getString(1));
		reviews.setPersonId(rs.getString(2));
		reviews.setTitle(rs.getString(3));
		reviews.setContext(rs.getString(4));
		reviews.setReviewScore(rs.getInt(5));
		reviews.setReviewImage(rs.getString(6));
		reviews.setRegistDay(rs.getString(7));
		reviews.setReviewId(rs.getString(8));
		return reviews;
	}
	
	

}
