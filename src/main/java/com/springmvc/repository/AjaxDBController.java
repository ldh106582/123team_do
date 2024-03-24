package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Ajax;
import com.springmvc.domain.Pet;

// 여긴 모든 personId를 확인하는 db

public class AjaxDBController implements RowMapper<Ajax>{
	public Ajax mapRow(ResultSet rs, int rowNum) throws SQLException{
		Ajax ajax = new Ajax();
		ajax.setPersonId(rs.getString(1));
		return ajax;
	}
}
