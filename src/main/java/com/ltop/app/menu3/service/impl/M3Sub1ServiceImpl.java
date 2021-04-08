package com.ltop.app.menu3.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ltop.app.menu3.domain.M3Sub1VO;
import com.ltop.app.menu3.mapper.M3Sub1Mapper;
import com.ltop.app.menu3.service.M3Sub1Service;

import lombok.Setter;

@Service
public class M3Sub1ServiceImpl implements M3Sub1Service {
	
	@Setter(onMethod_ = @Autowired)
	private M3Sub1Mapper m3Sub1Mapper;

	
	@Override
	public List<M3Sub1VO> selectUserList(M3Sub1VO m3Sub1VO) {
		return m3Sub1Mapper.selectUserList(m3Sub1VO);
	}
	
}
