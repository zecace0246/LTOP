package com.ltop.app.menu5.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub2VO;
import com.ltop.app.menu5.mapper.M5Sub2Mapper;
import com.ltop.app.menu5.service.M5Sub2Service;

import lombok.Setter;

@Service
public class M5Sub2ServiceImpl implements M5Sub2Service {

	@Setter(onMethod_ = { @Autowired })
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private M5Sub2Mapper m5Sub2Mapper;
	
	
	@Override
	public int selectMatTotalCount(M5Sub2VO m5Sub2VO) {
		return m5Sub2Mapper.selectMatTotalCount(m5Sub2VO);
	}	
	
	@Override
	public List<M5Sub2VO> selectMatList(PageVO pageVO, M5Sub2VO m5Sub2VO) {
		return m5Sub2Mapper.selectMatList(pageVO, m5Sub2VO);
	}

	@Override
	public M5Sub2VO selectMatInfo(M5Sub2VO m5Sub2VO) {
		return m5Sub2Mapper.selectMatInfo(m5Sub2VO);
	}
	
	@Transactional
	@Override
	public boolean insertMat(M5Sub2VO m5Sub2VO) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String userId = user.getUsername();
		
		m5Sub2VO.setRegId(userId);
		
		M5Sub2VO matInfo = m5Sub2Mapper.selectMatInfo(m5Sub2VO);
		
		if (matInfo != null) {
			return false;
		}
		
		int result = m5Sub2Mapper.insertMat(m5Sub2VO);
				
		return result > 0;
	}

	@Transactional
	@Override
	public boolean updateMat(M5Sub2VO m5Sub2VO) {
		return m5Sub2Mapper.updateMat(m5Sub2VO) == 1;
	}

	@Transactional
	@Override
	public boolean deleteMat(M5Sub2VO m5Sub2VO) {
		int result = m5Sub2Mapper.deleteMat(m5Sub2VO);
		
		return result > 0;
	}
	
}
