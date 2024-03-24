package com.springmvc.repository;

import java.time.LocalDate;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.NBoard;

@Repository
public class NBoardRepositoryImpl implements NBoardRepository{
	
	private JdbcTemplate template;

	@Autowired
	public void setJdbctemplate(DataSource dataSource) {
	     this.template = new JdbcTemplate(dataSource);
	}
	
//	공지글 전체 보기
	@Override
	public List<NBoard> getAllNBoards() {
		String SQL = "SELECT * FROM NBoard";
		List<NBoard> listofBoards = template.query(SQL, new NBoardRowMapper());
		return listofBoards;
	}
	
//  공지글 하나만 보기
	@Override
	public NBoard getNBoardById(String boardid) {
		String SQL = "SELECT * FROM NBoard";
		List<NBoard> listofBoards = template.query(SQL, new NBoardRowMapper());
		NBoard board = null;
		for(int i=0;i<listofBoards.size();i++) {
			board = listofBoards.get(i);
			if(boardid.equals(board.getBoardId())) {
				String hit = "update NBoard set Hit=? where Boardid="+boardid;
				template.update(hit,1+board.getHit());    
				break;
			}
		}
		return board;
	}
	
// 공지글 작성
	@Override
	public void setNBoard(NBoard board,String personId) {
		
		String SQL = "insert into NBoard values(?,?,?,?,?,?)";

//		이름과 아이디 받아오기 오류확인
		System.out.println("==============아이디받아온값================");


		
		
		template.update(SQL,personId,board.getContext(),board.getTitle(),0,getRegistDay(),CreateBoardId());
	}
//	날짜받기
	public LocalDate getRegistDay()
	{
		return LocalDate.now();
	}
//	boardId받기
	public String CreateBoardId() {
		String str = Long.toString(System.currentTimeMillis()) ;
		return str;
	}
	
//	공지글 수정
	@Override
	public void updateNBoard(NBoard board, String boardid) {
		String SQL = "update NBoard set title=?, context=? where Boardid="+boardid;
		template.update(SQL,board.getTitle(),board.getContext());
	}
	
// 	공지글 삭제
	@Override
	public void deleteNBoard(String boardId) {
		String SQL = "delete from NBoard where Boardid="+boardId;
		template.update(SQL);
	}
	
// 이름으로 공지글 검색
	@Override
	public List<NBoard> getNBoardsByTitle(String title) {
		try {
	        String SQL = "SELECT * FROM NBoard WHERE Title LIKE '%" + title + "%'";
	        List<NBoard> boardlist = template.query(SQL, new NBoardRowMapper());
	        
	        if (boardlist.isEmpty()) {
	            System.out.println("해당 제목은 없음");
	        } else {
	            NBoard board = boardlist.get(0);
	            System.out.println("--------------" + board.getTitle() + "----------------");
	        }
	        
	        return boardlist;
	    } catch (Exception e) {
	        // 예외 처리
	        e.printStackTrace();
	        return null; 
	    }
	}



}
