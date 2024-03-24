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
import com.springmvc.domain.FBoard;

import com.springmvc.service.BoardCommentService;
import com.springmvc.service.FBoardService;

@Controller
@RequestMapping("/Fboards")
public class FBoardContoller {
	
	@Autowired
	FBoardService fboardService;

	@Autowired
	BoardCommentService boardCommentService;
	
//	게시판 이동
	@RequestMapping
	public String ViewBoardlist(Model model,HttpServletRequest request) {
//		모든 게시글 가져오기
		if(model.containsAttribute("FBoardlist")) {
			return "free_board/Fboards";
		}
		
		if(request.getParameter("myId")!=null) {
			String myId = request.getParameter("myId");
			List<FBoard> FBoardlist = fboardService.getAllMyFBoardsById(myId);
			if(FBoardlist.isEmpty()) {
				request.setAttribute("nothing", "내가 작성한 게시물이 없어요");
				request.setAttribute("size",5);
				return "free_board/Fboards";
			}
			model.addAttribute("FBoardlist",FBoardlist);
			request.setAttribute("size", FBoardlist.size());
			return "free_board/Fboards";
		}
		model.addAttribute("FBoardlist",fboardService.getAllFBoards());
		request.setAttribute("size", 5);
		return "free_board/Fboards";
	}
	
//	게시글 하나만 보기
	@GetMapping("/Fboard")
	public String ViewBoard(@RequestParam("boardId") String boardId, Model model) {
		model.addAttribute("board",fboardService.getFBoardById(boardId));
//		해당 게시글의 댓글 가져오기
		model.addAttribute("Commentlist",boardCommentService.getCommentsById(boardId));
		
		return "free_board/Fboard";
	}
	
//	게시판 작성 페이지 이동
	@GetMapping("/add")
	public String addboardform(@ModelAttribute("board")FBoard board,HttpSession session) {
		return "free_board/addFboard";
	}

//	작성한 게시글 DB저장
	@PostMapping("/add") 
	public String addboard(@ModelAttribute("board")FBoard board,Model model,HttpSession session){ 
		String personId = (String) session.getAttribute("personId");
		fboardService.setFBoard(board,personId);
		return "redirect:/Fboards";
	}
	
//	게시글 수정 페이지 이동
	@GetMapping("/update")
	public String updateboardform(@ModelAttribute("updateBoard")FBoard board,@RequestParam("boardId") String boardId,Model model) {
		model.addAttribute("board",fboardService.getFBoardById(boardId));
		FBoard b = fboardService.getFBoardById(boardId);
		System.out.println(b.getContext());
		return "free_board/updateFboard";
	}
	
//	수정한정보를 DB에 저장
	@PostMapping("/update")
	public String updateboard(@ModelAttribute("updateBoard")FBoard board,@RequestParam("boardId") String boardId,Model model) {
		System.out.println("-----------연결완료----------");
		System.out.println(boardId);
		fboardService.updateFBoard(board,boardId);
		return "redirect:/Fboards";
	}
	
//	게시글 삭제
	@GetMapping("/delete")
	public String deleteboard(@RequestParam("boardId") String boardId) {
		fboardService.deleteFBoard(boardId);
		return "redirect:/Fboards";
	}
	
//	게시물 검색
	@GetMapping("/selectbytitle")
	public String selectboardbytitle(Model model,HttpServletRequest request) {
		String title = (String) request.getParameter("title");
		System.out.println(title);
		if(title.equals(null)||title.equals("")||title.equals(" ")) {
			return "redirect:/Fboards";
		}
		List<FBoard> FBoardlist = fboardService.getFBoardsByTitle(title);
		if(FBoardlist.isEmpty()) {
			//검색 결과가 없을때
			return "free_board/exceptionpage";
		}

		System.out.println("=================================");
		System.out.println(FBoardlist.get(0).getTitle());

		model.addAttribute("FBoardlist",FBoardlist);
		request.setAttribute("size", FBoardlist.size());
		return "free_board/Fboards";
	}
	
//	게시글 댓글 작성
	 @PostMapping("/Fboard")
	 public String addComment(Model model,HttpServletRequest request,HttpSession session) {
		 String personId = (String) session.getAttribute("personId");
		 boardCommentService.addComment(request.getParameter("boardId").toString(),request.getParameter("comment").toString(),personId);
		 return "redirect:/Fboards/Fboard?boardId="+request.getParameter("boardId");
	 }
	 
//	 댓글 수정 페이지로 보내기
	 @GetMapping("/updatecommentform")
	 public String updatecommentform(@RequestParam("commentId") String commentId,Model model) {


		// 댓글객체 들고오기 
		BoardComment comments = boardCommentService.getCommentByCID(commentId);
		
		// 게시판객체 들고오기 
		FBoard board = fboardService.getFBoardById(comments.getBoardId());
		
		model.addAttribute("board",board); 
		model.addAttribute("comments",comments);

		return "board_comment/updateCommentForm";
	 }
	 
	 
//	 수정한 정보 저장
		
	  @PostMapping("/updatecomment") 
	  public String updatecomment(HttpServletRequest request) {
		  BoardComment comment = boardCommentService.getCommentByCID(request.getParameter("commentId").toString());
		  String boardId = comment.getBoardId(); 
		  System.out.println("===================");
		  comment.setComment(request.getParameter("comment").toString());
		  boardCommentService.updateComment(comment);
		  return "redirect:/Fboards/Fboard?boardId="+boardId; 
	  }
		 
	 
//	 댓글 삭제
	 @GetMapping("/deletecoment")
	 public String deletecomment(@RequestParam("commentId") String commentId,@RequestParam("boardId") String boardId,Model model,HttpServletRequest request) {
		 boardCommentService.deleteComment(commentId);
		 return "redirect:/Fboards/Fboard?boardId="+boardId; 
	 }
	 
}
