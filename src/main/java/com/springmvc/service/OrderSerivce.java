package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.type;
import com.springmvc.domain.Order;
import com.springmvc.domain.Person;
import com.springmvc.domain.ProductMember;
import com.springmvc.domain.ShoppingCart;

public interface OrderSerivce {

	// 주문완료 페이지
	List<ShoppingCart> oderRead(String personId);
	
	// 개별 고객의 정보를 가져오는 함수
	List<Person> P_OderRead(String personId);
	
	// 관리자의 정보를 가져오는 함수
	List<ProductMember> M_OderRead(String personId);
	
	// 장바구니에서 받아온 데이터를 order db에 넣음
	void Ordercreate(Order order);
	
	//장바구니에 있는 데이터를 가져오는 함수
	Person GetOrdercreate(String personId);
	// product테이블 재고를 관리하는 함수
	void SetminusProduct(String productId, int productUnitStock, String personId);

}
