package com.springmvc.repository;

import java.time.LocalDate;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.FBoard;

@Repository
public class FBoardRepositoryImpl implements FBoardRepository{
	
	private JdbcTemplate template;

	 @Autowired
	 public void setJdbctemplate(DataSource dataSource) {
	     this.template = new JdbcTemplate(dataSource);
	 }
//	게시판 전체 보기
	 public List<FBoard> getAllFBoards(){
			String SQL = "SELECT * FROM FBoard";
			List<FBoard> listofBoards = template.query(SQL, new FBoardRowMapper());
			return listofBoards;
	 }
//	하나만보기
	public FBoard getFBoardById(String boardid) {
		String SQL = "SELECT * FROM FBoard";
		List<FBoard> listofBoards = template.query(SQL, new FBoardRowMapper());
		FBoard board = null;
		for(int i=0;i<listofBoards.size();i++) {
			board = listofBoards.get(i);
			if(boardid.equals(board.getBoardId())) {
				String hit = "update FBoard set Hit=? where Boardid="+boardid;
				template.update(hit,1+board.getHit());    
				break;
			}
		}
		return board;
	}
//	게시글 등록
	public void setFBoard(FBoard board,String personId) {
		
		String SQL = "insert into FBoard values(?,?,?,?,?,?)";
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
	
	
//	게시글 수정
	@Override
	public void updateFBoard(FBoard board,String boardid) {
		String SQL = "update FBoard set title=?, context=? where Boardid="+boardid;
		template.update(SQL,board.getTitle(),board.getContext());
	}
//	게시글 삭제
	public void deleteFBoard(String boardId) {
		String SQL = "delete from FBoard where Boardid="+boardId;
		template.update(SQL);
	}
//	게시글 제목으로 검색
	public List<FBoard> getFBoardsByTitle(String title) {
		System.out.println("도착");
	    try {
	        String SQL = "SELECT * FROM FBoard WHERE Title LIKE '%" + title + "%'";
	        List<FBoard> boardlist = template.query(SQL, new FBoardRowMapper());
	        
	        if (boardlist.isEmpty()) {
	            System.out.println("해당 제목은 없음");
	        } else {
	            FBoard board = boardlist.get(0);
	            System.out.println("--------------" + board.getTitle() + "----------------");
	        }
	        
	        return boardlist;
	    } catch (Exception e) {
	        // 예외 처리
	        e.printStackTrace();
	        return null; 
	    }
	}
	@Override
	public List<FBoard> getAllMyFBoardsById(String myid) {
		 String SQL = "SELECT * FROM FBoard WHERE PersonId='"+myid+"'";
		 List<FBoard> boardlist = template.query(SQL, new FBoardRowMapper());
		return boardlist;
	}
}
