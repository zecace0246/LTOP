package com.ltop.app.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ltop.app.common.domain.UploadAttachVO;
import com.ltop.app.common.mapper.UploadMapper;
import com.ltop.app.common.service.UploadService;

import lombok.Setter;

@Service
public class UploadServiceImpl implements UploadService {

	@Setter(onMethod_ = @Autowired)
	private UploadMapper uploadMapper;
	
	@Override
	public int insertFile(UploadAttachVO vo) {
		return uploadMapper.insertFile(vo);
	}

	@Override
	public int deleteFile(String uuid) {
		return uploadMapper.deleteFile(uuid);
	}

	@Override
	public List<UploadAttachVO> findFileByBno(Long bno) {
		return uploadMapper.findFileByBno(bno);
	}

	@Override
	public int deleteAllFiles(Long bno) {
		return uploadMapper.deleteAllFiles(bno);
	}

	@Override
	public List<UploadAttachVO> getOldFiles() {
		return uploadMapper.getOldFiles();
	}

}
