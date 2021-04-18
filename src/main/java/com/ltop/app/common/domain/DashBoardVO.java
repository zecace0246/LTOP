package com.ltop.app.common.domain;

import java.util.Date;

import lombok.Data;

@Data
public class DashBoardVO {

	private String userId;
	private String userName;

	private String matNo;
	private String matId;
	

	
	private String tdayr;
	private String tdayh;
	private String tdays;
	private String tdayx;
	private String toteventcnt;
	private String confirmcnt;
	private String totmatcnt;
	private String usecnt;
}
