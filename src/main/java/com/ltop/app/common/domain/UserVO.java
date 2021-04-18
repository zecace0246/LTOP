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

}
