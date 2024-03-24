package com.springmvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.service.ENBoardService;
import com.springmvc.service.HospitalService;
import com.springmvc.service.ProductService;

@Controller
@RequestMapping("/select")
public class SelectController {
	
	@Autowired
	ENBoardService boardService;
	
	@Autowired
	HospitalService hospitalService;
	
	@Autowired
	ProductService productService;
	
	@GetMapping
	public String select(@RequestParam("context")String context,Model model) {
		System.out.println("도착");
		System.out.println(context);
		model.addAttribute("ENBoards", boardService.getENBoardsByTitle(context));
		System.out.println(1);
		model.addAttribute("Hospitals", hospitalService.gethospitalsByTitle(context));
		System.out.println(2);
		model.addAttribute("Products", productService.getProductByName(context));
		
		return "home";
	}
}
