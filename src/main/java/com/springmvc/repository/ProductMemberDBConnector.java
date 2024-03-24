package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.springmvc.domain.ProductMember;

public class ProductMemberDBConnector implements RowMapper<ProductMember>{
	@Override
	public ProductMember mapRow(ResultSet rs, int rowNum) throws SQLException {
	    ProductMember productMember = new ProductMember();
	    productMember.setPersonId(rs.getString("personId"));
	    productMember.setPersonPw(rs.getString("personPw"));
	    productMember.setPersonEmail(rs.getString("personEmail"));
	    productMember.setPersonAddress(rs.getString("personAddress"));
	    productMember.setPersonName(rs.getString("personName"));
	    productMember.setPersonBirth(rs.getString("personBirth"));
	    productMember.setPersonSex(rs.getString("personSex"));
	    productMember.setPersonPhone(rs.getString("personPhone"));
	    productMember.setCompanyName(rs.getString("companyName"));
	    productMember.setCompanyAddress(rs.getString("companyAddress"));
	    productMember.setCompanyPhone(rs.getString("companyPhone"));
	    productMember.setS_image(rs.getString("s_image"));
	    productMember.setType(rs.getString("type"));
	    productMember.setC_image(rs.getString("c_image"));
	    return productMember;
	}

}