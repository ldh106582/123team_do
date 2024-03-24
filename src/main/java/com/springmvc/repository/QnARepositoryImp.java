package com.springmvc.repository;

import java.time.LocalDate;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.QnA;

@Repository
public class QnARepositoryImp implements QnARepository{

	private JdbcTemplate template;

	 @Autowired
	 public void setJdbctemplate(DataSource dataSource) {
	     this.template = new JdbcTemplate(dataSource);
	 }
	
	//전체 보기
	@Override
	public List<QnA> getAllQnAList(String productId) {
		String SQL = "select * from QnA where productId ='"+productId+"'";
		List<QnA> list = template.query(SQL, new QnArowMapper());
		return list;
	}
	
	
	//Create
	@Override
	public void addQnA(QnA QnA) {
		String SQL = "insert into QnA values(?,?,?,?,?,?,?)";
		template.update(SQL,QnA.getPersonId(),QnA.getProductId(),QnA.getTitle(),QnA.getContext(),getRegistDay(),QnA.getImage(), createQnAID());
	}
	//Update 
	@Override
	public void updateQnA(QnA QnA,String QnAId) {
		
		String SQL = "update QnA set title=?, context=?, image=? where QnAId='" + QnAId + "'";
		template.update(SQL,QnA.getTitle(),QnA.getContext(),QnA.getImage());
		
	}
	//Delete
	@Override
	public void deleteQnA(String QnAId) {
		String SQL = "delete from QnA where QnAId="+QnAId;	
		template.update(SQL);
		
	}

	
	//registday
	public LocalDate getRegistDay()
	{
		return LocalDate.now();
	}
	//QnAId만들기
	public String createQnAID() 
	{
		String id =  Long.toString(System.currentTimeMillis()) ;
		return id;
	}

	@Override
	public List<QnA> getMyList(String personId) {
		String SQL = "Select * from QnA where personId='"+personId+"'";
		
		return template.query(SQL, new QnArowMapper());
	}
	
	
}