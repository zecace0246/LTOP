package com.ltop.app.common.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;

@Data
public class AlarmVO {

	private String userId;
	private String userName;

	private String matNo;
	private String matId;
	
	private String alarmNo;
	private String eventNum;
	private String eventNm;
	private String value;
	private String regDate;
	private String confirmYn;
	private String confirmDate;
	private String confirmId;
	private String agencyNo;
	private String groupSeq;
	private String agencyName;
	private String groupName;
	
	
	private String searchDateFrom;
	private String searchDateTo;
	private String searchType;
	private String searchUserName;
}
