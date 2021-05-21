package com.ltop.app.member.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.Getter;

@Data
public class MemberVO {

    private String userId;
    private String userPw;
    private String userTempPw;
    private String userName;
    private boolean enabled;
    private String enabledStr;
    private Date regDate;
    private Date updateDate;

    private String sexCd;
    private String tel;
    private String birthday;
    private String height    ;
    private String weight    ;
    private String loginTime    ;
    private String auth;
    private String result;

    private String matId          ;
    private String reguserId      ;
    private String agencyNo       ;
    private String sleepTime      ;
    private String positionTime   ;
    private String sex            ;
    private String positionUpdate ;
    private String fallYn         ;
    private String positionYn     ;

    private List<AuthVO> authList;

}
