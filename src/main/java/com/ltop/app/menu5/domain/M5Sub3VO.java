package com.ltop.app.menu5.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class M5Sub3VO implements Serializable {

	private static final long serialVersionUID = 1L;

	private String searchAgencyName;
	private String searchAdmId;
	private String searchAdmName;
	private String searchUseYn;
	private String searchMatId;

	private Integer agencyNo;
	private String agencyName;
	private String admId;
	private String admName;
	private String description;
	private String useYn;
	private Date regDate;
	private String agencyMatCnt;
	private String agencyUserCnt;

	private String matId;
	private String userId;

}