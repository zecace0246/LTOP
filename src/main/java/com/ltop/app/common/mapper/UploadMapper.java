package com.ltop.app.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ltop.app.common.domain.UploadAttachVO;

@Mapper
public interface UploadMapper {

	public int insertFile(UploadAttachVO vo);

	public int deleteFile(String uuid);

	public List<UploadAttachVO> findFileByBno(Long bno);

	public int deleteAllFiles(Long bno);

	public List<UploadAttachVO> getOldFiles();
	
}
