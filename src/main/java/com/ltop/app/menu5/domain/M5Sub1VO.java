package com.ltop.app.menu5.domain;

import java.util.Date;

import lombok.Data;

@Data
public class M5Sub1VO {

    private String searchUserName;
    private String searchMatId;
    private String searchEnabled;
    private String searchAgency;
    private String searchGroup;

    private String userId;
    private String userName;
    private String userPw;
    private String sexCd;
    private String sexName;
    private String sleepTime;
    private String fallYn;
    private String fallYnName;
    private String positionYn;
    private String positionYnName;
    private String positionTime;
    private String tel;
    private String enabled;
    private String enabledName;
    private String matId;
    private String auth;
    private String birthday;
    private String height    ;
    private String weight    ;
    private String reguserId ;
    private String agencyNo  ;
    private String agencyName;
    private String admId     ;
    private Date regDate;
    private Date updateDate;

    //알람
    private Integer seq;
    private String useYn;

}
