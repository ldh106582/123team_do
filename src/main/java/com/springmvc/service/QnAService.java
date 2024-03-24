package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.QnA;
import com.springmvc.domain.QnAComment;

public interface QnAService {
	List<QnA> getAllQnAList(String productId);
	void addQnA(QnA QnA);
	void updateQnA(QnA QnA,String QnAId);
	void deleteQnA(String QnAId);
	List<QnA> getMyList(String personId);

	
}