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

import com.mysql.cj.Session;
import com.springmvc.domain.QnA;
import com.springmvc.domain.QnAComment;
import com.springmvc.service.ProductService;
import com.springmvc.service.QnAService;
import com.springmvc.service.QnAcommentservice;

@Controller
@RequestMapping("/products")
public class QnAController {
	
	@Autowired
	QnAService QnAservice;
	
	@Autowired
	QnAcommentservice QnAcommentservice;
	
	@Autowired
	ProductService productService;
	//Create
	@GetMapping("qa")
	public String QnAform(@ModelAttribute("qna") QnA QnA,@RequestParam("productId") String productId,@RequestParam("personId") String personId,HttpServletRequest request)
	{
		System.out.println("Q&A 도착");
		request.setAttribute("productId", productId);
		request.setAttribute("personId", personId);
		return "all_product/QA_product";
	}
	
	@PostMapping("qa")
	public String addQnA(@ModelAttribute("qna") QnA QnA, Model model,HttpServletRequest request, MultipartFile s_image) 
	{
		System.out.println("post QnA 도착");
		String personId = request.getParameter("personId");
		String productId = request.getParameter("productId");
		
		String o_image = s_image.getOriginalFilename();
		String imagepath = request.getSession().getServletContext().getRealPath("/resources/images");
		System.out.println(imagepath);
		
		File file = new File(imagepath, o_image);
		
		try 
		{
			s_image.transferTo(file);
			QnA.setImage(o_image);
		}
		catch(Exception e) 
		{
			System.out.println("이미지를 등록하지 않았습니다" + e);
		}
		
		QnA.setPersonId(personId);
		QnA.setProductId(productId);
		QnAservice.addQnA(QnA);
		
		return "redirect:/products/product?productId="+productId;
	}
	
	//Update
	@GetMapping("/u_qna")
	public String u_QnA(@RequestParam("QnAId") String QnAId,
							@RequestParam("productId") String productId,
							@ModelAttribute("qna") QnA qna, HttpServletRequest request, Model model) {
		System.out.println("qna 업데이트 도착");
		return "all_product/U_Q&A_product";
	}
	
	
	@PostMapping("/u_qna")
	public String setu_QnA(@ModelAttribute("qna") QnA qna,@RequestParam("QnAId") String QnAId, @RequestParam("productId") String productId,MultipartFile s_image,
							HttpServletRequest request, Model model) {
		
		System.out.println(s_image);
		try 
		{
			String o_image = s_image.getOriginalFilename();
			String imagepath = request.getSession().getServletContext().getRealPath("/resources/images");
			
			File file = new File(imagepath, o_image);
			s_image.transferTo(file);
			qna.setImage(o_image);
		}
		catch (Exception e) {
			System.out.println("이미지등록을 안했습니다" + e);
		}
		
		QnAservice.updateQnA(qna,QnAId);
		System.out.println("post update 도착");
		return "redirect:/products/product?productId="+productId;
	}
	
	//Delete
	@GetMapping("/d_qna")
	public String d_QnA(@RequestParam("QnAId") String QnAId, @RequestParam("productId") String productId, Model model, HttpServletRequest request) 
	{
		QnAservice.deleteQnA(QnAId);
		return "redirect:/products/product?productId="+productId;
	}
	
	//comment Create
	@PostMapping("/a_comment")
	public String addcomment(Model model, HttpServletRequest request, HttpSession session) 
	{
		System.out.println("댓글 add 도착");
		
		String personId = (String) session.getAttribute("personId");
		System.out.println(personId);
		String qnaId = request.getParameter("qnaId").toString();
		String comment = request.getParameter("comment").toString();
		String productId = request.getParameter("productId").toString();
		
		QnAcommentservice.addcomment(qnaId,comment,personId);
		
		return "redirect:/products/product?productId="+productId;
	}
	
	//comment update
	@PostMapping("u_comment")
	public String updatecomment(@RequestParam("commentId") String commentId,@RequestParam("comment") String comment,@RequestParam("productId") String productId)
	{
		System.out.println("u_comment 도착");
		QnAComment qnacomment = QnAcommentservice.getcommentBycommentId(commentId);
		System.out.println(qnacomment);
		System.out.println(comment);
		System.out.println(commentId);
		QnAcommentservice.updatecomment(qnacomment,comment,commentId);
		
		return "redirect:/products/product?productId="+productId;
	}
	
	//comment delete
	@GetMapping("d_comment")
	public String deletecomment(@RequestParam("commentId") String commentId, @RequestParam("productId") String productId) 
	{
		System.out.println("d_comment 도착");
		QnAcommentservice.deletecomment(commentId);
		return "redirect:/products/product?productId="+productId;
		
	}
	
	@GetMapping("my_QNAList")
	public String my_QNAList(Model model,HttpSession session,HttpServletRequest request) {
		String personId = (String) session.getAttribute("personId");
		List<QnA> list = QnAservice.getMyList(personId);
		
		if(list.isEmpty() || list == null) {
			request.setAttribute("nothing", "작성한 QnA가 없어요");
		}
		
		List<QnA> NlistofQnA = new ArrayList<QnA>();
		QnA qna = null;
		String qnaId = null;
		List<QnAComment> commentlist = new ArrayList<QnAComment>();
		
		
		for(int i=0; i<list.size(); i++) {
			qna = list.get(i);
			qna.setProductname(productService.getProductById(qna.getProductId()).getProductName());
			qnaId = qna.getQnaId();
			System.out.println(qnaId);
			commentlist = QnAcommentservice.getcommentbyId(qnaId);
			if(commentlist == null) {
				request.setAttribute("nothing"+i, "아직 답변이 없어요");
			}
			qna.setCommentlist(commentlist);
			NlistofQnA.add(qna);
		}
		
		model.addAttribute("QNA", NlistofQnA);
		
		
		return "member/myQnA_list";
	}
}