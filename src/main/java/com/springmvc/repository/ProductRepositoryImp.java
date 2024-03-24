package com.springmvc.repository;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.springmvc.domain.Order;
import com.springmvc.domain.Product;
import com.springmvc.domain.ProductReview;
import com.springmvc.service.ProductService;


@Repository
public class ProductRepositoryImp implements ProductRepository{
	
	@Autowired
	ProductService productService;
	
	 private JdbcTemplate template;
	 
	 @Autowired
	 public void setJdbctemplate(DataSource dataSource) {
		 this.template = new JdbcTemplate(dataSource);
	 }

	@Override
	public List<Product> getProductsList() {
		System.out.println("product 오류 호가인 32");
		String SQL = "select * from Product";
		System.out.println("product 오류 호가인 33");
		List<Product> list = template.query(SQL, new ProductRowMapper());
		System.out.println("product 오류 호가인 34");
		for(int i = 0; i < list.size(); i++) 
		{
			System.out.println(i);
		}
		return list;
	}

	@Override
	public Product getProductById(String productId) {
		String SQL = "select * from Product";
		List<Product> list = template.query(SQL, new ProductRowMapper()); 
		Product p = null;
		for(int i=0;i<list.size();i++) {
			p = list.get(i);
			if(p.getProductId().equals(productId)) {
				break;
			}
		}
		return p;
	}

	@Override
	public void addProduct(Product product) {
		String SQL = "insert into Product values(?,?,?,?,?,?,?,?,?,?,?,?)";
		
		template.update(SQL,getProductId(),  product.getProductName(), product.getProductPrice(), product.getProductCategory(), product.getProductDescribe(), getReleaseDate(), product.getProductUnitStock(),product.getProductImage() ,product.getPersonId(), product.getAnimalCategory(),0,0);
		
	}

//	날짜받기
	public LocalDate getReleaseDate()
	{
		return LocalDate.now();
	}
//	ProductId 생성
	public String getProductId() {
		String str = Long.toString(System.currentTimeMillis()) ;
		return str;
	}

	@Override
	public void updateProduct(Product product, String productId) {
		String SQL = "update Product set ProductName=?,ProductPrice=?,ProductCategory=?,ProductDscription=?,ProductUnitStock=?,ProductImage=? where ProductId='"+productId+"'";
		template.update(SQL,product.getProductName(),product.getProductPrice(),product.getProductCategory(),product.getProductCategory(),product.getProductUnitStock(),product.getProductImage(),product.getAnimalCategory());
	}

	@Override
	public void deleteProduct(String producId) {
		String SQL = "DELETE FROM Product where ProductId='"+producId+"'";
		template.update(SQL);
		
	}
	// product 전체 구매목록을 가져옴
	@Override
	public List<ProductReview> getp_Orderdate(String productId) {
		String SQL = "select * from ProductReview where productId=?";
		List<ProductReview> listOfProductReview = new ArrayList<ProductReview>();
		listOfProductReview = template.query(SQL, new Object[] {productId} ,new ProductReviewDBConnector());
	    if (!listOfProductReview.isEmpty()) {
	        // 리스트의 크기를 확인하여 올바른 인덱스 사용
	        System.out.println(listOfProductReview.get(0));
	    } else {
	        System.out.println("리스트가 비어 있습니다.");
	    }
		return listOfProductReview;
	}
	
	

	//리뷰 값을 db에 담는 함수
	@Override
	public void setproductReview(ProductReview productReview) {
		String SQL = "insert into ProductReview (context, ReviewScore, purchaseTime, title, productId, personId, reviewImage) values(?,?,?,?,?,?,?)";
		template.update(SQL, productReview.getContext(), productReview.getReviewScore(), productReview.getPurchaseTime(), productReview.getTitle(),
				productReview.getProductId(), productReview.getPersonId(), productReview.getReviewImage());
		
		Product product = productService.getProductById(productReview.getProductId());
		String productId = product.getProductId();
//		리뷰평균
		String SQL2 = "select avg(reviewScore) from ProductReview where productId='"+productId+"'";
		Double avg = template.queryForObject(SQL2, Double.class);
//		리뷰개수
		String SQL3 = "select count(*) from ProductReview where productId='"+productId+"'";
		float count = template.queryForObject(SQL3, int.class);
//		업데이트
		String SQL4 = "update Product set reviewScore=?,reviewCount=? where productId=?";
		template.update(SQL4,avg,count,productId);
	}
	// 상품을 작성했던 리뷰 내용을 수정하는 함수
	@Override
	public ProductReview getUpdateReview(String personId, int reviewId) {
		ProductReview productReview = null;
		String SQL = "select * from ProductReview where personId=? and reviewId=?";
		productReview = template.queryForObject(SQL, new Object[] {personId, reviewId}, new ProductReviewDBConnector());
		return productReview;
	}
	
	public ProductReview getReviewById(int reviewId) {
		ProductReview productReview = null;
		String SQL = "select * from ProductReview where reviewId=?";
		productReview = template.queryForObject(SQL, new Object[] {reviewId}, new ProductReviewDBConnector());
		return productReview;
	}
	
	// 상품을 작성했던 리뷰 내용을 수정하는 함수
	@Override
	public void setUpdateReview(ProductReview productReview, int reviewId) {
		ProductReview Nreview = getReviewById(reviewId);
		String SQL = "UPDATE ProductReview SET title=?, ReviewScore=?, context=? where reviewId=?";
		template.update(SQL, productReview.getTitle(), productReview.getReviewScore(), productReview.getContext(), productReview.getReviewId());
		

		Product product = productService.getProductById(Nreview.getProductId());
		String productId = product.getProductId();
//		리뷰평균
		String SQL2 = "select avg(reviewScore) from ProductReview where productId='"+productId+"'";
		Double avg = template.queryForObject(SQL2, Double.class);
//		리뷰개수
		String SQL3 = "select count(*) from ProductReview where productId='"+productId+"'";
		float count = template.queryForObject(SQL3, int.class);
//		업데이트
		String SQL4 = "update Product set reviewScore=?,reviewCount=? where productId=?";
		template.update(SQL4,avg,count,productId);
	}
	// 리뷰를 삭제하는 함수
	@Override
	public void setdeleteReview(int reviewId) {
		ProductReview Nreview = getReviewById(reviewId);
		
		String SQL = "delete from ProductReview where reviewId=?";
		template.update(SQL, reviewId);
		
		Product product = productService.getProductById(Nreview.getProductId());
		String productId = product.getProductId();
//		리뷰평균
		String SQL2 = "select avg(reviewScore) from ProductReview where productId='"+productId+"'";
		Double avg = template.queryForObject(SQL2, Double.class);
//		리뷰개수
		String SQL3 = "select count(*) from ProductReview where productId='"+productId+"'";
		float count = template.queryForObject(SQL3, int.class);
//		업데이트
		String SQL4 = "update Product set reviewScore=?,reviewCount=? where productId=?";
		template.update(SQL4,avg,count,productId);
	}

	@Override
	public List<Product> getProductByName(String context) {
		try {
			String SQL = "select * from Product where ProductName like'%"+context+"%'";
			List<Product> list = template.query(SQL, new ProductRowMapper());
	        
	        if (list.isEmpty()) {
	            System.out.println("해당 제목은 없음");
	        }
	        return list;
	    } catch (Exception e) {
	        // 예외 처리
	        e.printStackTrace();
	        return null; 
	    }
		
	}

	@Override
	public long getSales(String personId) {
		System.out.println("salse도착 rr");
		String SQL = "select sum(totalPrice) from Ordertable where managerId='"+personId+"'";
		System.out.println("salse도착 r2");
		Long sale = template.queryForObject(SQL, Long.class);
	    System.out.println("rowNum : " + sale);;
	    if(sale != null) 
	    {
		    return sale;
	    }
	    else 
	    {
	    	sale = (long) 0;
	    	return sale;
	    }
      

	}

	@Override
	public int getOrders(String personId) {
		String SQL = "select count(*) from Ordertable where managerId='"+personId+"'";
		int orders = template.queryForObject(SQL, Integer.class);
		System.out.println(orders);
		return orders;
	}

	@Override
	public int getNumOfProduct(String personId) {
		String SQL = "select count(*) from Product where PersonId='"+personId+"'";
		int num = template.queryForObject(SQL, Integer.class);
		
		return num;
	}

	@Override
	public List<Order> getPermissionList(String personId) {
		String SQL = "select * from Ordertable where managerId='"+personId+"' and state='처리중'";
		List<Order> list = template.query(SQL, new OrderDBConnector());
		return list;
	}

	@Override
	public void setdecission(String dec, String num) {
		String SQL = "update Ordertable set state = ? where orderNum=?";
		template.update(SQL,dec,num);
	}

	@Override
	public List<Order> getorderList(String personId) {
		String SQL = "select * from Ordertable where personId='"+personId+"'";
		 List<Order> list =template.query(SQL, new OrderDBConnector());
		return list;
	}

	@Override
	public List<Order> getsalse(String personId) {
		String SQL = "select * from Ordertable where personId='"+personId+"'";
		 List<Order> listOfOrder =template.query(SQL, new OrderDBConnector());
		return listOfOrder;
	}

	@Override
	public List<Product> getProduct(String personId) {
		String SQL = "select * from Product where personId='"+personId+"'";
		List<Product> listOfproduct = template.query(SQL, new ProductRowMapper());
		return listOfproduct;
	}
	
	
	
	
	
}
