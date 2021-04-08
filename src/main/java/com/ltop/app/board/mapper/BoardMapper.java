package com.ltop.app.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ltop.app.board.domain.BoardAttachVO;
import com.ltop.app.board.domain.BoardVO;
import com.ltop.app.board.domain.Criteria;

@Mapper
public interface BoardMapper {

	public int selectBoardTotalCount(Criteria cri);
	
	public List<BoardVO> selectBoardList(Criteria cri);
	
	public BoardVO selectBoardInfo(Long bno);
	
	public int insert(BoardVO board);
	
	public int update(BoardVO board);
	
	public int delete(Long bno);
	
	public void insertFile(BoardAttachVO vo);

	public void deleteFile(String uuid);

	public List<BoardAttachVO> findFileByBno(Long bno);

	public void deleteAllFiles(Long bno);

	public List<BoardAttachVO> getOldFiles();
	
}
