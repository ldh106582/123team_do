package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.EApplication;
import com.springmvc.domain.ENBoard;

public interface ENBoardService {

	List<ENBoard> getAllENBoards();

	ENBoard getENBoardById(String boardId);

	void setNBoard(ENBoard board, String personId);

	ENBoard getNBoardById(String boardId);

	void updateENBoard(ENBoard board, String boardId);

	void deleteENBoard(String boardId);

	List<ENBoard> getENBoardsByTitle(String title);

	void addbook(EApplication application,String personId);

	List<EApplication> getAllApps(String personId);

	void deletebook(String eid);

	void updatebook(String registDay, String eid);

	List<EApplication> getPermisionList(String personId);

	void updateState(String dec, String eid);

}
