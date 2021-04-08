package com.ltop.app.common.domain;

import lombok.Data;

@Data
public class UploadAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
  
	private Long bno;
	
}
