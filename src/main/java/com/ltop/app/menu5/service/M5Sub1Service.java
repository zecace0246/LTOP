package com.ltop.app.menu5.service;

import java.util.List;

import com.ltop.app.menu5.domain.M5Sub1VO;

public interface M5Sub1Service {

	public List<M5Sub1VO> selectUserList(M5Sub1VO m5Sub1VO);

	public M5Sub1VO selectUserInfo(String userId);
	
	public boolean insertUser(M5Sub1VO m5Sub1VO);
	
	public boolean updateUser(M5Sub1VO m5Sub1VO);
	
	public boolean deleteUser(M5Sub1VO m5Sub1VO);
	
}
