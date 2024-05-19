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
import com.springmvc.domain.AddressDTO;
import com.springmvc.domain.Hospital;
import com.springmvc.domain.HospitalBooking;
import com.springmvc.domain.HospitalReview;
import com.springmvc.domain.Pet;
import com.springmvc.service.BookingService;
import com.springmvc.service.HospitalReviewService;
import com.springmvc.service.HospitalService;

@Controller
@RequestMapping("/hospitals")
public class HospitalController {

	@Autowired
	HospitalService hospitalService;
	
	@Autowired
	HospitalReviewService reviewService;
	
	@Autowired
	BookingService bookingService;
	
	// 도현_병원 페이징을 진행하는 함수 기본값을 1로 설정함.
	@GetMapping
	public String getAllhospitals(Model model, @RequestParam(defaultValue = "1") int page)
	{
			// 도현_병원에 있는 전체 데이터를 가져옴.
		 	List<Hospital> listOfCount = hospitalService.getCount();

		    int totalCount = listOfCount.size(); // 전체 항목 수
		    int pageSize = 3; // 한 페이지에 표시할 항목의 수
		    int pageCount = (totalCount + pageSize - 1) / pageSize; // 페이지 수 계산
		    
		    // 도현_페이지 번호 범위 생성 객체의 수량을 int로 변환함.
		    List<Integer> pageNumbers = new ArrayList<Integer>();
		    // 도현_전체 갯수를 확인함.
		    for (int i = 1; i <= pageCount; i++) 
		    {	
		        pageNumbers.add(i);
		    }
		    model.addAttribute("pageNumbers", pageNumbers);

		 // 도현_page가 1일 경우 1을 나타냄
		if(page == 1) 
		{
			List<Hospital> hospitals = hospitalService.getAllhospitals(page);
			model.addAttribute("hospitals", hospitals);
		}
		// 도현_1 이 아니 경우 전체 개수를 나타냄
		else
		{
			List<Hospital> hospitals = hospitalService.getAllhospitals(page);
			model.addAttribute("hospitals", hospitals);
		}
		
		// 도현_한의가 별의 수를 확인하기 위해 작성함
		model.addAttribute("fiveScore", reviewService.get5scoreReview());
		model.addAttribute("fourScore", reviewService.get4scoreReview());
		model.addAttribute("threeScore", reviewService.get3scoreReview());
		return "all_Hospital/hospitals";
	}

	@GetMapping("getmyhospitals")
	public String getmyhospitals(HttpSession session,Model model) {
		String personId = (String) session.getAttribute("personId");
		model.addAttribute("hospitals", hospitalService.getMyhospitalList(personId));
		return "all_Hospital/myhospitals";
	}
	
	@GetMapping("hospital")
	public String hospital(@RequestParam("hid") String hid,Model model,HttpSession session,HttpServletRequest request)
	{
		model.addAttribute("hospital",hospitalService.gethosptialByhId(hid));
//		병원리뷰
		String personId = (String) session.getAttribute("personId");
		request.setAttribute("visited", bookingService.CheckVisitHistory(personId,hid));
		
		model.addAttribute("reviews",reviewService.getAllReviews(hid));
		return "all_Hospital/hospital";
	}

	@GetMapping("/create")
	public String hospitalcreateform(@ModelAttribute("hospital")Hospital hospital) 
	{
		return "all_Hospital/addform";
	}
	
	@PostMapping("/create")
	public String hospitalcreate(@ModelAttribute("hospital")Hospital hospital,HttpSession session,Model model, HttpServletRequest request,
								MultipartFile s_file) 
	{
		String filename = s_file.getOriginalFilename();
		String filePath = request.getSession().getServletContext().getRealPath("/resources/images");
		File file = new File(filePath, filename);
		
		try {
			s_file.transferTo(file);
			hospital.setImage(filename);
		}catch(Exception e) {
			System.out.println("파일을 입력하지 않았습니다." + e);
		}
		
		String personId = (String) session.getAttribute("personId");
		hospital.setPersonId(personId);
		String realpath = request.getSession().getServletContext().getRealPath("/resources/images");
		hospitalService.addhospital(hospital, realpath);
		return "redirect:/hospitals";
	}
	
	@GetMapping("update")
	public String hospitalupdateform(@RequestParam("hid")String hid,@ModelAttribute("hospital")Hospital hospital,Model model)
	{
		model.addAttribute("hospital",hospitalService.gethosptialByhId(hid));
		return "all_Hospital/updateform";
	}
	
	@PostMapping("update")
	public String hospitalupdate(@RequestParam("hid")String hid,@ModelAttribute("hospital")Hospital hospital,HttpServletRequest request) {
		String realpath = request.getSession().getServletContext().getRealPath("/resources/images");
		hospitalService.updateHospital(hospital,hid,realpath);
		return "redirect:/hospitals/hospital?hid="+hid;
	}
	
	@GetMapping("delete")
	public String hospitaldelete(@RequestParam("hid")String hid) {
		hospitalService.deleteHospital(hid);
		return "redirect:/hospitals/getmyhospitals";
	}
	
//	리뷰작성
	@GetMapping("addreview")
	public String addreviewform(@ModelAttribute("review")HospitalReview review,@RequestParam("hid")String hid,HttpServletRequest request) {
		request.setAttribute("hid", hid);
		return "all_Hospital/addReviewform";
	}
	
	@PostMapping("addreview")
	public String addreview(@ModelAttribute("review")HospitalReview review,@RequestParam("hid")String hid,HttpSession session) {
		String personId = (String) session.getAttribute("personId");
		review.setPersonId(personId);
		review.setHid(hid);
		System.out.println(hid);
		reviewService.addreview(review);
		hospitalService.gethosptialByhId(hid);
		return "redirect:/hospitals/hospital?hid="+hid;
	}
//	리뷰수정
	@GetMapping("editreview")
	public String editreviewform(@ModelAttribute("review")HospitalReview review,@RequestParam("reviewId")String reviewId,HttpServletRequest request,Model model) {
		model.addAttribute("review", reviewService.getReviewByID(reviewId));
		return "all_Hospital/updateReviewform";
	}
	
	@PostMapping("editreview")
	public String editreview(@ModelAttribute("review")HospitalReview review,@RequestParam("reviewId")String reviewId) {
		HospitalReview hospitalReview =reviewService.getReviewByID(reviewId);
		String hid = hospitalReview.getHid();
		reviewService.updatereview(review,reviewId);
		return "redirect:/hospitals/hospital?hid="+hid;
	}
	
//	리뷰삭제
	@GetMapping("deletereview")
	public String deletereview(@RequestParam("reviewId")String reviewId) {
		HospitalReview hospitalReview =reviewService.getReviewByID(reviewId);
		String hid = hospitalReview.getHid();
		reviewService.deletereview(reviewId);
		System.out.println(reviewId);
		return "redirect:/hospitals/hospital?hid="+hid;
	}
//	예약조회
	@GetMapping("mybookList")
	public String mybookList(@RequestParam("personId") String personId,Model model,HttpSession session) {
		
		model.addAttribute("booklist", bookingService.getMyBookList(personId));
		List<Pet> list = (List<Pet>) session.getAttribute("petId");
		System.out.println();
		model.addAttribute("petlist",list);
		return "all_Hospital/mybookList";
	}
//	병원예약하기
	@GetMapping("addbook")
	public String addbookform(@ModelAttribute("booking") HospitalBooking booking,@RequestParam("hid")String hid,Model model,HttpSession session) {
		model.addAttribute("hospital", hospitalService.gethosptialByhId(hid));
		return "all_Hospital/addbookform";
	}
	@PostMapping("addbook")
	public String addbook(@ModelAttribute("booking") HospitalBooking booking,HttpServletRequest request,HttpSession session) {
		
		
		String personId = (String) session.getAttribute("personId");

		
		String registDay = request.getParameter("registDay");
		String mid = request.getParameter("mid");
		String hid = request.getParameter("hid");
		String hospitalName = request.getParameter("hospitalName");
		
		booking.setPersonId(personId);
		booking.setRegistDay(registDay);
		booking.setMid(mid);
		booking.setHid(hid);
		booking.setHospitalName(hospitalName);
		
		
		
		bookingService.addbook(booking);
		
		return "redirect:/hospitals/mybookList?personId="+personId;
	}
//	날짜 변경 
	@PostMapping("editbook")
	public String editbook(HttpSession session,@RequestParam("bid") String bid,@RequestParam("registDay") String registDay) 
	{
		String personId = (String) session.getAttribute("personId");
		bookingService.editbook(bid,registDay);
		return "redirect:/hospitals/mybookList?personId="+personId;
	}
//	예약 취소
	@GetMapping("deletebook")
	public String deletebook(@RequestParam("bid") String bid,HttpSession session) 
	{
		String personId = (String) session.getAttribute("personId");
		System.out.println("=================================="+bid);
		bookingService.deletebook(bid);
		return "redirect:/hospitals/mybookList?personId="+personId;
	}
	
//	 모든 신청 보기
	@GetMapping("manageapps")
	public String manageapps(Model model,HttpSession session,HttpServletRequest request) {
		System.out.println("======================="); 
		String personId = (String) session.getAttribute("personId");
		System.out.println("=======================1");
		System.out.println(personId);
		 List<HospitalBooking> list = bookingService.getPermisionList(personId);
		 System.out.println(list);
		 
		 model.addAttribute("applists",list);
		 if(list.isEmpty()) {
			 request.setAttribute("nothing", "승인할 것이 없어요");
		 }
		 return "all_Hospital/permitLists"; 
	}	 
	
//	예약 승인||거절
	 @GetMapping("decision")
	 public String decision(@RequestParam("dec") String dec,@RequestParam("bid") String bid){
		 bookingService.updateState(dec,bid);
		 return "redirect:/hospitals/manageapps";
	 }
	 
// 검색
		@GetMapping("/selectbytitle")
		public String selectboardbytitle(Model model,HttpServletRequest request) {
			String title = (String) request.getParameter("title");
			System.out.println(title);
			if(title.equals(null)||title.equals("")||title.equals(" ")) {
				return "redirect:/hospitals";
			}
			System.out.println(title);
			List<Hospital> hospitallist = hospitalService.gethospitalsByTitle(title);
			if(hospitallist.isEmpty()) {
				//검색 결과가 없을때
				return "all_Hospital/exceptionpage";
			}
			model.addAttribute("hospitals",hospitallist);
			return "all_Hospital/hospitals";
		}
//		병원관리자페이지
		@GetMapping("manager")
		public String hospitalMangerPage(Model model,HttpSession session,HttpServletRequest request) {
			String personId = (String) session.getAttribute("personId");
			int count = hospitalService.myhospitalList(personId);
			List<HospitalBooking> todaybooklist = hospitalService.todaybookList(personId);
			List<HospitalBooking> allbooklist = hospitalService.allbooklist(personId);
			if(count == 0) {
				request.setAttribute("donthavehospital", "등록된 병원이 없어요");
			}
			model.addAttribute("count",count);
			
			if(todaybooklist == null) {
				request.setAttribute("donthavetoday", "오늘 예약이 없어요");
			}
			model.addAttribute("todaybooklist",todaybooklist);
			
			if(todaybooklist == null) {
				request.setAttribute("donthavebooklist", "진료 내역이 없어요");
			}
			model.addAttribute("allbooklist",allbooklist);
			
			return "member/HospitalManagerPage";
		}
		
		@GetMapping("witch")
		public String H_rest(@RequestParam("personId") String personId, Model model) {
			System.out.println("api도착");
			AddressDTO address = hospitalService.h_rest(personId);
			
			model.addAttribute("address", address);
			
			return "home";
		}
		
		@GetMapping("save")
		public String PublicAPI() {
			System.out.println("여기는 save");
			hospitalService.publicAPI();
			return null;
		}
		
}