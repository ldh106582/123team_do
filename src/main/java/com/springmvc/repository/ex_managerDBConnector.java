package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Ex_manager;
import com.springmvc.domain.Order;

public class ex_managerDBConnector implements RowMapper<Ex_manager>{
	public Ex_manager mapRow(ResultSet rs, int rowNum) throws SQLException{
		Ex_manager ex_manager = new Ex_manager();
		ex_manager.setPersonId(rs.getString("personId"));
		ex_manager.setPersonPw(rs.getString("PersonPw"));
		ex_manager.setEx_Name(rs.getString("ex_Name"));
		ex_manager.setEx_Phone(rs.getString("ex_Phone"));
		ex_manager.setEx_Address(rs.getString("ex_Address"));
		ex_manager.setS_image(rs.getString("s_image"));
		ex_manager.setC_image(rs.getString("c_image"));
		ex_manager.setType(rs.getString("type"));
		return ex_manager;
	}

}
