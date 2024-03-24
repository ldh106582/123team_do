package com.springmvc.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.springmvc.domain.Ex_manager;
import com.springmvc.domain.HospitalMember;
import com.springmvc.domain.ProductMember;
import com.springmvc.service.ManagerService;


@Controller
@RequestMapping("/managerlogin")
public class ManagerController 
{
	@Autowired
	ManagerService managerService;
	
	@GetMapping("/Member")
	public String showMemberPage(@ModelAttribute("productMember") ProductMember productMember, 
								 @ModelAttribute("hospitalMember") HospitalMember hospitalMember,
								 @ModelAttribute("ex_member") Ex_manager ex_manager,
								 @RequestParam("type") String type, HttpServletRequest request) {
	
	System.out.println("Member 페이지 요청 도착 : " + type);
	System.out.println(hospitalMember.getPersonAddress());
	System.out.println(hospitalMember.getHospitalAddress());
	
	HttpSession session = request.getSession();
	if(type == "p" || "p".equals(type)) {
	session.setAttribute("type", type);
	return "/member/AddManager";
	
	} else if(type == "h" || "h".equals(type)) {
		session.setAttribute("type", type);
		return "/member/Hospitalmanager";
		
	} else if(type == "e" || "e".equals(type)) {
		session.setAttribute("type", type);
		return "/member/ex_manager";
	}else {
		return "/member/Allmember";
	}
}

	// manager page 회원가입 post
			@PostMapping("/productmanager")
			public String GetaddProductManager(@ModelAttribute("productMember") ProductMember productMember,
											   @ModelAttribute("hospitalMember") HospitalMember hospitalMember,
											   @ModelAttribute("ex_member") Ex_manager ex_manager,
											   @RequestParam(value="c_file", required=false) MultipartFile c_file,
											   @RequestParam(value="s_file", required=false) MultipartFile s_file,
											   @RequestParam(value="h_file", required=false) MultipartFile h_file,
												HttpServletRequest request) 
			{	
				System.out.println("post도착");
				HttpSession session = request.getSession();
				String type = (String)session.getAttribute("type");
				System.out.println("세션에서 가져온 값 : " + type);
				System.out.println(productMember.getPersonAddress());
				
				System.out.println("s_file이름 : " + s_file);
				System.out.println("h_file이름 : " + h_file);
				
				// product 관리자 회원가입 하는 함수 
				if("p".equals(type)) {
					
				productMember.setType(type);
				
				Date date = new Date();
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				
				// 프로필 사진을 받아주는 함수
				String o_image = productMember.getPersonId() + "-" + simpleDateFormat.format(date) + "-" + c_file.getOriginalFilename();
				System.out.println(o_image);
				String o_imagePath = request.getSession().getServletContext().getRealPath("/resources/images");
				
				File file = new File(o_imagePath, o_image);
				
				try 
				{
					c_file.transferTo(file);
					productMember.setC_image(o_image);
				}
				catch(Exception e)
				{
					System.out.println("프로필 이미지가 존재하지 않습니다." + e);
				}
				
				
			    // 사업자등록증을 받아주는 함수
			    String saves_image = productMember.getCompanyName() + "-" + simpleDateFormat.format(date) + "-" + s_file.getOriginalFilename();
			    String s_imagePath  = request.getSession().getServletContext().getRealPath("/resources/images");
			    System.out.println(s_imagePath);

			    File saveimage = new File(s_imagePath, saves_image);

			    try {
			    	s_file.transferTo(saveimage);
			    	productMember.setS_image(saves_image);
			       
			    } catch (Exception e) {
			        throw new RuntimeException("사업자등록증 업로드를 실패했습니다.", e);
			    }
			    
			    //  회원가입 시 전체 데이터를 넣어주는 함수
				managerService.getaddProductManager(productMember);
				
				//personDB에 값을 넣어줌
				managerService.setAllMember(productMember);
				session.setAttribute("productMember", productMember);
				
				return "redirect:/login";
				
				// 병원 manager 회원가입 하는 함수
				} else if("h".equals(type)) {
					
					hospitalMember.setType(type);
					
					System.out.println("여긴 병원 회원가입 : " + type);
					
					Date date = new Date();
					SimpleDateFormat simpledateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
					// 프로필 사진을 받아주는 함수
					String o_image = hospitalMember.getPersonId() + "-" + simpledateFormat.format(date) + "-" + c_file.getOriginalFilename();
					String o_imagePath = request.getSession().getServletContext().getRealPath("/resources/images");
					
					File file = new File(o_imagePath, o_image);
					
					try 
					{
						c_file.transferTo(file);
						hospitalMember.setImage(o_image);
					}
					catch(Exception e)
					{
						System.out.println("프로필 이미지가 존재하지 않습니다." + e);
					}
					
					
					// 사업자등록증을 받아주는 함수
					
				    String s_imageName = hospitalMember.getPersonId() + "-" + simpledateFormat.format(date) + "-" + s_file.getOriginalFilename();
				    System.out.println("hospitalregistrationName : " + s_imageName);
				    
				    String s_imagePath  = request.getSession().getServletContext().getRealPath("/resources/images");
				    
				    System.out.println("hospitalregistrationPath : " + s_imagePath);
			
				    File saveimage = new File(s_imagePath, s_imageName);
		
				    
				    try {
				    	s_file.transferTo(saveimage);
				    	hospitalMember.setS_image(s_imageName);
				    } catch (Exception e) {
				    	throw new RuntimeException("사업자등록증 업로드를 실패했습니다.", e);
				    }
				    
				    System.out.println("사옵자 끝");
				    
					// 의사 자격증을 받아주는 함수
				    String h_imageName = hospitalMember.getPersonId() + "-" + simpledateFormat.format(date) + "-" + h_file.getOriginalFilename();
				    String h_imagePath  = request.getSession().getServletContext().getRealPath("/resources/images");
				    File saveh_image = new File(h_imagePath, h_imageName);
					
				    try {
				    	h_file.transferTo(saveh_image);
				    	hospitalMember.setH_image(h_imageName);
				    } catch (Exception e) {
				    	throw new RuntimeException("의사면허증  업로드를 실패했습니다.", e);
				    }
				    
				    hospitalMember.setType(type);
				    
					// 병원 manager 회원가입 하는 함수
				    managerService.addHospitalManager(hospitalMember);
				    
				    // 전체 db에 데이터를 넣어주는 함수
				    managerService.H_setAllMember(hospitalMember);
				    
				    return "redirect:/login";
				    
				//체험단 매니저 회원가입하는 함수
				}
				else if("e".equals(type))
				{
					ex_manager.setType(type);
					
					System.out.println("여기 체험단 타입 : " + type);
					
					Date date = new Date();
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
					// 프로필 사진을 받아주는 함수
					String o_image = ex_manager.getPersonId() + "-" + simpleDateFormat.format(date) + "-" + c_file.getOriginalFilename();
					String o_imagePath = request.getSession().getServletContext().getRealPath("/resources/images");
					
					File file = new File(o_imagePath, o_image);
					
					try 
					{
						c_file.transferTo(file);
						hospitalMember.setImage(o_image);
					}
					catch(Exception e)
					{
						System.out.println("프로필 이미지가 존재하지 않습니다." + e);
					}
					
					String s_imageName = ex_manager.getEx_Name() + "-" + simpleDateFormat.format(date) + "-" + s_file.getOriginalFilename();
					String s_imagePath  = request.getSession().getServletContext().getRealPath("/resources/images");
					File saveimage = new File(s_imagePath, s_imageName);
						
				    try 
				    {
				    	s_file.transferTo(saveimage);
				    	ex_manager.setS_image(s_imageName);
				    } 
				    catch (Exception e) 
				    {
				    	
				    	throw new RuntimeException("사업자등록증 업로드를 실패했습니다.", e);
				    }
				    
				    System.out.println("사옵자 끝");
				    
				    // 체험단 manager 회원가입 하는 함수
				    managerService.addEx_Manager(ex_manager);
				    
				    // 전체 db에 데이터를 넣어주는 함수
				    managerService.setEx_AllMember(ex_manager);
				    
				    
					return "redirect:/login";
					
				}else {
				    session.invalidate();
					
					 System.out.println("여긴 회원가입 로그인");
				return "redirect:/login";
				}
			}
		

	@GetMapping("/ManagerDelete")
	public String ManagerDelete(@RequestParam("managerid") String managerId, HttpServletRequest request) {
		// System.out.println("managerId : " + managerId);

		// 전체 id db 데이터를 삭제하는 함수
		managerService.AllmanagerDelete(managerId);
		// productMember 데이터를 삭제하는 함수
		managerService.P_managerDelete(managerId);
		
		
		
		
		return "/all_product/products";
	}
	
	// mypage로 이동하기 위한 값을 가져옴
	/*@GetMapping("/manager_page")
	public String ManagerPage(@RequestParam("personId") String personId, ProductMember productMember, Model model) {
		System.out.println("c personId : " + personId);
		productMember = managerService.managerPage(personId);
		 // System.out.println("productMemberId : " + productMember.getPersonId());
		 // System.out.println("productMembertype : " + productMember.getType());
		// product 매니저 mypage로 값 전송
		model.addAttribute("productMember", productMember);
		
		return "/member/managerMypage";
	}*/
	
	// update 하기 전 데이터를 받아오는 곳
/*	@GetMapping("/managerudpate")
	public String ManagerUpdate(@RequestParam("personId") String personId, Model model,
								@ModelAttribute("managerupdate") ProductMember productMember,
								HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		// prodcut 관리자 회원 정보를 수정하기 전 보여주는 함수
		productMember = managerService.managerUpdate(personId);
		model.addAttribute("productMember", productMember);
		session.setAttribute("type", productMember.getType());
		
		return "/member/ManagerUpdate";
	}
*/	
	@GetMapping("/logout")
	public String ManagerLogout(@RequestParam("managerid") String managerid, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/login";
	}
}
