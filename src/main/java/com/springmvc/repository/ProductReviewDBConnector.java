package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.springmvc.domain.ProductReview;

public class ProductReviewDBConnector implements RowMapper<ProductReview>{

	public ProductReview mapRow(ResultSet rs, int rowNum) throws SQLException{
		ProductReview productReview = new ProductReview();
		productReview.setReviewId(rs.getInt("reviewId"));
		productReview.setContext(rs.getString("context"));
		productReview.setReviewScore(rs.getInt("reviewScore"));
		productReview.setReviewImage(rs.getString("reviewImage"));
		productReview.setPurchaseTime(rs.getDate("purchaseTime"));
		productReview.setTitle(rs.getString("title"));
		productReview.setProductId(rs.getString("productId"));
		productReview.setPersonId(rs.getString("personId"));
		
		return productReview;
	}
}
