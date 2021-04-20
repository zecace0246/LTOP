package com.ltop.app.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ltop.app.common.domain.ComComboVO;
import com.ltop.app.common.mapper.ComComboMapper;
import com.ltop.app.common.service.ComComboService;

import lombok.Setter;

@Service
public class ComComboServiceImpl implements ComComboService {

    @Setter(onMethod_ = @Autowired)
    private ComComboMapper comComboMapper;

	@Override
	public List<ComComboVO> selectSexGbCombo() {
		return comComboMapper.selectSexGbCombo();
	}

	@Override
	public List<ComComboVO> selectSleepTimeCombo() {
		return comComboMapper.selectSleepTimeCombo();
	}

	@Override
	public List<ComComboVO> selectPositionTimeCombo() {
		return comComboMapper.selectPositionTimeCombo();
	}



}
