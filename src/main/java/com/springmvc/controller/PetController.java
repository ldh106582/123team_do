package com.springmvc.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.springmvc.domain.Person;
import com.springmvc.domain.Pet;
import com.springmvc.service.PetService;

@Controller
@RequestMapping("/pet")
public class PetController 
{
	
	@Autowired
	private PetService petService;
	
	// pet회원가입 페이지로 이동
	@GetMapping("/creatpet")
	public String GetCreatePet(@ModelAttribute("pet_create") Pet pet, Model model, HttpServletRequest request) {

		return "/pet/petcreate";
	}
	
	@PostMapping("/creatpet")
	public String SetCreatePet(@ModelAttribute("pet_create") Pet pet, 
							   @RequestParam("id") String personId, 
							   @RequestParam(value="s_image", required=false) MultipartFile petImage, 
							   Model model, HttpServletRequest request) {
		
		System.out.println("여기 도착하나??");
		System.out.println("PetId : "+pet.getPetId());
		System.out.println("PetName : "+pet.getPetName());
		System.out.println("PetType : "+pet.getPetType());
		System.out.println("PetVarity : " + pet.getPetVarity());
		System.out.println("Pet성별 : " + pet.getPetSex());
		System.out.println("동물생일 : " + pet.getPetBirth());
		System.out.println("PersonId : "+ personId.length());
		System.out.println("petImage : " + petImage);
		
		Date date = new Date();
		SimpleDateFormat simpleDateFormat =  new SimpleDateFormat("yyyy-MM-dd");
		
		String filename = pet.getPetId() + "-" + "-" + simpleDateFormat.format(date) + petImage.getOriginalFilename();
		String filepath = request.getSession().getServletContext().getRealPath("/resources/images");
		System.out.println(filename);
		System.out.println(filepath);
		File file = new File(filepath, filename);
		
		try 
		{
			petImage.transferTo(file);
			pet.setPetImage(filename);
		}
		catch (Exception e)
		{
			System.out.println("해당하는 파일이 없습니다." + e);
		}
		
		System.out.println("image : " + petImage);
		
		System.out.println("PersonId : " + pet.getPersonId());
		pet.setPersonId(personId);
		
		Pet petname = petService.setcreatepet(pet);
		
		model.addAttribute("petname", petname.getPetName());
		
		return "redirect:/login/mypage";
	}
	
	// pet update 로 이동하기 
	@GetMapping("/petread")
	public String GetUpdatePet(@RequestParam("petId") String pet, Model model, 
							   @ModelAttribute("pet_create") Pet updatepet, HttpServletRequest request) {
		System.out.println("petupodate GET 도착");
		System.out.println("수정 페이지 petId : " + pet);
		Pet petId = petService.getUpdatePet(pet);
		System.out.println(petId.getPetBirth());
		model.addAttribute("petId", petId);
		
		HttpSession session = request.getSession();
		Person id = (Person)session.getAttribute("id");
		session.setAttribute("id", id);
		return "/pet/petupdate";
	}
	
	//pet update 값 받아오기
	@PostMapping("/petread")
	public String SetUpdatePet(@ModelAttribute("pet_create") Pet updatepet, Model model, 
							   @RequestParam("personId") String personId, HttpServletRequest request,
							   @RequestParam("s_image") MultipartFile pet_Image) 
	{
		System.out.println("petupodate Post 도착");
		System.out.println(updatepet.getPetId());
		String petId = updatepet.getPetId();
		System.out.println(updatepet.getPetName());
		System.out.println(updatepet.getPetType());
		System.out.println(updatepet.getPetVarity());
		System.out.println(updatepet.getPetSex());
		System.out.println(updatepet.getPetBirth());
		System.out.println(personId);

		System.out.println("pet_Image : " + pet_Image);
		
		Date date = new Date();
		SimpleDateFormat simpleDateTime = new SimpleDateFormat("yyyy-MM-dd");
		String imageName = updatepet.getPetId() + "-" + simpleDateTime.format(date) + "-" + "수정 : " +  pet_Image.getOriginalFilename();
		System.out.println(imageName);
		String imagePath = request.getSession().getServletContext().getRealPath("/resources/images");
		File file = new File(imagePath, imageName);
		
		try {
			pet_Image.transferTo(file);
			updatepet.setPetImage(imageName);
		}catch (Exception e) {
			System.out.println("이미지를 업로드 하지 않았습니다." + e);
		}
		
		// update로 값을 넣어줌
		petService.SetUpdatePet(updatepet);
		
		// 다시 card에 보여줄 값을 받아옴
		
		Pet pet = petService.getUpdatePet(updatepet.getPetId());
		model.addAttribute("pet", pet);
		
		return "redirect:/login/petcard?petid="+petId;
	}
	
	// pet delete
	@GetMapping("/delete")
	public String GetDeletePet(@RequestParam("petid")String petId) {
		petService.GetDeletePet(petId);
		return "./member/Mypage";
	}
}

