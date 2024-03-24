package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.NBoard;

public interface NBoardService {
	List<NBoard> getAllNBoards();
	NBoard getNBoardById(String b_id);
	void setNBoard(NBoard board,String personId);
	void updateNBoard(NBoard board,String boardId);
	void deleteNBoard(String boardId);
	List<NBoard> getNBoardsByTitle(String title);
}
