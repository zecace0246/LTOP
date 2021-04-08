package com.ltop.app.menu5.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ltop.app.menu5.domain.M5Sub1VO;

@Mapper
public interface M5Sub1Mapper {

	public List<M5Sub1VO> selectUserList(M5Sub1VO m5Sub1VO);

	public M5Sub1VO selectUserInfo(String userId);
	
	public int insertUser(M5Sub1VO m5Sub1VO);
	
	public int updateUser(M5Sub1VO m5Sub1VO);
	
	public int deleteUser(M5Sub1VO m5Sub1VO);
	
	public void insertUserAuth(M5Sub1VO m5Sub1VO);
	
	public int deleteUserAuth(M5Sub1VO m5Sub1VO);
	
}
