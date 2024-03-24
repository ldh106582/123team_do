package com.springmvc.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.springmvc.controller.ShoppingCartController;
import com.springmvc.domain.Product;
import com.springmvc.domain.ShoppingCart;

public interface ShoppingCartService {
	
	// 장바구니에 이미 값이 있는지 확인하는 함수
	int c_readshoppingCart(String perosnId);
	// 쇼핑카트를 만들어주는 함수
	void D_createshoppingCart(Product product);
	// 쇼핑카트가 존재함하여 값을 가져오는 함수
	ShoppingCart DS_createshoppingCart(String perosnId);
	// 쇼핑카트가 존재함으로 amout를 1증가 시켜주는 함수
	void DP_createshoppingCart(ShoppingCart shoppingCart);
	
	// 장바구니에 있는 데이터를 가져옴
	List<ShoppingCart> readCart(String personId);
	// 장바구니를 삭제하는 함수
	void alldeleteCart(String personId);
	//업데이트 하기 전 데이터를 출력하는 함수
	List<ShoppingCart> addShopingCart(String personId);
	// 쇼핑카트 update 후 데이터를 db에 넣어주는 함수
	void setupdatecart(ShoppingCart shoppingCart);
	// db에서 값을 가져오는 함수
	List<ShoppingCart> getupdatecart(String productId);
	// 개별 product를 삭제하는 함수
	void deleteCart(int shoppingCartId);
	
}
