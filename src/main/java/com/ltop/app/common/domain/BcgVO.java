package com.ltop.app.common.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BcgVO {

	
	private String bno;	
	private String matId;	
	private String respirationRate;
	private String heartRate;
	private String sleepMode;

	private String respirationRateMin;
	private String respirationRateMax;
	private String heartRateMin;
	private String heartRateMax;
	
	private String regDate;

}
