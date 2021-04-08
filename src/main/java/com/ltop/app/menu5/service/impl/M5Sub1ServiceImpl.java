package com.ltop.app.menu5.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ltop.app.menu5.domain.M5Sub1VO;
import com.ltop.app.menu5.mapper.M5Sub1Mapper;
import com.ltop.app.menu5.service.M5Sub1Service;

import lombok.Setter;

@Service
public class M5Sub1ServiceImpl implements M5Sub1Service {

	@Setter(onMethod_ = { @Autowired })
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private M5Sub1Mapper m5Sub1Mapper;
	
	
	@Override
	public List<M5Sub1VO> selectUserList(M5Sub1VO m5Sub1VO) {
		return m5Sub1Mapper.selectUserList(m5Sub1VO);
	}

	@Override
	public M5Sub1VO selectUserInfo(String userId) {
		return m5Sub1Mapper.selectUserInfo(userId);
	}
	
	@Transactional
	@Override
	public boolean insertUser(M5Sub1VO m5Sub1VO) {
		
		M5Sub1VO checkUser = m5Sub1Mapper.selectUserInfo(m5Sub1VO.getUserId());
		
		if (checkUser != null) {
			return false;
		}
		
		m5Sub1VO.setUserPw(pwencoder.encode("1234"));
		
		int result = m5Sub1Mapper.insertUser(m5Sub1VO);
		
		if (result > 0) {
			m5Sub1VO.setAuth("ROLE_USER");
			
			m5Sub1Mapper.insertUserAuth(m5Sub1VO);
		}
		
		return result > 0;
	}

	@Transactional
	@Override
	public boolean updateUser(M5Sub1VO m5Sub1VO) {
		return m5Sub1Mapper.updateUser(m5Sub1VO) == 1;
	}

	@Transactional
	@Override
	public boolean deleteUser(M5Sub1VO m5Sub1VO) {
		int result = m5Sub1Mapper.deleteUserAuth(m5Sub1VO);
		
		if (result > 0) {
			m5Sub1Mapper.deleteUser(m5Sub1VO);
		}
		
		return result > 0;
	}

}
