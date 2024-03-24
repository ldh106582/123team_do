package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import org.springframework.jdbc.core.RowMapper;
import com.springmvc.domain.Order;

public class OrderDBConnector implements RowMapper<Order>{
	public Order mapRow(ResultSet rs, int rowNum) throws SQLException{
		Order order = new Order();
		order.setOderNum(rs.getInt("orderNum"));
		order.setProductId(rs.getString("productId"));
		order.setProductName(rs.getString("productName"));
		order.setAmount(rs.getInt("amount"));
		order.setPrice(rs.getInt("price"));
		order.setOrderDate(rs.getObject("orderDate", LocalDate.class));
		order.setTotalPrice(rs.getInt("totalPrice"));
		order.setPersonId(rs.getString("personId"));
		order.setManagerId(rs.getString("managerId"));
		order.setState(rs.getString("state"));
		return order;
	}
}
