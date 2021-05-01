package com.ltop.app.menu5.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub4VO;
import com.ltop.app.menu5.mapper.M5Sub4Mapper;
import com.ltop.app.menu5.service.M5Sub4Service;

import lombok.Setter;

@Service
public class M5Sub4ServiceImpl implements M5Sub4Service {

	@Setter(onMethod_ = { @Autowired })
	private PasswordEncoder pwencoder;

	@Setter(onMethod_ = @Autowired)
	private M5Sub4Mapper m5Sub4Mapper;


	@Override
	public int selectAlarmPropertyTotalCount(M5Sub4VO m5Sub4VO) {
		return m5Sub4Mapper.selectAlarmPropertyTotalCount(m5Sub4VO);
	}

	@Override
	public List<M5Sub4VO> selectAlarmPropertyList(PageVO pageVO, M5Sub4VO m5Sub4VO) {
		return m5Sub4Mapper.selectAlarmPropertyList(pageVO, m5Sub4VO);
	}

	@Override
	public M5Sub4VO selectAlarmPropertyInfo(M5Sub4VO m5Sub4VO) {
		return m5Sub4Mapper.selectAlarmPropertyInfo(m5Sub4VO);
	}

	@Transactional
	@Override
	public boolean insertAlarmProperty(M5Sub4VO m5Sub4VO) {
		M5Sub4VO alarmPropertyInfo = m5Sub4Mapper.selectAlarmPropertyInfo(m5Sub4VO);

		if (alarmPropertyInfo != null) {
			return false;
		}

		int result = m5Sub4Mapper.insertAlarmProperty(m5Sub4VO);

		return result > 0;
	}

	@Transactional
	@Override
	public boolean updateAlarmProperty(M5Sub4VO m5Sub4VO) {
		return m5Sub4Mapper.updateAlarmProperty(m5Sub4VO) == 1;
	}

	@Transactional
	@Override
	public boolean deleteAlarmProperty(M5Sub4VO m5Sub4VO) {
		int result = m5Sub4Mapper.deleteAlarmProperty(m5Sub4VO);

		return result > 0;
	}

}
