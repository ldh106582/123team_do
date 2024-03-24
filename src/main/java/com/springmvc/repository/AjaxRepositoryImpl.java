package com.springmvc.repository;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
// 224-03-01
@Repository
public class AjaxRepositoryImpl implements AjaxRepository{

	public AjaxRepositoryImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	private JdbcTemplate template;
	
	@Autowired
	public void setJdbcTemplate(DataSource dataSource) 
	{
		this.template = new JdbcTemplate(dataSource);
	}
	
	// product 관리자 아이디확인 함수
	@Override
	public boolean productManager(String userId) {
		System.out.println("userId" + userId);
		String SQL = "select count(*) from person where PersonId = ?";
		int id = template.queryForObject(SQL, Integer.class, userId);
		System.out.println("id :" + id);
		
		if ("1".equals(id) || 1 == id) {
			System.out.println("false도착");
			return false;
		} else {
			return true;
		}
		
	}

	// 소비자 아이디확인 함수
	@Override
	public boolean member(String userId) {
		String SQL = "select count(*) from person where PersonId = ?";
		int id = template.queryForObject(SQL, Integer.class, userId);
		System.out.println("id :" + id);
		
		if ("1".equals(id) || 1 == id) {
			System.out.println("false도착");
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean h_managerId(String userId) 
	{
		String SQL = "select count(*) from person where PersonId = ?";
		int id =template.queryForObject(SQL, Integer.class, userId);
		
		if("1".equals(id) || 1 == id)
		{
			return false;
		}
		else
		{
			return true;			
		}
	}
	// 체험단 manager 아이디 확인하는 함수
	@Override
	public boolean Ex_mangerId(String userId) 
	{
		String SQL = "select count(*) from person where PersonId = ?";
		int id =template.queryForObject(SQL, Integer.class, userId);
		
		if("1".equals(id) || 1 == id) 
		{
			return false;
		}
		else 
		{
			return true;	
		}
	}

	@Override
	public boolean petId(String userId) 
	{
		String SQL = "select count(*) from Pet where PetId = ?";
		int id = template.queryForObject(SQL, Integer.class, userId);
		System.out.println(id);
		if("1".equals(id) || 1 == id) 
		{
			return false;			
		}
		else
		{
			return true;
		}

	}
	
	
	
}