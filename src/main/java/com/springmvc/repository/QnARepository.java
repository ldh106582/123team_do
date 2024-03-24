
package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.QnA;

public interface QnARepository {
	List<QnA> getAllQnAList(String productId);
	void addQnA(QnA QnA);
	void updateQnA(QnA QnA,String QnAId);
	void deleteQnA(String QnAId);

	List<QnA> getMyList(String personId);

}
