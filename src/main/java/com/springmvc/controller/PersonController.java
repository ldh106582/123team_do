package com.springmvc.controller;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.domain.EApplication;
import com.springmvc.domain.Ex_manager;
import com.springmvc.domain.Hospital;
import com.springmvc.domain.HospitalMember;
import com.springmvc.domain.Person;
import com.springmvc.domain.Pet;
import com.springmvc.domain.Product;
import com.springmvc.domain.ProductMember;
import com.springmvc.service.PersonService;

@Controller
@RequestMapping("/login")
public class PersonController {
   
   @Autowired
   private PersonService personService;
   
   
   // 통합 회원가입페이지로 이동
   @GetMapping("/Allmember")
   public String Allmemger() {
      return "/member/AllManager";
   }
   
   // 회원가입 페이지로 이동
   @GetMapping("/add")
   public String GetCreatePerson(@ModelAttribute("Newmember") Person person, HttpServletRequest request) {
      String type = request.getParameter("type");
      HttpSession session = request.getSession();
      session.setAttribute("type", type);
      
      return "member/AddMember";
   }
   
   // 회원가입 파라미터 값 받아옴
   @PostMapping("/add")
   public String SetCreatePerson(@ModelAttribute("Newmember")Person person, Model model, HttpServletRequest request, 
		   						@RequestParam(value="s_file", required=false)MultipartFile s_image) {
	   
      HttpSession session = request.getSession();
      String type = (String)session.getAttribute("type");
      System.out.println("add post : " + type);
      System.out.println("주소 test : " + person.getPersonAddress());
      person.setType(type);
      
      Date date = new Date();
      SimpleDateFormat time = new  SimpleDateFormat("yyyy-MM-dd");
      String o_image = person.getPersonId() + "-" + time.format(date) + "-" + s_image.getOriginalFilename();
      String imagePAth = request.getSession().getServletContext().getRealPath("/resources/images");
      File file = new File(imagePAth, o_image);
      
      System.out.println("o_image : " + o_image);
      System.out.println("o_image : " + imagePAth);
      
      try 
      {
    	  s_image.transferTo(file);
    	  person.setImage(o_image);
    	  
      }catch(Exception e) 
      {
    	  System.out.println("이미지를 등록하지 않았습니다. " + e);
      }
      
      // 회원가입 시 db에 넣어주는 함수
      personService.setCreatPerson(person);
   
      session.invalidate();
      
      return "redirect:/login";
   }

   
   // 로그인 페이지로 이동
   @GetMapping
   public String SetReadPerson(@ModelAttribute("success")Person person, HttpServletRequest request) { 
      return "Login";
   }
   
   // 로그인 파라미터값 받아옴
   @PostMapping
   public String GetReadPerson(@ModelAttribute("success") Person person,
                        Model model,
                        Pet pet, HttpServletRequest request) {
      
      // update에서 db로 가져가 조회할 session
      // 1. 조원들에게 넘겨줄 객체 2. personId와 pw를 가져옴
      Person id = personService.loginSucess(person) ;
      if(id == null)
      {
    	  String faild = "회원가입이 되어 있지 않은 회원입니다.";
    	  model.addAttribute("faild", faild);
      System.out.println("여기는 type을 확인하는 곳0" + id);
      
      } else {HttpSession session = request.getSession();
      
      session.setAttribute("id", id);
      session.setAttribute("personId", id.getPersonId());
      System.out.println("여기는 type을 확인하는 곳1");
      
      String type = (String) id.getType();
      session.setAttribute("type", id.getType());
      System.out.println("로그인 타입 : " + type);
      String personId = (String)person.getPersonId();
      System.out.println("personId : " + personId);
      

    	 System.out.println("여기는 type을 확인하는 곳");
    	 
	      if("p".equals(type)) 
	      {
	    	  if( !(person.getPersonId().equals(id.getPersonId()) && person.getPersonPw().equals(id.getPersonPw()))) {
	    		  model.addAttribute("noId", "아이디와 비밀번호를 확인해주세요");
	    		  
	    		  return "Login";
	    	  }
	         System.out.println("product입니다.");
	         // 프로덕트 매니저가 로그인할 때 가져올 데이터
	         ProductMember productMember = personService.getPM(personId);
	         
	         session.setAttribute("productMember", productMember);
	         // 해당 프로덕트 매니저의 상품을 가죠오는 데이터
	         List<Product> listOfProduct = personService.getProduct(personId);
	         session.setAttribute("listOfProduct", listOfProduct);
	         
	         // pet이름 정보를 가져옴 수정필요함 없애도 상관없는 함수
	         List<Pet> petName = personService.getPetName(person);
	         System.out.println("petName : " + petName);
	         session.setAttribute("petName", petName);
	
	         // pet 아이디 정보를 가져옴
	         List<Pet> petId = personService.getPetId(pet);
	         session.setAttribute("petId", petId);
	         
	         return "redirect:/products";
	      	
	      } 
	      
	      if("h".equals(type)) 
	      {
	
	    	  if(!(person.getPersonId().equals(id.getPersonId()) && person.getPersonPw().equals(id.getPersonPw()))) {
	    		  model.addAttribute("noId", "아이디와 비밀번호를 확인해주세요");
	    		  
	    		  return "Login";
	    	  }
	    	  
	         // 동물병원 의사가 로그인할 때 가져올 데이터
	         HospitalMember hospitalMember = personService.getHM(personId);
	         session.setAttribute("hospitalMember", hospitalMember);
	         // 해당 동물병원의사의 병원정보를 가죠오는 데이터
	         List<Hospital> listOfHospital = personService.getHopital(personId);
	         session.setAttribute("listOfHospital", listOfHospital);
	         
	         // pet이름 정보를 가져옴 수정필요함 없애도 상관없는 함수
	         List<Pet> petName = personService.getPetName(person);
	         System.out.println("petName : " + petName);
	         session.setAttribute("petName", petName);
	
	         // pet 아이디 정보를 가져옴
	         List<Pet> petId = personService.getPetId(pet);
	         session.setAttribute("petId", petId);
	         
	         return "all_Hospital/hospitals";
	      } 
	      if("e".equals(type))
	      {
	
	    	  if(!(person.getPersonId().equals(id.getPersonId()) && person.getPersonPw().equals(id.getPersonPw()))) {
	    		  model.addAttribute("noId", "아이디와 비밀번호를 확인해주세요");
	    		  
	    		  return "Login";
	    	  }
	    	  
	    	  System.out.println("여기는 체험단 " + personId);
	          // 체험단 관리자가 로그인할 때 가져올 데이터
	    	  Person ex_person = personService.getEM(personId);
	    	  session.setAttribute("ex_person", ex_person);
	    	  
	    	// 체험단 신청목록을 로그인할 때 가져올 데이터
	    	  List<EApplication> eApplication = personService.getEA(personId);
	    	  session.setAttribute("eApplication", eApplication);
	          // pet이름 정보를 가져옴 수정필요함 없애도 상관없는 함수
	          List<Pet> petName = personService.getPetName(person);
	          System.out.println("petName : " + petName);
	          session.setAttribute("petName", petName);
	
	          // pet 아이디 정보를 가져옴
	          List<Pet> petId = personService.getPetId(pet);
	          session.setAttribute("petId", petId);
	          
	          System.out.println("로그인 조회 성공");
	          
	          
	          return "redirect:/ENboards";
	      }
	      if("c".equals(type)) 
	      {
	
	    	  if(!(person.getPersonId().equals(id.getPersonId()) && person.getPersonPw().equals(id.getPersonPw()))) {
	    		  model.addAttribute("noId", "아이디와 비밀번호를 확인해주세요");
	    		  
	    		  return "Login";
	    	  }
	
	    	  
	         // pet이름 정보를 가져옴 수정필요함 없애도 상관없는 함수
	         List<Pet> petName = personService.getPetName(person);
	         System.out.println("petName : " + petName);
	         session.setAttribute("petName", petName);
	
	         // pet 아이디 정보를 가져옴
	         List<Pet> petId = personService.getPetId(pet);
	         session.setAttribute("petId", petId);
	      
	      
	      return "/member/Mypage";
	      }
      } 

      
      return "Login";
   }
   
   // 회원 수정 페이지로 이동
   @GetMapping("/update")
   public String GetUpdatePerson(@ModelAttribute("addmemberupdate") Person person,
		   						 @ModelAttribute("managerupdate") ProductMember productMember,
		   						 @ModelAttribute("hospitalupdate") HospitalMember hospitalMember,
		   						 @ModelAttribute("ex_manager") Ex_manager ex_manager,
		                         @RequestParam("id") String id,
		                         HttpServletRequest request, Model model) {
      
      Person u_person = personService.findPersonById(id);
      String type = u_person.getType();
      String personid = u_person.getPersonId();
      System.out.println("personid : " + personid);
      System.out.println("personid : " + id);
      
      HttpSession session = request.getSession();
      
      // product manager 마이페이지를 수정하는 곳
      if ("p".equals(type)) 
      {
    	  // product manager 회원수정
         ProductMember u_productMember = personService.P_update(id);
         model.addAttribute("u_productMember", u_productMember);
         return "/member/ManagerUpdate";
         
      } 
      else if("h".equals(type)) 
      {
    	  System.out.println("수정 update 병원 도착");
    	  System.out.println("수정 update 병원 type : " + type);
    	  // hopital manager 회원수정
         HospitalMember u_hospitalMember = personService.H_update(id);
         System.out.println("수정 update 병원 도착");
         model.addAttribute("u_hospitalMember", u_hospitalMember);
         return "/member/ManagerUpdate";
      } 
      else if("e".equals(type)) 
      {
    	  // EXpreience manager 회원수정
    	  Ex_manager ex_Manager =  personService.E_update(id);
    	  System.out.println(ex_Manager.getEx_Name());
          model.addAttribute("ex_Manager", ex_Manager);

          Person ex_person = (Person)session.getAttribute("id");
          System.out.println("e : " + ex_person.getPersonEmail());
          
          model.addAttribute("ex_person", ex_person);
          return "/member/ManagerUpdate";
       }
      else 
      {
         model.addAttribute("u_person", u_person);
      }
      
      return "member/update";
   }
   
   // 회원 정보 수정 파라미터값 받아옴
   @PostMapping("/update")
   public String SetUpdatePerson(@ModelAttribute("addmemberupdate") Person person, 
		                         @ModelAttribute("managerupdate") ProductMember productMember,
		                         @ModelAttribute("hospitalupdate") HospitalMember hospitalMember,
		                         @ModelAttribute("ex_manager") Ex_manager ex_manager,
		                         @RequestParam(value ="s_file", required=false) MultipartFile s_file,
		                         @RequestParam(value="c_file", required=false) MultipartFile c_file,
                                 HttpServletRequest request) {
       
	   System.out.println("사용자 ID: " + person.getPersonId());
	   System.out.println("s_file : " + s_file);
       HttpSession session  = request.getSession();
       String type = (String) session.getAttribute("type");
       System.out.println("type : " + type);
       System.out.println(hospitalMember.getPersonEmail());
       
       
       if("p".equals(type)) 
       { 
    	  productMember.setType(type);
    	  
    	  Date date = new Date();
    	  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
    	  
    	  String imageName = productMember.getPersonId() + "-" + "수정" + simpleDateFormat.format(date) + "-" + s_file.getOriginalFilename();
    	  System.out.println("product : " + imageName);
    	  
    	  String imagePath = request.getSession().getServletContext().getRealPath("/resources/images");
    	  System.out.println("imagePath : " + imagePath);
    	  
    	  File file = new File(imagePath, imageName);
    	  System.out.println("file : " + file);
    	  
    	  try
    	  {
    		  s_file.transferTo(file);
    		  System.out.println("try 안에 : " + imageName);
    		  productMember.setS_image(imageName);
    	  }
    	  catch (Exception e) 
    	  {
    		  System.out.println("새로운 이미지를 전송하지 않았습니다." + e);
    	  }
    	  
    	  String p_imageName = productMember.getCompanyName() + "-" + "수정" + simpleDateFormat.format(date) + "-" + c_file.getOriginalFilename();
    	  String p_imagePath = request.getSession().getServletContext().getRealPath("/resources/images");
    	  File p_file = new File(p_imagePath, p_imageName );
    	  try{
    		  c_file.transferTo(p_file);
    		  productMember.setC_image(p_imageName);
    	  }catch (Exception e) {
    		  System.out.println("새로운 이미지를 전송하지 않았습니다." + e);
    	  }
    	  
    	  // product manager person 수정하는 곳
          personService.SetUpdatePM(productMember);
          // product manager person 테이블을 수정하는 곳
          personService.SetUpdatePr(productMember);
       }
       
       else if("h".equals(type)) 
       {	
    	  hospitalMember.setType(type);
    	  Date date = new Date();
    	  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
     	  String imageName =  hospitalMember.getHospitalName() + "-" + "수정" + simpleDateFormat.format(date) + "-" + s_file.getOriginalFilename();
     	  String imagePath = request.getSession().getServletContext().getRealPath("/resources/images");
     	  File file = new File(imagePath, imageName );
     	  
     	  try{
     		  s_file.transferTo(file);
     		 hospitalMember.setS_image(imageName);
     	  }catch (Exception e) {
     		  System.out.println("새로운 이미지를 전송하지 않았습니다." + e);
     	  }
    	   // hospital manager 마이페이지를 수정하는 곳
          personService.SetUpdateHM(hospitalMember);
           // hospital manager person 테이블을 수정하는 곳
          personService.SetUpdatePH(hospitalMember);
       }
       else if("e".equals(type)) 
       {	
    	  ex_manager.setType(type);
    	  Date date = new Date();
    	  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
     	  String imageName =  hospitalMember.getHospitalName() + "-" + "수정" + simpleDateFormat.format(date) + "-" + c_file.getOriginalFilename();
     	  String imagePath = request.getSession().getServletContext().getRealPath("/resources/images");
     	  File file = new File(imagePath, imageName );
     	  
     	  try{
     		  c_file.transferTo(file);
     		 ex_manager.setS_image(imageName);
     	  }catch (Exception e) {
     		  System.out.println("새로운 이미지를 전송하지 않았습니다." + e);
     	  }
    	   // 체험단 manager 마이페이지를 수정하는 곳
     	  
     	 // 체험단 manager person 테이블을 수정하는 곳
          personService.SetUpdateEM(ex_manager);
 
       }
       else 
       {
    	   
    	   Date date = new Date();
    	   SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    	   
    	   String imageName  = person.getPersonId() + "-" +  "수정일 : " +  simpleDateFormat.format(date) + "-"  + s_file.getOriginalFilename();
    	   String imagePath = request.getSession().getServletContext().getRealPath("/resources/images");
    	   System.out.println("이미지 경로 : " + imagePath);
    	   
    	   File file = new File(imagePath, imageName);
    	   try 
    	   {
    		   s_file.transferTo(file);
    		   person.setImage(imageName);
    	   }catch(Exception e) 
    	   {
    		   System.out.println("등록된 이미지가 없습니다." + e);
    	   }
          personService.SetUpdatePerson(person);
       }
       session.invalidate();
       return "redirect:/login";
   }
   
   //회원삭제 페이지
   @RequestMapping(value="/delete")
   public String SetDeletePerson(@RequestParam("id") String personId, HttpServletRequest request) {
      System.out.println("person delete문 controller 도착");
      
      HttpSession session = request.getSession();
      String type = (String)request.getAttribute("type");
      System.out.println(type);
      
      if("p".equals(type)) {
    	  //product manager 테이블 데이터를 삭제하는 함수
    	  //person 테이블 데이터를 삭제하는 함수
    	  personService.PM(personId);
    	  
      } else if("h".equals(type)){
    	  //병원 manager 테이블 데이터를 삭제하는 함수
    	  //person 테이블 데이터를 삭제하는 함수
    	  personService.HM(personId);
      } else if("e".equals(type)){
    	  //체험단 manager 테이블 데이터를 삭제하는 함수
    	  //person 테이블 데이터를 삭제하는 함수
    	  personService.EM(personId);
      } else {
          personService.SetDeletePerson(personId);
      }
      
     
     
      return "redirect:/login";
   }
   

   //로그아웃 페이지
   @RequestMapping(value = "/logout", method = RequestMethod.GET)
   public String logout(HttpServletRequest request, HttpServletResponse response, SessionStatus sessionStatus) {
      System.out.println("로그아웃 페이지로 이동");
      
      // 세션 무효시킴
       sessionStatus.setComplete();
       HttpSession session = request.getSession();
       session.invalidate();

       System.out.println("==============로그아웃");
      // 쿠키제거
       Cookie[] cookies = request.getCookies();
       if (cookies != null) {
           for (Cookie cookie : cookies) {
               cookie.setMaxAge(0);
               response.addCookie(cookie);
           }
       }
    
       return "redirect:/login";
   }
   
   @GetMapping("/mypage")
   public String mypage(HttpServletRequest request, Model model) {
      HttpSession session = request.getSession();
      Person person = (Person) session.getAttribute("id");
      
      if(person != null) 
      {

          session.setAttribute("person", person);
          
          List<Pet> petName = (List<Pet>) session.getAttribute("petName");
          model.addAttribute("petName", petName);
          
          return "member/Mypage";
      } 
      else 
      {
    	  return "redirect:/login";
      }
   }
}