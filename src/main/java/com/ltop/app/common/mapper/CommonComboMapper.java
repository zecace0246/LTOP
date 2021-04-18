package com.ltop.app.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ltop.app.common.domain.CommonComboVO;
import com.ltop.app.common.domain.DashBoardVO;
import com.ltop.app.common.domain.DashBoardMVO;
import com.ltop.app.common.domain.AlarmVO;
import com.ltop.app.common.domain.UserVO;
import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub2VO;

@Mapper
public interface CommonComboMapper {

    public List<CommonComboVO> selectAgencyAdminCombo();

    public List<CommonComboVO> selectAgencyUserCombo();

    public List<CommonComboVO> selectMatCombo();

    public List<CommonComboVO> selectAgencyCombo();

    public List<CommonComboVO> selectAgencyGroupCombo(CommonComboVO comVo);

	public DashBoardVO dashBoardv1A(DashBoardVO dashBoardVO);

	public DashBoardVO dashBoardv1U(DashBoardVO dashBoardVO);
	
	public DashBoardVO dashBoardv1P(DashBoardVO dashBoardVO);

	public DashBoardMVO dashBoardv2A(DashBoardVO dashBoardVO);

	public DashBoardMVO dashBoardv2U(DashBoardVO dashBoardVO);
	
	public DashBoardMVO dashBoardv2P(DashBoardVO dashBoardVO);
	
	public List<AlarmVO> selectAlarmListA(DashBoardVO dashBoardVO);
	
	public List<AlarmVO> selectAlarmListU(DashBoardVO dashBoardVO);
	
	public List<AlarmVO> selectAlarmListP(DashBoardVO dashBoardVO);
	
	//alarm Of Menu
	public int selectAlarmTotalCountA(AlarmVO alarmVO);
	public int selectAlarmTotalCountU(AlarmVO alarmVO);
	public int selectAlarmTotalCountP(AlarmVO alarmVO);
	
	public List<AlarmVO> selectMenuAlarmListA(@Param("pageVO") PageVO pageVO, @Param("alarmVO") AlarmVO alarmVO);
	public List<AlarmVO> selectMenuAlarmListU(@Param("pageVO") PageVO pageVO, @Param("alarmVO") AlarmVO alarmVO);
	public List<AlarmVO> selectMenuAlarmListP(@Param("pageVO") PageVO pageVO, @Param("alarmVO") AlarmVO alarmVO);
	
	//user Of Menu
	public int selectUserTotalCountA(UserVO userVO);
	public int selectUserTotalCountU(UserVO userVO);
	public int selectUserTotalCountP(UserVO userVO);
	
	public List<UserVO> selectMenuUserListA(@Param("pageVO") PageVO pageVO, @Param("userVO") UserVO userVO);
	public List<UserVO> selectMenuUserListU(@Param("pageVO") PageVO pageVO, @Param("userVO") UserVO userVO);
	public List<UserVO> selectMenuUserListP(@Param("pageVO") PageVO pageVO, @Param("userVO") UserVO userVO);
}
