package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Order;
import com.springmvc.domain.Person;
import com.springmvc.domain.Product;
import com.springmvc.domain.ProductReview;

public interface ProductService {

	List<Product> getProductsList();

	Product getProductById(String productId);

	void addProduct(Product product);

	void updateProduct(Product product, String productId);

	void deleteProduct(String producId);
	
	// product 전체 구매목록을 가져옴
	List<ProductReview> getp_Orderdate(String productId);
	

	
	//리뷰 값을 db에 담는 함수
	void setproductReview(ProductReview productReview);
	// 상품을 작성했던 리뷰 내용을 가져오는 함수
	ProductReview getUpdateReview(String personId, int reviewId);
	// 상품을 작성했던 리뷰 내용을 수정하는 함수
	void setUpdateReview(ProductReview productReview, int reviewId);
	// 리뷰를 삭제하는 함수
	void setdeleteReview(int reviewId);

	List<Product> getProductByName(String context);

	long getSales(String personId);

	int getOrders(String personId);

	int getNumOfProduct(String personId);

	List<Order> getPermissionList(String personId);

	void setdecission(String dec, String num);

	List<Order> getorderList(String personId);
	
	List<Order> getsalse(String personId);
	
	List<Product> getProduct(String personId);
}