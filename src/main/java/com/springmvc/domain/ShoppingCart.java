package com.springmvc.domain;

import java.io.Serializable;

// 2024-02-22
@SuppressWarnings("serial")
public class ShoppingCart implements Serializable{
	private String shoppingCartId;
	private String productId;
	private String productName;
	private int productPrice;
	private String productCategory;
	private int amount;
	private String personId;
	private String productImage;

	
	public ShoppingCart() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getShoppingCartId() {
		return shoppingCartId;
	}


	public void setShoppingCartId(String shoppingCartId) {
		this.shoppingCartId = shoppingCartId;
	}


	public String getProductId() {
		return productId;
	}


	public void setProductId(String productId) {
		this.productId = productId;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public int getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}


	public String getProductCategory() {
		return productCategory;
	}


	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public String getPersonId() {
		return personId;
	}


	public void setPersonId(String personId) {
		this.personId = personId;
	}


	public String getProductImage() {
		return productImage;
	}


	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}



	

}