package com.ltop.app.common.service;

import java.util.List;

import com.ltop.app.common.domain.CommonComboVO;
import com.ltop.app.common.domain.DashBoardVO;
import com.ltop.app.common.domain.DashBoardMVO;
import com.ltop.app.common.domain.DashBoardAVO;
import com.ltop.app.common.domain.AlarmVO;
import com.ltop.app.common.domain.UserVO;
import com.ltop.app.common.domain.BcgVO;
import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub1VO;
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

	public List<DashBoardAVO> selectAlarmCnt(DashBoardVO dashBoardVO);
	
	//alarm Of Main Menu
	public int selectAlarmTotalCount(AlarmVO alarmVO);

	public List<AlarmVO> selectAlarmList(PageVO pageVO, AlarmVO alarmVO);

	//user Of Main Menu
	public int selectUserTotalCount(UserVO userVO);

	public List<UserVO> selectUserList(PageVO pageVO, UserVO userVO);
	
    public UserVO selectUserTodayInfo(String userId);
    public List<BcgVO> selectUserTodayBcg(String userId);
    public List<AlarmVO> selectUserTodayAlarm(String userId);
    
	public boolean alarmUpdate(AlarmVO alarmVO);
	public boolean positionUpdate(UserVO userVO);
    
	//summary Of Main Menu
	public int selectSummaryTotalCount(UserVO userVO);

	public List<UserVO> selectSummaryList(PageVO pageVO, UserVO userVO);

	//mob Only
    public List<BcgVO> bcgList(UserVO userVO);
}
