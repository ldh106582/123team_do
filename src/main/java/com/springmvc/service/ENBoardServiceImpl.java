package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.EApplication;
import com.springmvc.domain.ENBoard;
import com.springmvc.repository.ENBoardRepository;

@Service
public class ENBoardServiceImpl implements ENBoardService{
	
	
	@Autowired ENBoardRepository enboardRepository;
	 
	
	@Override
	public List<ENBoard> getAllENBoards() {
		return enboardRepository.getAllENBoards();
	}


	@Override
	public ENBoard getENBoardById(String boardId) {
		return enboardRepository.getENBoardById(boardId);
	}


	@Override
	public void setNBoard(ENBoard board, String personId) {
		enboardRepository.setENBoard(board,personId);
	}


	@Override
	public ENBoard getNBoardById(String boardId) {
		return enboardRepository.getENBoardById(boardId);
	}


	@Override
	public void updateENBoard(ENBoard board, String boardId) {
		enboardRepository.updateENBoard(board, boardId);
		
	}


	@Override
	public void deleteENBoard(String boardId) {
		enboardRepository.deleteENBoard(boardId);
		
	}


	@Override
	public List<ENBoard> getENBoardsByTitle(String title) {
		return enboardRepository.getENBoardsByTitle(title);
	}


	@Override
	public void addbook(EApplication application,String personId) {
		enboardRepository.addbook(application,personId);
	}


	@Override
	public List<EApplication> getAllApps(String personId) {
		return enboardRepository.getAllApps(personId);
	}


	@Override
	public void deletebook(String eid) {
		enboardRepository.deletebook(eid);
	}


	@Override
	public void updatebook(String registDay, String eid) {
		enboardRepository.updatebook(registDay,eid);
		
	}


	@Override
	public List<EApplication> getPermisionList(String personId) {
		return enboardRepository.getPermisionList(personId);
	}


	@Override
	public void updateState(String dec, String eid) {
		enboardRepository.updateState(dec,eid);
		
	}
	
	

}
