package com.springmvc.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.springmvc.domain.Order;
import com.springmvc.domain.Product;
import com.springmvc.domain.ProductReview;
import com.springmvc.domain.QnA;
import com.springmvc.domain.QnAComment;
import com.springmvc.service.ProductService;
import com.springmvc.service.QnAService;
import com.springmvc.service.QnAcommentservice;


@Controller
@RequestMapping("/products")
public class ProductController {
	
	@Autowired
	ProductService productService;

	@Autowired
	QnAService QnAService;
	
	@Autowired
	QnAcommentservice QnAcommentservice;
//	R
	@RequestMapping
	public String getProductList(Model model) {
		System.out.println("prodcut 오류 확인중");
		model.addAttribute("productList",productService.getProductsList());
		return "all_product/products";
	}
	
	@GetMapping("/product")
	public String getProduct(@RequestParam("productId") String productId,Model model, HttpServletRequest request) 
	{
		//QnA 내용
		List<QnA> listofQnA = QnAService.getAllQnAList(productId);
		List<QnA> NlistofQnA = new ArrayList<QnA>();
		System.out.println(listofQnA);
		
		QnA qna = null;
		String qnaId = null;
		List<QnAComment> commentlist = new ArrayList<QnAComment>();
		
		
		for(int i=0; i<listofQnA.size(); i++) {
			qna = listofQnA.get(i);
			qnaId = qna.getQnaId();
			System.out.println(qnaId);
			System.out.println("=======================================");

			commentlist = QnAcommentservice.getcommentbyId(qnaId);
			System.out.println(commentlist.size());
			qna.setCommentlist(commentlist);
			NlistofQnA.add(qna);
		}

		model.addAttribute("listofQnA", NlistofQnA);
		

		
		// 리뷰에 대한 내용을 가져옴
		System.out.println("여긴 product 상품 id : "+ productId);
		List<ProductReview> listOfProductReview = productService.getp_Orderdate(productId);
		model.addAttribute("listOfProductReview", listOfProductReview);
		

		Product product = productService.getProductById(productId);
		System.out.println(product.getPersonId());
		model.addAttribute("product", product);
		
		return "all_product/product";
	}
	
// C
	@GetMapping("add")
	public String addProductForm(@ModelAttribute("product") Product product) {
		return "all_product/addProduct";
	}
	
	@PostMapping("add")
	public String addProductProccess(@ModelAttribute("product") Product product, HttpServletRequest request,
									 @RequestParam("s_file") MultipartFile productImage, Model model) {
		String imageName = productImage.getOriginalFilename();
		String imagePatn = request.getSession().getServletContext().getRealPath("/resources/images");
		System.out.println("이미지 경로 : " + imagePatn);
		File file = new File(imagePatn, imageName);
		String personId = (String) request.getSession().getAttribute("personId");
		try 
		{
			productImage.transferTo(file);
			product.setProductImage(imageName);
		}
		catch (Exception e)
		{
			System.out.println("이미지 파일이 존재하지 않습니다." + e);
		}
		product.setPersonId(personId);
		productService.addProduct(product);
		
		
		
		return "redirect:/products";
	}
// U
	@GetMapping("update")
	public String updateProductForm(@ModelAttribute("product") Product product,@RequestParam("productId") String productId,Model model) {
		model.addAttribute("aproduct",productService.getProductById(productId));
		return "all_product/updateProduct";
	}
	
	@PostMapping("update")
	public String updateProductProccess(@ModelAttribute("product") Product product,HttpServletRequest request) {
		String productId = request.getParameter("productId");
		productService.updateProduct(product,productId);
		return "redirect:/products/product?productId="+productId;
	}
// D
	@GetMapping("delete")
	public String deleteProduct(@RequestParam("productId") String producId) {
		productService.deleteProduct(producId);
		return "redirect:/products";
	}
	
	// 상품 리뷰를 사용할 수 있는 사람인지 데이터를 가져오는 함수(read)
	@GetMapping("/p_review")
	public String GetproductReview(@RequestParam("personId") String personId,
							  	   @ModelAttribute("productRE") ProductReview productReview) {
		System.out.println("도착 p_review : " + personId);
		
		return "/all_product/Review";
	}
	// creat
	@PostMapping("/p_review")
	public String SetproductReview(@ModelAttribute("productRE") ProductReview productReview, HttpServletRequest request) {
		
		System.out.println("post도착");

		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");
		String productId = order.getProductId();
		String personId = order.getPersonId();
		
		//리뷰 값을 db에 담는 함수
		productReview.setProductId(productId);
		productReview.setPersonId(personId);
		productService.setproductReview(productReview);
		
		return "redirect:/products/product?productId=" + productId;
	}
	
	// update
	@GetMapping("/u_review")
	public String GetUpdateReview(@RequestParam("personId") String personId, Model model,
								  @RequestParam("reviewId") int reviewId,
								  @ModelAttribute("productURE") ProductReview productReview,  HttpServletRequest request) {
								  
		System.out.println("상품 리뷰 수정 도착 : " + personId);
		
		ProductReview productReviewRE = productService.getUpdateReview(personId, reviewId);
		
		HttpSession session = request.getSession();
		session.setAttribute("productReviewRE", productReviewRE);
		
		return "/all_product/updateReview";
	}
	//update
	@PostMapping("/u_review")
	public String SetUpdateReview(@ModelAttribute("productURE") ProductReview productReview,  HttpServletRequest request) {
		HttpSession session = request.getSession();
		ProductReview productReviewRE = (ProductReview)  session.getAttribute("productReviewRE");
		int reviewId = (int) productReviewRE.getReviewId();
		String productId = (String) productReviewRE.getProductId();
		// 상품을 작성했던 리뷰 내용을 수정하는 함수
		productService.setUpdateReview(productReview, reviewId);
		
		return "redirect:/products/product?productId=" + productId;
	}
	//delete 
	@GetMapping("/d_review")
	public String SetdeleteReview( @RequestParam("reviewId") int reviewId ,HttpServletRequest request) {
		HttpSession session = request.getSession();
		ProductReview productReviewRE = (ProductReview)  session.getAttribute("productReviewRE");
		String productId = (String) productReviewRE.getProductId();
		// 리뷰를 삭제하는 함수
		productService.setdeleteReview(reviewId);
		
		return "redirect:/products/product?productId=" + productId;
	}

//	상품관리자 페이지
	@GetMapping("manager")
	public String managerpage(Model model, HttpSession session,HttpServletRequest request) {
		System.out.println("상품관리자");
		String personId = (String) session.getAttribute("personId");
		System.out.println(personId);
		
		model.addAttribute("sales", productService.getSales(personId));
		System.out.println("sales도착");
		
		model.addAttribute("orders", productService.getOrders(personId));
		System.out.println("orders도착");
		
		model.addAttribute("numofproduct", productService.getNumOfProduct(personId));
		System.out.println("numofproduct도착");
		
		List<Product> listOfproduct = productService.getProduct(personId);
		if(listOfproduct != null) 
		{
			model.addAttribute("listOfproduct", listOfproduct);
		}
		else 
		{
			model.addAttribute("nothing", "등록된 상품이 없습니다.");
		}

		return "/member/ProductManagerPage";
	}
	@GetMapping("permit")
	public String permit(@RequestParam("dec")String dec,@RequestParam("num")String num){
		System.out.println("도착");
		productService.setdecission(dec,num);
		return "redirect:/products/manager";
	}
	
	@GetMapping("myorderList")
	public String getorderList(HttpSession session,Model model) {
		String personId = (String) session.getAttribute("personId");
		model.addAttribute("mylist",productService.getorderList(personId));
		return "/all_product/myOderList";
	}
	
	@GetMapping("myordercheck")
	public String Getmyordercheck(HttpServletRequest request, Model model) {
		System.out.println("myordercheck");
		HttpSession session = request.getSession();
		
		String personId = (String) session.getAttribute("personId");
		
		List<Order> list = productService.getPermissionList(personId);
		System.out.println(list);
		if(list.isEmpty()) {
			request.setAttribute("nothing", " 주문이 없습니다.");
		}
		model.addAttribute("permissionlist", list);
		return "/all_product/myordercheck";
	}
	// 매출 페이지로 이동하는 함수
	@GetMapping("sales")
	public String Getsalse(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String personId = (String) session.getAttribute("personId");
		System.out.println("매출 확인" + personId);
		
		List<Order> listOfOrder = productService.getsalse(personId);
		
		if(listOfOrder != null) 
		{
			model.addAttribute("listOfOrder", listOfOrder);
		}
		else 
		{
			model.addAttribute("nothing", "아직 주문된 상품이 없습니다.");
		}
		
		return "/all_product/salse";
	}
}