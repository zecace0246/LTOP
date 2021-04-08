package com.ltop.app.board.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	
	private List<AttachFileDTO> attachList;
	
}
