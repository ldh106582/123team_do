package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.BoardComment;

public interface BoardCommentRepository {

	List<BoardComment> getCommentsById(String boardId);

	void addComment(String boardId, String comment, String personId);
	
	void deleteComment(String commentId);

	void updateComment(BoardComment comment);
	
	String getBoardIdByCID(String commentId);

	BoardComment getCommentByCID(String commentId);
}
