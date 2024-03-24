package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.BoardComment;
import com.springmvc.repository.BoardCommentRepository;

@Service
public class BoardCommentServiceImpl implements BoardCommentService {

	@Autowired
	BoardCommentRepository boardCommentRepository;
	
	@Override
	public List<BoardComment> getCommentsById(String boardId) {
		return boardCommentRepository.getCommentsById(boardId);
	}

	@Override
	public void addComment(String boardId, String comment,String personId) {
		boardCommentRepository.addComment(boardId,comment,personId);
		
	}

	@Override
	public void deleteComment(String commentId) {
		boardCommentRepository.deleteComment(commentId);
	}

	@Override
	public void updateComment(BoardComment comment) {
		boardCommentRepository.updateComment(comment);
		
	}

	@Override
	public String getBoardIdByCID(String commentId) {
		boardCommentRepository.getBoardIdByCID(commentId);
		return null;
	}

	@Override
	public BoardComment getCommentByCID(String commentId) {
		return boardCommentRepository.getCommentByCID(commentId);
	}

}
