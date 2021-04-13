package com.ltop.app.common.domain;

import lombok.Data;

@Data
public class CommonComboVO {

	//User Combo
	private String userId;
	private String userName;

	//Mat Combo
	private String matNo;
	private String matId;

	//Agency Combo
	private String agencyNo;
    private String agencyName;

    //Agency Group Combo
    private String groupSeq;
    private String groupName;

}
