package com.ltop.app.common.service;

import java.util.List;

import com.ltop.app.common.domain.CommonComboVO;

public interface CommonComboService {

	public List<CommonComboVO> selectAgencyAdminCombo();

	public List<CommonComboVO> selectAgencyUserCombo();

	public List<CommonComboVO> selectMatCombo();

	public List<CommonComboVO> selectAgencyCombo();

	public List<CommonComboVO> selectAgencyGroupCombo(CommonComboVO comVo);

}
