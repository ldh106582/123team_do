package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.QnA;
import com.springmvc.domain.QnAComment;
import com.springmvc.repository.QnARepository;

@Service
public class QnAServiceImp implements QnAService{
	
	@Autowired
	QnARepository QnARepository;
	

	@Override
	public List<QnA> getAllQnAList(String productId) {
		
		return QnARepository.getAllQnAList(productId);
	}
	@Override
	public void addQnA(QnA QnA) {
		QnARepository.addQnA(QnA);
	}
	
	@Override
	public void updateQnA(QnA QnA , String QnAId) {
		QnARepository.updateQnA(QnA,QnAId);
	}
	
	@Override
	public void deleteQnA(String QnAId) {
		QnARepository.deleteQnA(QnAId);
		
	}

	@Override
	public List<QnA> getMyList(String personId) {
		return QnARepository.getMyList(personId);
	}

	
}