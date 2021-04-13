package com.ltop.app.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ltop.app.common.domain.CommonComboVO;

@Mapper
public interface CommonComboMapper {

	public List<CommonComboVO> selectAgencyAdminCombo();

	public List<CommonComboVO> selectAgencyUserCombo();

	public List<CommonComboVO> selectMatCombo();

	public List<CommonComboVO> selectAgencyCombo();

}
