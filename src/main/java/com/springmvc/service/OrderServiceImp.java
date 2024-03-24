package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.type;
import com.springmvc.domain.Order;
import com.springmvc.domain.Person;
import com.springmvc.domain.ProductMember;
import com.springmvc.domain.ShoppingCart;
import com.springmvc.repository.*;

@Service
public class OrderServiceImp implements OrderSerivce{

	@Autowired
	private OrderRepository OrderRepository;
	// 주문완료 페이지
	@Override
	public List<ShoppingCart> oderRead(String personId) {
		return OrderRepository.oderRead(personId);
	}
	
	// 개별 고객의 정보를 가져오는 함수
	@Override
	public List<Person> P_OderRead(String personId) {
		// TODO Auto-generated method stub
		return OrderRepository.P_OderRead(personId);
	}
	// 관리자의 정보를 가져오는 함수
	@Override
	public List<ProductMember> M_OderRead(String personId) {
		// TODO Auto-generated method stub
		return OrderRepository.M_OderRead(personId);
	}
	// 장바구니에서 받아온 데이터를 order db에 넣음
	@Override
	public void Ordercreate(Order order) {
		// TODO Auto-generated method stub
		OrderRepository.Ordercreate(order);
	}
	
	//장바구니에 있는 데이터를 가져오는 함수
	@Override
	public Person GetOrdercreate(String personId) {
		// TODO Auto-generated method stub
		return OrderRepository.GetOrdercreate(personId);
	}
	// product테이블 재고를 관리하는 함수
	@Override
	public void SetminusProduct(String productId, int productUnitStock, String personId) {
		// TODO Auto-generated method stub
		OrderRepository.SetminusProduct(productId, productUnitStock, personId);
	}

	
	
	
}
