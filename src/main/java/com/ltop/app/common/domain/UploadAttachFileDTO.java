package com.ltop.app.common.domain;

import lombok.Data;

@Data
public class UploadAttachFileDTO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
}
