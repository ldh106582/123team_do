package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.springmvc.domain.HospitalMember;

public class HospitalManagerDBConnector implements RowMapper<HospitalMember> {
	@Override
	public HospitalMember mapRow(ResultSet rs, int rowNum) throws SQLException{
		HospitalMember hospitalManager = new HospitalMember();
		hospitalManager.setPersonId(rs.getString("personId"));
		hospitalManager.setPersonPw(rs.getString("personPw"));
		hospitalManager.setPersonEmail(rs.getString("personEmail"));
		hospitalManager.setPersonAddress(rs.getString("personAddress"));
		hospitalManager.setPersonName(rs.getString("personName"));
		hospitalManager.setPersonPhone(rs.getString("personPhone"));		
		hospitalManager.setPersonBirth(rs.getDate("personBirth"));
		hospitalManager.setPersonSex(rs.getString("personSex"));
		hospitalManager.setHospitalName(rs.getString("hospitalName"));
		hospitalManager.setHospitalAddress(rs.getString("hospitalAddress"));
		hospitalManager.setHospitalPhone(rs.getString("hospitalPhone"));
		hospitalManager.setS_image(rs.getString("s_image"));
		hospitalManager.setH_image(rs.getString("h_image"));
		hospitalManager.setType(rs.getString("type"));
		hospitalManager.setImage(rs.getString("image"));
		return hospitalManager;
	}

}
