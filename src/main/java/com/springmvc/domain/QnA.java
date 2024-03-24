package com.springmvc.domain;

import java.util.List;

public class QnA {
	private String personId; // 작성자Id
	private String productId; // 상품Id
	private String title; // 제목
	private String context; // 내용
	private String registDay; // 작성일
	private String comment; // 댓글
	private String image; // 이미지 파일
	private String qnaId;
	private List<QnAComment> commentlist;
	private String productname;

	public QnA() {
		// TODO Auto-generated constructor stub
	}

	public String getPersonId() {
		return personId;
	}
	public void setPersonId(String personId) {
		this.personId = personId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getRegistDay() {
		return registDay;
	}

	public void setRegistDay(String registDay) {
		this.registDay = registDay;
	}

	public String getComment() {
		return comment;
	}
	
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getQnaId() {
		return qnaId;
	}
	public void setQnaId(String qnaId) {
		this.qnaId = qnaId;
	}

	public List<QnAComment> getCommentlist() {
		return commentlist;
	}

	public void setCommentlist(List<QnAComment> commentlist) {
		this.commentlist = commentlist;
	}


	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}
}