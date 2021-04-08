package com.ltop.app.common.service;

import java.util.List;

import com.ltop.app.common.domain.UploadAttachVO;

public interface UploadService {

	public int insertFile(UploadAttachVO vo);

	public int deleteFile(String uuid);

	public List<UploadAttachVO> findFileByBno(Long bno);

	public int deleteAllFiles(Long bno);

	public List<UploadAttachVO> getOldFiles();
	
}
