package com.springmvc.repository;

import java.time.LocalDate;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.QnAComment;

@Repository
public class QnAcommentRepositoryImp implements QnAcommentRepository{

	private JdbcTemplate template;
	
	@Autowired
	public void setJdbctemplate(DataSource datasource) 
	{
		this.template = new JdbcTemplate(datasource);
	}
	
	@Override
	public List<QnAComment> getcommentbyId(String QnAId) {
		String SQL = "select * from QnAcomment where qnaId="+QnAId;
		
		List<QnAComment> commentlist = template.query(SQL, new QnAcommentRowMapper());
		
		return commentlist;
	}
	
	@Override
	public void addcomment(String QnAId, String comment,String personId) {
		String SQL = "insert into QnAcomment values (?,?,?,?,?)";
		template.update(SQL,QnAId,comment,getRegistDay(),personId,CreatecommentId());
		
	}
	
	@Override
	public void updatecomment(QnAComment qnaComment,String comment, String commentId) {
		String SQL = "update QnAcomment set comment=? where commentId='" + commentId + "'";
		template.update(SQL,comment);
		
	}
	
	@Override
	public void deletecomment(String commentId) {
		String SQL = "delete from QnAcomment where commentId="+commentId;
		template.update(SQL);
	}
	
	@Override
	public QnAComment getcommentBycommentId(String commentId) {
		String SQL = "select * from QnAcomment";
		List<QnAComment> commentlists = template.query(SQL,new QnAcommentRowMapper());
		QnAComment comment = null;
		for(int i = 0; i<commentlists.size(); i++) 
		{
			comment= commentlists.get(i);
			if(commentId.equals(comment.getCommentId())) 
			{
				break;
			}
		}
		return comment;
	}
	
	//날짜생성
	public LocalDate getRegistDay()
	{
		return LocalDate.now();
	}
	//commentId 생성
	public String CreatecommentId() {
		String str = Long.toString(System.currentTimeMillis()) ;
		return str;
	}
}
