package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;



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
import com.springmvc.domain.BoardComment;
import com.springmvc.domain.EApplication;
import com.springmvc.domain.ENBoard;
import com.springmvc.service.BoardCommentService;
import com.springmvc.service.ENBoardService;

@Controller
@RequestMapping("/ENboards")
public class ENBoardController {
	
	@Autowired 
	ENBoardService enboardService;
	 

	@Autowired
	BoardCommentService boardCommentService;
	
//	체험공고글 이동
	@RequestMapping
	public String ViewBoardlist(Model model,HttpServletRequest request,HttpSession session) {
//		모든 공지글 가져오기
		if(model.containsAttribute("ENBoardlist")) {
			return "experience_board/ENboards";
		}
		model.addAttribute("ENBoardlist",enboardService.getAllENBoards());
		request.setAttribute("size", 5);
		return "experience_board/ENboards";
	} 
	
//	체험공고글 하나만 보기
	@GetMapping("/ENboard")
	public String ViewBoard(@RequestParam("boardId") String boardId, Model model,HttpSession session) {
		model.addAttribute("board",enboardService.getENBoardById(boardId));
//		해당 공지글 댓글 가져오기
		model.addAttribute("Commentlist",boardCommentService.getCommentsById(boardId));
		return "experience_board/ENboard";
	}
	
//	체험공고글 작성 페이지 이동
	@GetMapping("/add")
	public String addboardform(@ModelAttribute("board")ENBoard board,HttpSession session) {
		System.out.println(session.getAttribute("personId"));
		return "experience_board/addENboard";
	}

//	작성한 체험공고글 DB저장
	@PostMapping("/add") 
	public String addboard(@ModelAttribute("board")ENBoard board,Model model,HttpSession session){ 
		String personId = (String) session.getAttribute("personId");
		enboardService.setNBoard(board,personId);
		return "redirect:/ENboards";
	}
	
//	체험공고글 수정 페이지 이동
	@GetMapping("/update")
	public String updateboardform(@ModelAttribute("updateBoard")ENBoard board,@RequestParam("boardId") String boardId,Model model) {
		model.addAttribute("board",enboardService.getENBoardById(boardId));
		return "experience_board/updateENboard";
	}
	
//	수정한정보를 DB에 저장
	@PostMapping("/update")
	public String updateboard(@ModelAttribute("updateBoard")ENBoard board,@RequestParam("boardId") String boardId,Model model) {
		enboardService.updateENBoard(board,boardId);
		return "redirect:/ENboards/ENboard?boardId="+boardId;
	}
	
//	체험공고글 삭제
	@GetMapping("/delete")
	public String deleteboard(@RequestParam("boardId") String boardId) {
		enboardService.deleteENBoard(boardId);
		return "redirect:/ENboards";
	}
	
//	체험공고글 검색
	@GetMapping("/selectbytitle")
	public String selectboardbytitle(Model model,HttpServletRequest request) {
		String title = (String) request.getParameter("title");
		System.out.println(title);
		if(title.equals(null)||title.equals("")||title.equals(" ")) {
			return "redirect:/ENboards";
		}
		System.out.println(title);
		List<ENBoard> ENBoardlist = enboardService.getENBoardsByTitle(title);
		if(ENBoardlist.isEmpty()) {
			//검색 결과가 없을때
			return "experience_board/exceptionpage";
		}
		model.addAttribute("ENBoardlist",ENBoardlist);
		request.setAttribute("size", ENBoardlist.size());
		return "experience_board/ENboards";
	}
	
//	 체험공고글 댓글 작성
	 @PostMapping("/ENboard")
	 public String addComment(Model model,HttpServletRequest request,HttpSession session) {
		 String personId = (String) session.getAttribute("personId");
		 boardCommentService.addComment(request.getParameter("boardId").toString(),request.getParameter("comment").toString(),personId);
		 return "redirect:/ENboards/ENboard?boardId="+request.getParameter("boardId");
	 }
	 
//	 댓글 수정 페이지로 보내기
		
	@GetMapping("/updatecommentform") 
	public String updatecommentform(@RequestParam("commentId") String commentId,Model model) {
		// 댓글객체 들고오기 
		BoardComment comments = boardCommentService.getCommentByCID(commentId);
		// 게시판객체 들고오기 
		ENBoard board = enboardService.getNBoardById(comments.getBoardId());
		
		model.addAttribute("board",board);
		model.addAttribute("comments",comments);
		return "board_comment/updateCommentForm"; 
	}
		 
	 
//	 수정한 정보 저장
		
	  @PostMapping("/updatecomment") 
	  public String updatecomment(HttpServletRequest request) {
		  BoardComment comment = boardCommentService.getCommentByCID(request.getParameter("commentId").toString());
		  String boardId = comment.getBoardId(); 
		  comment.setComment(request.getParameter("comment").toString());
		  boardCommentService.updateComment(comment);
		  return "redirect:/ENboards/ENboard?boardId="+boardId; 
	  }
		 
	 
//	 댓글 삭제
	 @GetMapping("/deletecoment")
	 public String deletecomment(@RequestParam("commentId") String commentId,@RequestParam("boardId") String boardId,Model model,HttpServletRequest request) {
		 boardCommentService.deleteComment(commentId);
		 return "redirect:/ENboards/ENboard?boardId="+boardId; 
	 }
	 
//	 (사용자)
//	 예약 목록 보기
	 @GetMapping("/applist")
	 public String applist(Model model,HttpSession session) {
		 String personId = (String) session.getAttribute("personId");
		 model.addAttribute("applist",enboardService.getAllApps(personId));
		 return "experience_board/apps";
	 }
//	 체험단 신청
	 @PostMapping("/addapp")
	 public String bookex(HttpServletRequest request,HttpSession session) {
		 EApplication application = new EApplication();
		 application.setMid(request.getParameter("mid"));
		 application.setAnimal(request.getParameter("animal"));
		 application.setExperience(request.getParameter("experience"));
		 application.setRegistDay(request.getParameter("registDay"));
		 application.setTitle(request.getParameter("title"));
		 application.setBoardId(request.getParameter("boardId"));
		 System.out.println("=======================================");
		 System.out.println(request.getParameter("registDay"));
		 enboardService.addbook(application,session.getAttribute("personId").toString());
		 return "redirect:/ENboards/applist";
	 }
//	 예약 삭제
	 @GetMapping("/deleteapp")
	 public String deletebook(@RequestParam("eid")String eid) {
		 enboardService.deletebook(eid);
		 return "redirect:/ENboards/applist";
	 }
//	 날짜 변경
	 @PostMapping("/updateapp")
	 public String updateapp(@RequestParam("originday") String originday,HttpServletRequest request) {
		 String registDay = request.getParameter("registDay");
		 if(registDay.equals(originday)) {
			 return "redirect:/ENboards/applist";
		 }
		 String eid = request.getParameter("eid");
		 enboardService.updatebook(registDay,eid);
		 return "redirect:/ENboards/applist";
	 }
//	 (관리자)
//	 모든 신청 보기
	 @GetMapping("manageapps")
	 public String manageapps(Model model,HttpServletRequest request,HttpSession session) {
		 String personId = (String) session.getAttribute("personId");
		 model.addAttribute("applists",enboardService.getPermisionList(personId));
		 
		 if(enboardService.getPermisionList(personId).isEmpty()) {
			 request.setAttribute("nothing", "승인할 것이 없어요");
		 }
		 
		 return "experience_board/manageapps";
	 }
// 	 신청 승인
	 @GetMapping("decision")
	 public String decision(@RequestParam("dec") String dec,@RequestParam("eid") String eid){
		 enboardService.updateState(dec,eid);
		 return "redirect:/ENboards/manageapps";
	 }
}
