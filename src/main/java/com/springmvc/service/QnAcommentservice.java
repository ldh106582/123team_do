package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.springmvc.domain.QnAComment;

public interface QnAcommentservice {
	
	List<QnAComment> getcommentbyId(String QnAId);
	void addcomment(String QnAId, String comment,String personId);
	void updatecomment(QnAComment qnacomment,String comment,String commentId);
	void deletecomment(String commentId);
	QnAComment getcommentBycommentId(String commentId);

}
