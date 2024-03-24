package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.type;
import com.springmvc.domain.Order;
import com.springmvc.domain.Person;
import com.springmvc.domain.ProductMember;
import com.springmvc.domain.ShoppingCart;

@Repository
public class OrderRepositoryImp implements OrderRepository{
	
	 private JdbcTemplate template;

	 @Autowired
	     public void setJdbctemplate(DataSource dataSource) {
	         this.template = new JdbcTemplate(dataSource);
	     }

	@Override
	public List<ShoppingCart> oderRead(String personId) {
		List<ShoppingCart> listOfCart = new ArrayList<ShoppingCart>();
		String SQL = "select count(*) from ShoppingCart where personId=?";
		int intNum = template.queryForObject(SQL, Integer.class, personId);
		if(intNum != 0) {
			SQL = "select * from ShoppingCart where personId=?";
			listOfCart = template.query(SQL, new Object[] {personId}, new ShoppingCartDBConnector());
			return listOfCart;
		}else {
			System.out.println("order read 값이 없습니다.");
			return null;
		}
	}
	
	// 개별 고객의 정보를 가져오는 함수
	@Override
	public List<Person> P_OderRead(String personId) {
		String SQL = "select count(*) from Person where personId=?";
		int intNum = template.queryForObject(SQL, Integer.class, personId);
		if(intNum != 0) {
			SQL = "select * from Person where personId=?";
			List<Person> listOfperson = template.query(SQL, new Object[] {personId}, new PersonDBConnector());
			return listOfperson;
		} else {
			return null;
		}
	}
	// 관리자의 정보를 가져오는 함수
	@Override
	public List<ProductMember> M_OderRead(String personId) {
		String SQL = "select count(*) from ProductMember where personId=?";
		int intNum = template.queryForObject(SQL, Integer.class, personId);
		if(intNum != 0) {
			SQL = "select * from ProductMember where personId=?";
			List<ProductMember> listOfproduct = template.query(SQL, new Object[] {personId}, new ProductMemberDBConnector());
			return listOfproduct;
		} else {
			return null;
		}
	}
	// 장바구니에서 받아온 데이터를 order db에 넣음
	@Override
	public void Ordercreate(Order order) {
		String SQL = "insert into Ordertable (ProductId, ProductName, Amount, Price, OrderDate, TotalPrice, PersonId,managerId,state) values(?,?,?,?,?,?,?,?,?)";
		
		template.update(SQL, order.getProductId(), order.getProductName(), order.getAmount(), order.getPrice(),
				order.getOrderDate(), order.getTotalPrice(), order.getPersonId(),order.getManagerId(),order.getState());
	}
	
	//장바구니에 있는 데이터를 가져오는 함수
	@Override
	public Person GetOrdercreate(String personId) {
		String SQL = "select count(*) from person where personId =?";
		int intNum = template.queryForObject(SQL, Integer.class, personId);
		if(intNum != 0) {
			SQL = "select * from person where personId =?";
			Person person = template.queryForObject(SQL, new Object[] {personId}, new PersonDBConnector());
		return person;
		} else {
			System.out.println("order 값이 없습니다.");
			return null;
		}
	}
	// product테이블 재고를 관리하는 함수
	@Override
	public void SetminusProduct(String productId, int productUnitStock,String personId) {
		for(int i = 0; i < 1; i++) {
		String SQL = "update Product set ProductUnitStock = ProductUnitStock - ? where ProductId = ?";
		template.update(SQL, productUnitStock,productId);
		
		String SQL1 = "delete from ShoppingCart where productId = ? and personId=?";
		template.update(SQL1, productId, personId);
		}
	}

	
	
}