package com.ltop.app.board.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ltop.app.board.domain.BoardAttachVO;
import com.ltop.app.board.domain.BoardVO;
import com.ltop.app.board.domain.Criteria;

public interface BoardService {

	public int selectBoardTotalCount(Criteria cri);
	
	public List<BoardVO> selectBoardList(Criteria cri);
	
	public BoardVO selectBoardInfo(Long bno);
	
	public boolean register(BoardVO board, MultipartFile[] uploadFile);
	
	public boolean modify(BoardVO board, MultipartFile[] uploadFile);

	public boolean remove(Long bno);
	
	public List<BoardAttachVO> getAttachList(Long bno);
	
	public void removeAttach(Long bno);
	
}
