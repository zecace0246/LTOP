package com.ltop.app.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ltop.app.common.domain.CommonComboVO;
import com.ltop.app.common.mapper.CommonComboMapper;
import com.ltop.app.common.service.CommonComboService;

import lombok.Setter;

@Service
public class CommonComboServiceImpl implements CommonComboService {

	@Setter(onMethod_ = @Autowired)
	private CommonComboMapper commonComboMapper;


	@Override
	public List<CommonComboVO> selectAgencyAdminCombo() {
		return commonComboMapper.selectAgencyAdminCombo();
	}

	@Override
	public List<CommonComboVO> selectAgencyUserCombo() {
		return commonComboMapper.selectAgencyUserCombo();
	}

	@Override
	public List<CommonComboVO> selectMatCombo() {
		return commonComboMapper.selectMatCombo();
	}

	@Override
	public List<CommonComboVO> selectAgencyCombo() {
		return commonComboMapper.selectAgencyCombo();
	}

	@Override
	public List<CommonComboVO> selectAgencyGroupCombo() {
		return commonComboMapper.selectAgencyGroupCombo();
	}

}
