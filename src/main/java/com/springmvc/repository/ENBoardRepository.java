package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.EApplication;
import com.springmvc.domain.ENBoard;

public interface ENBoardRepository {

	List<ENBoard> getAllENBoards();
	ENBoard getENBoardById(String boardId);
	void setENBoard(ENBoard board, String personId);
	void updateENBoard(ENBoard board, String boardid);
	void deleteENBoard(String boardId);
	List<ENBoard> getENBoardsByTitle(String title);
	void addbook(EApplication application,String personId);
	List<EApplication> getAllApps(String personId);
	void deletebook(String eid);
	void updatebook(String registDay, String eid);
	List<EApplication> getPermisionList(String personId);
	void updateState(String dec, String eid);
	
}
