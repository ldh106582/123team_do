package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.BoardComment;

public interface BoardCommentService {

	List<BoardComment> getCommentsById(String boardId);
	void addComment(String boardId, String comment, String personId);
	void deleteComment(String commentId);
	void updateComment(BoardComment boardComment);
	String getBoardIdByCID(String commentId);
	BoardComment getCommentByCID(String commentId);
}
