package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springmvc.service.AjaxService;

@Controller
public class AjaxController {
	
	@Autowired
	AjaxService ajaxService;


	// 소비자 아이디확인 함수
	@GetMapping(value="/login/join/memberid", produces="application/json")
	@ResponseBody
	public String checkMemberId(@RequestParam("userId") String userId) {
	    System.out.println("소비자 ajax 도착");
	    if(ajaxService.member(userId)){
	        return "true";
	    } else {
	        return "false";
	    }
	}
	
	// productmanager 아이디 확인하는 함수
	@GetMapping(value="/login/managerId", produces="application/json")
	@ResponseBody
	public String managerId(@RequestParam("userId") String userId) {
		System.out.println("product 아작스 도착");
		if(ajaxService.productManager(userId)) {
			return "true";
		} else {
			return "false";
		}
	}
	
	// hospital manager 아이디 확인하는 함수
	@GetMapping(value="/loign/h_ManagerId", produces="application/json")
	@ResponseBody
	public  String H_mangerId(@RequestParam("userId") String userId) {
		System.out.println("hopital 아작스 도착");
		
		if(ajaxService.h_managerId(userId)) 
		{
			return "true";
		}
		else 
		{
			return "false";			
		}

	}
	
	// 체험단 manager 아이디 확인하는 함수
	@GetMapping(value="/login/ex_managerId", produces="application/json")
	@ResponseBody
	public  String Ex_mangerId(@RequestParam("userId") String userId) {
		System.out.println("ex_manager 아작스 도착");
		
		
		 if(ajaxService.Ex_mangerId(userId)) 
		 {
			 return "true"; 
			 }
		 else 
		 {
			 return "false";
		  }
	}
	
	// pet 아이디 확인하는 함수
	@GetMapping(value="petId/p_userId", produces="application/json")
	@ResponseBody
	public String PetId(@RequestParam("userId") String userId) {
		System.out.println("펫 아작스 도착");
		System.out.println("펫 : " + userId);
		if(ajaxService.petId(userId)) 
		{
			return "true";
		}
		else
		{
		
			return "false";
		}
	}
	
	
	// 로그인 성공 실패를 알려주는 함수
	@PostMapping(value="/confirm", produces="application/json")
	@ResponseBody
	public String LoginConfirm(@RequestParam("userId") String userId,
							   @RequestParam("userPw") String userPw) {
		
		System.out.println("여긴 로그인 함수 ajax");
		
	    if ("correctId".equals(userId) && "correctPassword".equals(userPw)) {
	        return "success";
	    } else {
	        return "fail";
	    }
	}


}