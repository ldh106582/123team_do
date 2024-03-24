package com.springmvc.repository;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class DBrepository {
	 private JdbcTemplate template;

	 @Autowired
	 public void setJdbctemplate(DataSource dataSource) 
	 {
		 	this.template = new JdbcTemplate(dataSource);
	 }	 
}
