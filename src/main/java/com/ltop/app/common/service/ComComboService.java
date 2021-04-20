package com.ltop.app.common.service;

import java.util.List;

import com.ltop.app.common.domain.ComComboVO;

public interface ComComboService {

	public List<ComComboVO> selectSexGbCombo();

	public List<ComComboVO> selectSleepTimeCombo();

	public List<ComComboVO> selectPositionTimeCombo();

}
