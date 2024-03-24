package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.springmvc.domain.PetChart;

public class PetChartDBConnector implements RowMapper<PetChart> {
	public PetChart mapRow(ResultSet rs, int rowNum) throws SQLException {
		PetChart petChart = new PetChart();

		petChart.setPetChartNum(rs.getInt(1));
		petChart.setPetChartDate(rs.getDate(2).toLocalDate());
		petChart.setPetChart(rs.getString(3));
		petChart.setPetChartContent(rs.getString(4));
		petChart.setPetId(rs.getString(5));
		return petChart;
	}
}
