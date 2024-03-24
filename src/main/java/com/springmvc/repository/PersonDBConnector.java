package com.springmvc.repository;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.springmvc.domain.Person;

@SuppressWarnings("serial")
public class PersonDBConnector implements RowMapper<Person>, Serializable{
	public Person mapRow(ResultSet rs, int rowNum) throws SQLException{
	      Person person = new Person();
	        person.setPersonId(rs.getString(1));         // PersonId
	        person.setPersonPw(rs.getString(2));         // PersonPw
	        person.setPersonEmail(rs.getString(3));      // PersonEmail
	        person.setPersonAddress(rs.getString(4));    // PersonAddress
	        person.setPersonName(rs.getString(5));       // PersonName
	        person.setPersonBirth(rs.getDate(6).toLocalDate()); // PersonBirth, DB의 date 타입 컬럼
	        person.setPersonSex(rs.getString(7));        // PersonSex
	        person.setPersonPhone(rs.getString(8));      // PersonPhone
	        person.setType(rs.getString(9));
	        person.setImage(rs.getString(10));
	        return person;
	}
}
