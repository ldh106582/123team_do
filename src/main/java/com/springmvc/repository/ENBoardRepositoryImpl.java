package com.springmvc.repository;

import java.time.LocalDate;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.EApplication;
import com.springmvc.domain.ENBoard;

@Repository
public class ENBoardRepositoryImpl implements ENBoardRepository{

	private JdbcTemplate template;

	@Autowired
	public void setJdbctemplate(DataSource dataSource) {
	     this.template = new JdbcTemplate(dataSource);
	}
	
	
	@Override
	public List<ENBoard> getAllENBoards() {
		String SQL = "SELECT * FROM ENBoard";
		List<ENBoard> listofBoards = template.query(SQL, new ENBoardRowMapper());
		return listofBoards;
	}

//  공지글 하나만 보기
	@Override
	public ENBoard getENBoardById(String boardid) {
		String SQL = "SELECT * FROM ENBoard";
		List<ENBoard> listofBoards = template.query(SQL, new ENBoardRowMapper());
		ENBoard board = null;
		for(int i=0;i<listofBoards.size();i++) {
			board = listofBoards.get(i);
			if(boardid.equals(board.getBoardId())) {
				String hit = "update ENBoard set Hit=? where Boardid="+boardid;
				template.update(hit,1+board.getHit());    
				break;
			}
		}
		return board;
	}
	
// 공지글 작성
	@Override
	public void setENBoard(ENBoard board,String personId) {
		
		String SQL = "insert into ENBoard values(?,?,?,?,?,?,?,?)";
//		이름과 아이디 받아오기
		template.update(SQL,board.getContext(),board.getTitle(),0,getRegistDay(),board.getExperience(),board.getAnimal(),CreateBoardId(),personId);
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
	public void updateENBoard(ENBoard board, String boardid) {
		String SQL = "update ENBoard set Title=?,Context=?,Animal=?,Experience=? where Boardid="+boardid;
		template.update(SQL,board.getTitle(),board.getContext(),board.getAnimal(),board.getExperience());
	}
	
// 	공지글 삭제
	@Override
	public void deleteENBoard(String boardId) {
		String SQL = "delete from ENBoard where Boardid="+boardId;
		template.update(SQL);
	}
	
// 이름으로 공지글 검색
	@Override
	public List<ENBoard> getENBoardsByTitle(String title) {
		try {
	        String SQL = "SELECT * FROM ENBoard WHERE Title LIKE '%" + title + "%'";
	        List<ENBoard> boardlist = template.query(SQL, new ENBoardRowMapper());
	        
	        if (boardlist.isEmpty()) {
	            System.out.println("해당 제목은 없음");
	        }
	        return boardlist;
	    } catch (Exception e) {
	        // 예외 처리
	        e.printStackTrace();
	        return null; 
	    }
	}

// 체험단 예약
	@Override
	public void addbook(EApplication application,String personId) {
		String SQL = "insert into EApllication values(?,?,?,?,?,?,?,?,?)";
		template.update(SQL,application.getExperience(),application.getAnimal(),application.getRegistDay(),"처리중",personId,application.getTitle(),CreateEId(),application.getMid(),application.getBoardId(),"before");

	}
	
//	체험단Id 생성
	public String CreateEId() {
		String str = Long.toString(System.currentTimeMillis());
		return str;
	}

//	예약 확인
	@Override
	public List<EApplication> getAllApps(String personId) {
		String SQL = "select * from EApllication where personId='"+personId+"'";
		List<EApplication> ealist = template.query(SQL, new EApplicationRowMapper());
		return ealist;
	}
	
//	예약 삭제
	@Override
	public void deletebook(String eid) {
		String SQL = "delete from EApllication where Eid='"+eid+"'";
		template.update(SQL);
	}

//	예약 날짜 수정
	@Override
	public void updatebook(String registDay, String eid) {
		String SQL = "update EApllication set RegistDay=?,state=? where Eid='"+eid+"'";
		template.update(SQL,registDay,"처리중");
	}


	@Override
	public List<EApplication> getPermisionList(String personId) {
		String SQL = "Select * from EApllication where state='처리중' and Mid='"+personId+"'";
		List<EApplication> list  =template.query(SQL, new EApplicationRowMapper());
		return list;
	}


	@Override
	public void updateState(String dec, String eid) {
		String SQL = "update EApllication set state=? where Eid='"+eid+"'";
		template.update(SQL,dec);
	}
	
	
}
