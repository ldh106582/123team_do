package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.NBoard;
import com.springmvc.repository.NBoardRepository;

@Service
public class NBoardServiceImpl implements NBoardService {

	@Autowired
	NBoardRepository nboardRepository;

	@Override
	public List<NBoard> getAllNBoards() {
		return nboardRepository.getAllNBoards();
	}

	@Override
	public NBoard getNBoardById(String b_id) {
		return nboardRepository.getNBoardById(b_id);
	}

	@Override
	public void setNBoard(NBoard board,String personId) {
		nboardRepository.setNBoard(board,personId);
	}

	@Override
	public void updateNBoard(NBoard board, String boardId) {
		nboardRepository.updateNBoard(board, boardId);
	}

	@Override
	public void deleteNBoard(String boardId) {
		nboardRepository.deleteNBoard(boardId);
		
	}

	@Override
	public List<NBoard> getNBoardsByTitle(String title) {
		return nboardRepository.getNBoardsByTitle(title);
	}
	
}
