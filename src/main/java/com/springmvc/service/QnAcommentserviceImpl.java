package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.QnAComment;
import com.springmvc.repository.QnAcommentRepository;

@Service
public class QnAcommentserviceImpl implements QnAcommentservice
{
	@Autowired
	QnAcommentRepository QnACommentRepository;
	
	@Override
	public List<QnAComment> getcommentbyId(String QnAId) {
		return QnACommentRepository.getcommentbyId(QnAId);
	}
	
	@Override
	public void addcomment(String QnAId, String comment,String personId) {
		QnACommentRepository.addcomment(QnAId, comment,personId);
	}
	
	@Override
	public void updatecomment(QnAComment qnacomment ,String comment, String commentId) {
		QnACommentRepository.updatecomment(qnacomment ,comment, commentId);
		
	}
	
	@Override
	public void deletecomment(String commentId) {
		QnACommentRepository.deletecomment(commentId);
		
	}
	
	@Override
	public QnAComment getcommentBycommentId(String commentId) {
		
		return QnACommentRepository.getcommentBycommentId(commentId);
	}
	
}
