package com.ltop.app.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ltop.app.common.domain.CommonComboVO;
import com.ltop.app.common.domain.DashBoardVO;
import com.ltop.app.common.domain.DashBoardMVO;
import com.ltop.app.common.domain.AlarmVO;
import com.ltop.app.common.domain.ComComboVO;
import com.ltop.app.common.domain.UserVO;
import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub2VO;

@Mapper
public interface ComComboMapper {

	List<ComComboVO> selectSexGbCombo();

	List<ComComboVO> selectSleepTimeCombo();

	List<ComComboVO> selectPositionTimeCombo();

}
