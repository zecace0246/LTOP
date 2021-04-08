package com.ltop.app.menu5.domain;

import java.util.Date;

import lombok.Data;

@Data
public class M5Sub4VO {

	private String searchCategory;
	private String searchCategorySub;
	private String searchAlarmType;
	
	private String category;
	private String categorySub;
	private String alarmType;
	private String description;
	private String basisMin;
	private String alarmFrom;
	private String alarmTo;
	private String alertYn;
	private Date regDate;
	
}
