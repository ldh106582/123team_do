package com.springmvc.domain;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;

@SuppressWarnings("serial")
public class Order implements Serializable
{
	private int oderNum;
	private String productId;
	private String productName;
	private int amount;
	private int price;
	private LocalDate orderDate;
	private int totalPrice;
	private String personId;
	private String personName;
	private String personPhone;
	private String personAddress;
	private String managerId;
	private String state;
	private String addr;
	
	public Order() 
	{
		super();
		// TODO Auto-generated constructor stub
	}




	public int getOderNum() {
		return oderNum;
	}




	public void setOderNum(int oderNum) {
		this.oderNum = oderNum;
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




	public int getAmount() {
		return amount;
	}




	public void setAmount(int amount) {
		this.amount = amount;
	}




	public int getPrice() {
		return price;
	}




	public void setPrice(int price) {
		this.price = price;
	}



	public LocalDate getOrderDate() {
		return orderDate;
	}




	public void setOrderDate(LocalDate orderDate) {
		this.orderDate = orderDate;
	}




	public int getTotalPrice() {
		return totalPrice;
	}




	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}




	public String getPersonId() {
		return personId;
	}




	public void setPersonId(String personId) {
		this.personId = personId;
	}




	public String getPersonName() {
		return personName;
	}




	public void setPersonName(String personName) {
		this.personName = personName;
	}




	public String getPersonPhone() {
		return personPhone;
	}




	public void setPersonPhone(String personPhone) {
		this.personPhone = personPhone;
	}




	public String getPersonAddress() {
		return personAddress;
	}




	public void setPersonAddress(String personAddress) {
		this.personAddress = personAddress;
	}




	public String getManagerId() {
		return managerId;
	}




	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}




	public String getState() {
		return state;
	}




	public void setState(String state) {
		this.state = state;
	}




	public String getAddr() {
		return addr;
	}




	public void setAddr(String addr) {
		this.addr = addr;
	}

	
	
	
	
}