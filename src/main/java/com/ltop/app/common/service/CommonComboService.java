package com.ltop.app.common.service;

import java.util.List;

import com.ltop.app.common.domain.CommonComboVO;
import com.ltop.app.common.domain.DashBoardVO;
import com.ltop.app.common.domain.DashBoardMVO;
import com.ltop.app.common.domain.AlarmVO;
import com.ltop.app.common.domain.UserVO;
import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub2VO;

public interface CommonComboService {

    public List<CommonComboVO> selectAgencyAdminCombo(CommonComboVO comVo);

    public List<CommonComboVO> selectAgencyUserCombo();

    public List<CommonComboVO> selectMatCombo();

    public List<CommonComboVO> selectAgencyCombo();

    public List<CommonComboVO> selectAgencyGroupCombo(CommonComboVO comVo);

	public DashBoardVO dashBoardv1(DashBoardVO dashBoardVO);
	public DashBoardMVO dashBoardv2(DashBoardVO dashBoardVO);

	public List<AlarmVO> selectAlarmList(DashBoardVO dashBoardVO);

	//alarm Of Main Menu
	public int selectAlarmTotalCount(AlarmVO alarmVO);

	public List<AlarmVO> selectAlarmList(PageVO pageVO, AlarmVO alarmVO);

	//user Of Main Menu
	public int selectUserTotalCount(UserVO userVO);

	public List<UserVO> selectUserList(PageVO pageVO, UserVO userVO);

}
