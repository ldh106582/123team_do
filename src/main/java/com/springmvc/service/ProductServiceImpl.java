package com.springmvc.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.springmvc.domain.Order;
import com.springmvc.domain.Person;
import com.springmvc.domain.Product;
import com.springmvc.domain.ProductReview;
import com.springmvc.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductRepository productRepository;
	
	@Override
	public List<Product> getProductsList() {
		return productRepository.getProductsList();
	}

	@Override
	public Product getProductById(String productId) {
		return productRepository.getProductById(productId);
	}

	@Override
	public void addProduct(Product product) {
		productRepository.addProduct(product);
		
	}

	@Override
	public void updateProduct(Product product, String productId) {
		productRepository.updateProduct(product,productId);
	}

	@Override
	public void deleteProduct(String producId) {
		productRepository.deleteProduct(producId);
	}
	
	// product 전체 구매목록을 가져옴
	@Override
	public List<ProductReview> getp_Orderdate(String productId) {
		// TODO Auto-generated method stub
		return productRepository.getp_Orderdate(productId);
	}
	
	
	

	//리뷰 값을 db에 담는 함수
	@Override
	public void setproductReview(ProductReview productReview) {
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = dateFormat.format(currentDate);
	
	    productRepository.setproductReview(productReview);
	}
	// 상품을 작성했던 리뷰 내용을 가져오는 함수

	@Override
	public ProductReview getUpdateReview(String personId, int reviewId) {
		// TODO Auto-generated method stub
		return productRepository.getUpdateReview(personId, reviewId);
	}
	// 상품을 작성했던 리뷰 내용을 수정하는 함수
	@Override
	public void setUpdateReview(ProductReview productReview, int reviewId ) {
		// TODO Auto-generated method stub
		productRepository.setUpdateReview(productReview, reviewId);
	}
	// 리뷰를 삭제하는 함수
	@Override
	public void setdeleteReview(int reviewId) {
		// TODO Auto-generated method stub
		productRepository.setdeleteReview(reviewId);
	}

	@Override
	public List<Product> getProductByName(String context) {
		return productRepository.getProductByName(context);
		
	}

	@Override
	public long getSales(String personId) {
		// TODO Auto-generated method stub
		return productRepository.getSales(personId);
	}

	@Override
	public int getOrders(String personId) {
		// TODO Auto-generated method stub
		return productRepository.getOrders(personId);
	}

	@Override
	public int getNumOfProduct(String personId) {
		// TODO Auto-generated method stub
		return productRepository.getNumOfProduct(personId);
	}

	@Override
	public List<Order> getPermissionList(String personId) {
		// TODO Auto-generated method stub
		return productRepository.getPermissionList(personId);
	}

	@Override
	public void setdecission(String dec, String num) {
		// TODO Auto-generated method stub
		productRepository.setdecission(dec,num);
	}

	@Override
	public List<Order> getorderList(String personId) {
		// TODO Auto-generated method stub
		return productRepository.getorderList(personId);
	}

	@Override
	public List<Order> getsalse(String personId) {
		// TODO Auto-generated method stub
		return productRepository.getsalse(personId);
	}

	@Override
	public List<Product> getProduct(String personId) {
		// TODO Auto-generated method stub
		return productRepository.getProduct(personId);
	}
	
	
	
	
}