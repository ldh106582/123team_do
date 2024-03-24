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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.springmvc.domain.BoardComment;
import com.springmvc.domain.NBoard;
import com.springmvc.service.BoardCommentService;
import com.springmvc.service.NBoardService;


@Controller
@RequestMapping("/Nboards")
public class NBoardContoller {
	
	@Autowired
	NBoardService nboardService;

	@Autowired
	BoardCommentService boardCommentService;
	
//	공지글 이동
	@RequestMapping
	public String ViewBoardlist(Model model,HttpServletRequest request) {
//		모든 공지글 가져오기
		if(model.containsAttribute("NBoardlist")) {
			return "notice_board/Nboards";
		}
		model.addAttribute("NBoardlist",nboardService.getAllNBoards());
		request.setAttribute("size", 5);
		return "notice_board/Nboards";
	}
	
//	공지글 하나만 보기
	@GetMapping("/Nboard")
	public String ViewBoard(@RequestParam("boardId") String boardId, Model model) {
		model.addAttribute("board",nboardService.getNBoardById(boardId));
//		해당 공지글 댓글 가져오기
		model.addAttribute("Commentlist",boardCommentService.getCommentsById(boardId));
		
		return "notice_board/Nboard";
	}
	
//	공지글 작성 페이지 이동
	@GetMapping("/add")
	public String addboardform(@ModelAttribute("board")NBoard board) {
		return "notice_board/addNboard";
	}

//	작성한 공지글 DB저장
	@PostMapping("/add") 
	public String addboard(@ModelAttribute("board")NBoard board,Model model,HttpSession session){ 
		 String personId = (String) session.getAttribute("personId");
		nboardService.setNBoard(board,personId);
		return "redirect:/Nboards";
	}
	
//	공지글 수정 페이지 이동
	@GetMapping("/update")
	public String updateboardform(@ModelAttribute("updateBoard")NBoard board,@RequestParam("boardId") String boardId,Model model) {
		model.addAttribute("board",nboardService.getNBoardById(boardId));
		NBoard b = nboardService.getNBoardById(boardId);
		System.out.println(b.getContext());
		return "notice_board/updateNboard";
	}
	
//	수정한정보를 DB에 저장
	@PostMapping("/update")
	public String updateboard(@ModelAttribute("updateBoard")NBoard board,@RequestParam("boardId") String boardId,Model model) {
		System.out.println("-----------연결완료----------");
		System.out.println(boardId);
		nboardService.updateNBoard(board,boardId);
		return "redirect:/Nboards/Nboard?boardId="+boardId;
	}
	
//	공지글 삭제
	@GetMapping("/delete")
	public String deleteboard(@RequestParam("boardId") String boardId) {
		nboardService.deleteNBoard(boardId);
		return "redirect:/Nboards";
	}
	
//	공지글 검색
	@GetMapping("/selectbytitle")
	public String selectboardbytitle(Model model,HttpServletRequest request) {
		String title = (String) request.getParameter("title");
		if(title.equals(null)||title.equals("")||title.equals(" ")) {
			return "redirect:/Nboards";
		}
		System.out.println(title);
		List<NBoard> NBoardlist = nboardService.getNBoardsByTitle(title);
		if(NBoardlist.isEmpty()) {
			//검색 결과가 없을때
			return "notice_board/exceptionpage";
		}
		model.addAttribute("NBoardlist",NBoardlist);
		request.setAttribute("size", NBoardlist.size());
		return "notice_board/Nboards";
	}
	
//	 공지글 댓글 작성
	 @PostMapping("/Nboard")
	 public String addComment(Model model,HttpServletRequest request,HttpSession session) {
		 String personId = (String) session.getAttribute("personId");
		 boardCommentService.addComment(request.getParameter("boardId").toString(),request.getParameter("comment").toString(),personId);
		 return "redirect:/Nboards/Nboard?boardId="+request.getParameter("boardId");
	 }
	 
//	 댓글 수정 페이지로 보내기
	 @GetMapping("/updatecommentform")
	 public String updatecommentform(@RequestParam("commentId") String commentId,Model model) {

		// 댓글객체 들고오기 
		BoardComment comments = boardCommentService.getCommentByCID(commentId);
		
		// 게시판객체 들고오기 
		NBoard board = nboardService.getNBoardById(comments.getBoardId());
		
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
		  return "redirect:/Nboards/Nboard?boardId="+boardId;
	  }
		 
	 
//	 댓글 삭제
	 @GetMapping("/deletecoment")
	 public String deletecomment(@RequestParam("commentId") String commentId,@RequestParam("boardId") String boardId,Model model,HttpServletRequest request) {
		 boardCommentService.deleteComment(commentId);
		 return "redirect:/Nboards/Nboard?boardId="+boardId; 
	 }
	 
}
