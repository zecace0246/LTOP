package com.ltop.app.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ltop.app.board.domain.AttachFileDTO;
import com.ltop.app.board.domain.BoardAttachVO;
import com.ltop.app.board.domain.BoardVO;
import com.ltop.app.board.domain.Criteria;
import com.ltop.app.board.mapper.BoardMapper;
import com.ltop.app.board.service.BoardService;
import com.ltop.app.common.utils.UploadUtils;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Setter(onMethod_ = @Autowired)
	private UploadUtils uploadUtils;
	
	@Override
	public int selectBoardTotalCount(Criteria cri) {
		return boardMapper.selectBoardTotalCount(cri);
	}	
	
	@Override
	public List<BoardVO> selectBoardList(Criteria cri) {
		return boardMapper.selectBoardList(cri);
	}
	
	@Override
	public BoardVO selectBoardInfo(Long bno) {
		return boardMapper.selectBoardInfo(bno);
	}	
			
	@Transactional
	@Override
	public boolean register(BoardVO board, MultipartFile[] uploadFile) {
		List<AttachFileDTO> attachFileList = null;
		
		if (uploadFile != null) {
			attachFileList = uploadUtils.uploadFile(uploadFile);
		}
		
		boolean registerResult = boardMapper.insert(board) == 1;
		
		if (registerResult) {			
			if (!attachFileList.isEmpty()) {
				BoardAttachVO boardAttachVO = new BoardAttachVO();
				
				attachFileList.forEach(attach -> {
					boardAttachVO.setBno(board.getBno());
					boardAttachVO.setUuid(attach.getUuid());
					boardAttachVO.setUploadPath(attach.getUploadPath());
					boardAttachVO.setFileName(attach.getFileName());
					boardAttachVO.setFileType(attach.isFileType());
					
					boardMapper.insertFile(boardAttachVO);
				});		
			}
		}
				
		return registerResult;
	}

	@Transactional
	@Override
	public boolean modify(BoardVO board, MultipartFile[] uploadFile) {
		List<AttachFileDTO> attachFileList = null;
		
		if (uploadFile != null) {
			attachFileList = uploadUtils.uploadFile(uploadFile);
		}		
				
		boolean modifyResult = boardMapper.update(board) == 1;
		
		if (modifyResult) {			
			if (!attachFileList.isEmpty()) {
				BoardAttachVO boardAttachVO = new BoardAttachVO();
				
				attachFileList.forEach(attach -> {
					boardAttachVO.setBno(board.getBno());
					boardAttachVO.setUuid(attach.getUuid());
					boardAttachVO.setUploadPath(attach.getUploadPath());
					boardAttachVO.setFileName(attach.getFileName());
					boardAttachVO.setFileType(attach.isFileType());
					
					boardMapper.insertFile(boardAttachVO);
				});		
			}
		}
		
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean remove(Long bno) {
		boardMapper.deleteAllFiles(bno);
		
		return boardMapper.delete(bno) == 1;
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		return boardMapper.findFileByBno(bno);
	}

	@Override
	public void removeAttach(Long bno) {
		boardMapper.deleteAllFiles(bno);
	}
	
}
