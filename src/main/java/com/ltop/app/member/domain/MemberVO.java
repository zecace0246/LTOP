package com.ltop.app.member.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.Getter;

@Data
public class MemberVO {

	private String userId;
	private String userPw;
	private String userName;
	private boolean enabled;
	private Date regDate;
	private Date updateDate;
	
	private String auth;
	
	private List<AuthVO> authList;

}
