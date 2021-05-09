package com.ltop.app.common.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {

	private String userId;
	private String userName;

	private String matNo;
	private String matId;

	private String agencyName;
	private String groupName;
	private String respirationRate;
	private String heartRate;
	private String sleepMode;
	private String fallAlarm;
	
	private String regDate;

	
	private String respirationRateMax;	
	private String respirationRateMin;	
	private String heartRateMax;	
	private String heartRateMin;	
	private String sleepModeMin;
	private String sleepModeMax;

	private String positionTime;
	private String positionUpdate;
	private String positionCurrent;

	
	private String searchDateFrom;
	private String agencyNo;
	private String groupSeq;
	private String searchUserName;
}
