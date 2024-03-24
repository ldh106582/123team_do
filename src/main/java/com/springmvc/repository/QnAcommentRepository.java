package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.QnAComment;

public interface QnAcommentRepository {

	List<QnAComment> getcommentbyId(String QnAId);
	void addcomment(String QnAId, String comment,String personId);
	void updatecomment(QnAComment qnacomment ,String comment,String commentId);
	void deletecomment(String commentId);
	QnAComment getcommentBycommentId(String commentId);
}
