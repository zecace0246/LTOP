package com.ltop.app.menu5.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class M5Sub5VO implements Serializable {

	private static final long serialVersionUID = 1L;

	private String searchAgencyName;
	private String searchGroupSeq;
	private String searchGroupName;
	private String searchAdmId;
	private String searchAdmName;

	private Integer groupSeq;
	private String groupName;
	private Integer agencyNo;
	private String agencyName;
	private String groupAdmId;
	private String groupAdmName;
	private String description;
	private String useYn;
	private Date regDate;
	private String agencyMatCnt;
	private String agencyUserCnt;

}