package com.ltop.app.common.domain;

import lombok.Data;

@Data
public class ComComboVO {

	//Sex Combo
	private String sexCd;
	private String sexName;

	//Mat Combo
	private String matNo;
	private String matId;

	//Agency Combo
	private String agencyNo;
    private String agencyName;

    //Agency Group Combo
    private String groupSeq;
    private String groupName;

    //sleep_time Combo
    private String sleepTime;
    private String sleepTimeVal;

    //position_time Combo
    private String positionTime;
    private String positionTimeVal;

}
