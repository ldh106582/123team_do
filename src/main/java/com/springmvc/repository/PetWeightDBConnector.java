package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.springmvc.domain.PetWeight;

public class PetWeightDBConnector implements RowMapper<PetWeight>{
    public PetWeight mapRow(ResultSet rs, int rowNum) throws SQLException {
        PetWeight petWeight = new PetWeight();
        petWeight.setPetWeightNum(rs.getInt(1));
        petWeight.setPetWeightDate(rs.getDate(2).toLocalDate());
        petWeight.setPetWeight(rs.getString(3));
        petWeight.setPetId(rs.getString(4));
        
        return petWeight;
    }
}
