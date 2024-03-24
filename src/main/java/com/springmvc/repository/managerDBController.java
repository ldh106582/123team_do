package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Ajax;
import com.springmvc.domain.type;
import com.springmvc.domain.ProductMember;

public class managerDBController implements RowMapper<type> {
	public type mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		type manager = new type();
		manager.setPersonId(rs.getString(1));
		manager.setType(rs.getString(2));
		return manager;
	}
}