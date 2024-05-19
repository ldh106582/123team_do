package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.springmvc.controller.ShoppingCartController;
import com.springmvc.domain.Person;
import com.springmvc.domain.Product;
import com.springmvc.domain.ShoppingCart;

@Repository
public class ShoppingCartRepositoryImp implements ShoppingCartRepository{
	 
	public ShoppingCartRepositoryImp() {
		super();
		// TODO Auto-generated constructor stub
	}
	private JdbcTemplate template;
	
	@Autowired
	     public void setJdbctemplate(DataSource dataSource) {
	         this.template = new JdbcTemplate(dataSource);
	     }
	
	// 도현_장바구니에 이미 값이 있는지 확인하는 함수
	 @Override
	public int c_readshoppingCart(String perosnId)
	 {
		String SQL = "select count(*) from ShoppingCart where personId=?";
		Integer intNum = template.queryForObject(SQL, Integer.class, perosnId);
		if(intNum != 0) 
		{
			System.out.println("해당" + perosnId + "의 쇼핑카트가 존재합니다.");
			return 1;
		} 
		else 
		{
			System.out.println("해당" + perosnId + "의 쇼핑카트가 존재하지 않습니다.");
			return 0;		
		}
	}
	// 도현_쇼핑카트를 만들어주는 함수
	 @Override
		public void D_createshoppingCart(Product product)
	 	{
		 		int amount = 1;
		        String SQL = "INSERT INTO ShoppingCart (ProductId, ProductName, ProductPrice, ProductCategory, Amount, PersonId) VALUES (?,?,?,?,?,?)";
		        template.update(SQL, product.getProductId(), product.getProductName(), product.getProductPrice(), product.getProductCategory(), amount, product.getPersonId());
		} 
	 
	// 도현_쇼핑카트가 존재함하여 값을 가져오는 함수
	@Override
	public ShoppingCart DS_createshoppingCart(String personId) 
	{		
		ShoppingCart shoppingCart = null;
		String SQL = "select * from ShoppingCart where personId=?";
		shoppingCart = template.queryForObject(SQL, new Object[] {personId}, new ShoppingCartDBConnector());
		return shoppingCart;
	}
	
	// 도현_쇼핑카트가 존재함으로 amout를 1증가 시켜주는 함수
	@Override
	public void DP_createshoppingCart(ShoppingCart shoppingCart) 
	{
		String SQL = "UPDATE ShoppingCart SET amount = amount + 1 WHERE productId = ? AND personId = ?";
		template.update(SQL, shoppingCart.getProductId(), shoppingCart.getPersonId());
	}
	
	// 도현_장바구니에 있는 데이터를 가져옴
	@Override
	public List<ShoppingCart> readCart(String personId) 
	{
		
		List<ShoppingCart> listShoppingCart = new ArrayList<ShoppingCart>();
		
		String SQL = "select count(*) from ShoppingCart where PersonId=?";
		Integer intNum =  template.queryForObject(SQL, Integer.class, personId);
		ShoppingCart shoppingCart = null;
		if(intNum != null) {
			SQL = "select * from ShoppingCart where PersonId=?";
			listShoppingCart = template.query(SQL, new Object[] {personId}, new ShoppingCartDBConnector());
			return listShoppingCart;
		}
		System.out.println("해당 아이디의 장바구니가 없습니다.");
		return null;
	}
	
	// 도현_장바구니를 삭제하는 함수

	@Override
	public void alldeleteCart(String personId)
	{
		String SQL = "delete from ShoppingCart where PersonId =?";
		template.update(SQL, personId);
	}
	
	//도현_업데이트 하기 전 데이터를 출력하는 함수
	@Override
	public List<ShoppingCart> addShopingCart(String personId) 
	{
		
		List<ShoppingCart> listOfCart = new ArrayList<ShoppingCart>();
		
		String SQL = "select count(*) from ShoppingCart where PersonId=?";
		Integer intNum = template.queryForObject(SQL, Integer.class, personId);
		if(intNum != null) {
			SQL = "select * from ShoppingCart where PersonId=?";
			listOfCart = template.query(SQL, new Object[] {personId}, new ShoppingCartDBConnector());
			return listOfCart; 
		}
		System.out.println("해당하는 정보가 존재하지 않습니다.");
		return null;
	}
	
	// 도현_쇼핑카트 update 후 데이터를 db에 넣어주는 함수
	@Override
	public void setupdatecart(ShoppingCart shoppingCart) 
	{
		String SQL = "update ShoppingCart set Amount=? where ProductId=? and PersonId=? and shoppingCartId=?";
		template.update(SQL, shoppingCart.getAmount(), shoppingCart.getProductId(), shoppingCart.getPersonId(), shoppingCart.getShoppingCartId());
	}
	// 도현_db에서 값을 가져오는 함수
	@Override
	public List<ShoppingCart> getupdatecart(String productId) 
	{
		String SQL = "select count(*) from ShoppingCart where ProductId=?";
		int intNum = template.queryForObject(SQL, Integer.class, productId);
		List<ShoppingCart> listOfCart = null;
		if(intNum != 0) 
		{
			SQL = "select * from ShoppingCart where ProductId=?";
			listOfCart = template.query(SQL, new Object[] {productId}, new ShoppingCartDBConnector());
			return listOfCart;
		}
		else
		{
			System.out.println("장바구니 update 실패");
			return null;
		}
	}
	
	// 도현_개별 product를 삭제하는 함수
	@Override
	public void deleteCart(int shoppingCartId) 
	{
		String SQL = "delete from ShoppingCart where shoppingCartId=?";
		template.update(SQL, shoppingCartId);
		
	}
	
	
	
}
