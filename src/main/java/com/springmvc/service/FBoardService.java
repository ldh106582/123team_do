package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.FBoard;

public interface FBoardService {
	List<FBoard> getAllFBoards();
	FBoard getFBoardById(String b_id);
	void setFBoard(FBoard board, String personId);
	void updateFBoard(FBoard board,String boardId);
	void deleteFBoard(String boardId);
	List<FBoard> getFBoardsByTitle(String title);
	List<FBoard> getAllMyFBoardsById(String myId);
}
