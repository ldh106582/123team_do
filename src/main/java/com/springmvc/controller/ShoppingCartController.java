package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.springmvc.domain.Person;
import com.springmvc.domain.Product;
import com.springmvc.domain.ShoppingCart;
import com.springmvc.service.ShoppingCartService;

@Controller
@RequestMapping("/products")
public class ShoppingCartController {

	@Autowired
	private ShoppingCartService shoppingCartService;
	
	@PostMapping("/creatCart")
	public String CreateCart(@ModelAttribute("product") Product product, HttpServletRequest request) {
		System.out.println("productId create : " + product.getProductId());
		
		HttpSession session = request.getSession();
		Person person = (Person) session.getAttribute("id");
		String personId = person.getPersonId();
		
		// 장바구니에 이미 값이 있는지 확인하는 함수
		int c_living = shoppingCartService.c_readshoppingCart(personId);
		
		//값을 읽어왔을 실행하는 함수
		if(c_living == 0) {
			// 쇼핑카트를 만들어주는 함수
			System.out.println("해당 아이디의 쇼핑카트가 존재하지 않으므로 생성합니다.");
			product.setPersonId(personId);
			shoppingCartService.D_createshoppingCart(product);
		} else {
			
			System.out.println("해당 아이디의 쇼핑카트가 존재므로 amount만 추가합니다.");
			// 쇼핑카트가 존재함하여 값을 가져오는 함수
			ShoppingCart shoppingCart = shoppingCartService.DS_createshoppingCart(personId);
			// 쇼핑카트가 존재함으로 amout를 1증가 시켜주는 함수

			shoppingCartService.DP_createshoppingCart(shoppingCart);
		}		
		
		 return "redirect:/products";
	}
	
	// 주문완료 페이지 POST의 경우 ORDERCONTROLLER에 있음
	@GetMapping("/readcart")
	public String ReadCart(HttpServletRequest request, Model model) 
	{
		HttpSession session = request.getSession();
		Person person = (Person)session.getAttribute("id");
		String personId = person.getPersonId();
		System.out.println("장바구니 read : " + personId);
		// 장바구니에 있는 데이터를 가져옴
		List<ShoppingCart> shoppingCart = shoppingCartService.readCart(personId);
		
		int totalPrice = 0;
		int allprice = 0 + 2500;
		for(int i = 0; i < shoppingCart.size(); i++) {
			int amount = shoppingCart.get(i).getAmount();
			int price = shoppingCart.get(i).getProductPrice();
			totalPrice = amount * price;
			allprice += totalPrice; 
		}
		System.out.println("allprice : " + allprice);
		model.addAttribute("allprice", allprice);
		
		if(shoppingCart.isEmpty()) 
		{
			System.out.println("값이 존재하지 않습니다.");
			request.setAttribute("notThing", "값이 존재하지 않습니다." );
		return "all_product/shoppingcart";
		} 
		else 
		{
			System.out.println(shoppingCart.get(0).getAmount());
			// 장바구니를 model에 담음 view에 보여주기 위함
			model.addAttribute("shoppingCart", shoppingCart);
		return "all_product/shoppingcart";
		}
	}
	
	// 쇼핑카트를 전부 삭제하는 함수
	@GetMapping("/alldelete")
	public String AllDeleteCart(@RequestParam("personId") String personId) {
		
		System.out.println("all delete : " + personId);
		shoppingCartService.alldeleteCart(personId);
		return "redirect:/products";
	}
	// 쇼핑카트 update 후 데이터를 db에 넣어주는 함수
	@PostMapping("/addcart")
	public String Setupdatecart(@RequestParam String productId, 
								@RequestParam("amount") List<Integer> amounts, Model model,
								HttpServletRequest request) {
		System.out.println("addcart : " + productId);
		String shoppingCartId = request.getParameter("shoppingCartId");
		String personId = request.getParameter("personId");
		String productName = request.getParameter("productName");
		
		int allAmount = 0;
		
		for(int i = 0; i < amounts.size(); i++) {
			int amount = amounts.get(0);
			allAmount += amount;
		}
		
		System.out.println("shoppingCartId : " + shoppingCartId + ", amount : "+ allAmount + ", personId : " + personId + ", productName : " + productName);
		
		ShoppingCart shoppingCart = new ShoppingCart();
		shoppingCart.setShoppingCartId(shoppingCartId);
		shoppingCart.setProductId(productId);
		shoppingCart.setProductName(productName);
		shoppingCart.setAmount(allAmount);
		shoppingCart.setPersonId(personId);
		
		// 쇼핑카트에 값을 담아주는 함수
		shoppingCartService.setupdatecart(shoppingCart);
		// db에서 값을 가져오는 함수
		List<ShoppingCart> listOfCart = shoppingCartService.getupdatecart(productId);
		

		
		model.addAttribute("listOfCart", listOfCart);
		return "redirect:/products/readcart?personId=" + personId;
	}
	// 카트에 있는 product를 개별적으로 삭제하는 함수
	@GetMapping("/cartdelete")
	public String DeleteCart(@RequestParam(name="shoppingCartId", required = false) int shoppingCartId,
							HttpServletRequest request) {
		String personId = request.getParameter("personId");
//		System.out.println("delete 도착 : " + personId);
		
		if(shoppingCartId != 0) {
		// 개별 product를 삭제하는 함수
		shoppingCartService.deleteCart(shoppingCartId);
		return "redirect:/products/readcart?personId=" + personId;
		} else {
			return "redirect:/products/readcart?personId=" + personId;
		}
	}
}
