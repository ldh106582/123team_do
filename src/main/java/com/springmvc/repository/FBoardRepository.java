package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.FBoard;

public interface FBoardRepository {
	List<FBoard> getAllFBoards();
	FBoard getFBoardById(String b_id);
	void setFBoard(FBoard board, String personId);
	void updateFBoard(FBoard board,String b_id);
	void deleteFBoard(String boardId);
	List<FBoard> getFBoardsByTitle(String title);
	List<FBoard> getAllMyFBoardsById(String myid);
	
}
