package com.springmvc.repository;

import java.time.LocalDate;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.BoardComment;


@Repository
public class BoardCommentRepositoryImpl implements BoardCommentRepository {

	private JdbcTemplate template;

	 @Autowired
	 public void setJdbctemplate(DataSource dataSource) {
	     this.template = new JdbcTemplate(dataSource);
	 }
	 
//	해당 게시글의 댓글들 들고오기
	@Override
	public List<BoardComment> getCommentsById(String boardId) {
		String SQL = "SELECT * FROM BoardComment where BoardId="+boardId;
		
		List<BoardComment> commentlist  = template.query(SQL, new BoardCommentRowMapper());
		return commentlist;
	}

//	댓글 작성 
	@Override
	public void addComment(String boardId, String comment,String personId) {
		
		String SQL = "insert into BoardComment values(?,?,?,?,?)";
		template.update(SQL,boardId,comment,getRegistDay(),personId,CreatecommentId());
	}
//	날짜받기
	public LocalDate getRegistDay()
	{
		return LocalDate.now();
	}
//	댓글Id 생성
	public String CreatecommentId() {
		String str = Long.toString(System.currentTimeMillis()) ;
		return str;
	}
	
//	댓글 수정
	@Override
	public void updateComment(BoardComment comment) {
		
		String SQL = "update BoardComment set comment=? where commentId="+comment.getCommentId();
		template.update(SQL,comment.getComment());
	}

//  댓글 삭제
	@Override
	public void deleteComment(String commentId) {
		String SQL = "delete from BoardComment where commentId="+commentId;
		template.update(SQL);
		
	}

//	게시판 ID로 받기 이건 안쓰는거
	@Override
	public String getBoardIdByCID(String commentId) {
		String SQL = "select * from BoardComment where commentId="+commentId;
		List<BoardComment> boardComment = template.query(SQL,new BoardCommentRowMapper());
		
		System.out.println("============================================================");
		String boardId = boardComment.get(0).getBoardId();
		System.out.println(boardId);
		System.out.println("============================================================");
		if(boardComment.isEmpty()) {
			System.out.println("뭐가 문제야");
		}
		
		return boardId;
	}

//	게시판 ID로 댓글 객체 받기
	@Override
	public BoardComment getCommentByCID(String commentId) {
		String SQL = "SELECT * FROM BoardComment";
		List<BoardComment> listofcomments = template.query(SQL, new BoardCommentRowMapper());
		BoardComment comment = null;
		for(int i=0;i<listofcomments.size();i++) {
			comment = listofcomments.get(i);
			if(commentId.equals(comment.getCommentId())) {
				break;
			}
		}
		return comment;
	}
}
