package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.NBoard;

public interface NBoardRepository {

	List<NBoard> getAllNBoards();
	NBoard getNBoardById(String b_id);
	void setNBoard(NBoard board,String personId);
	void updateNBoard(NBoard board,String b_id);
	void deleteNBoard(String boardId);
	List<NBoard> getNBoardsByTitle(String title);

}
