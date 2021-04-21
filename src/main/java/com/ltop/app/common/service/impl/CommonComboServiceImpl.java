package com.ltop.app.common.service.impl;

import java.util.List;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;

import com.ltop.app.common.domain.CommonComboVO;
import com.ltop.app.common.mapper.CommonComboMapper;
import com.ltop.app.common.service.CommonComboService;
import com.ltop.app.menu5.domain.M5Sub2VO;
import com.ltop.app.common.domain.DashBoardVO;
import com.ltop.app.common.domain.DashBoardMVO;
import com.ltop.app.common.domain.AlarmVO;
import com.ltop.app.common.domain.UserVO;
import com.ltop.app.common.domain.PageVO;

import lombok.Setter;

@Service
public class CommonComboServiceImpl implements CommonComboService {

    @Setter(onMethod_ = @Autowired)
    private CommonComboMapper commonComboMapper;


    @Override
    public List<CommonComboVO> selectAgencyAdminCombo(CommonComboVO comVo) {

        return commonComboMapper.selectAgencyAdminCombo(comVo);
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
    public List<CommonComboVO> selectAgencyGroupCombo(CommonComboVO comVo) {
        return commonComboMapper.selectAgencyGroupCombo(comVo);
    }

	@Override
	public DashBoardVO dashBoardv1(DashBoardVO dashBoardVO) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String userId = user.getUsername();

		dashBoardVO.setUserId(userId);

		DashBoardVO dashBoard = new DashBoardVO();

		//dashBoard = commonComboMapper.dashBoardv1P(dashBoardVO);

		List<String> roleNames = new ArrayList<>();

		user.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});

		if (roleNames.contains("ROLE_ADMIN") ) {
			dashBoard = commonComboMapper.dashBoardv1A(dashBoardVO);
		}
		if (roleNames.contains("ROLE_USER") ) {
			dashBoard = commonComboMapper.dashBoardv1U(dashBoardVO);
		}
		if (roleNames.contains("ROLE_MEMBER") ) {
			dashBoard = commonComboMapper.dashBoardv1P(dashBoardVO);
		}
		return dashBoard;
	}
	@Override
	public DashBoardMVO dashBoardv2(DashBoardVO dashBoardVO) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String userId = user.getUsername();

		dashBoardVO.setUserId(userId);

		DashBoardMVO dashBoard = new DashBoardMVO();

		//dashBoard = commonComboMapper.dashBoardv1P(dashBoardVO);

		List<String> roleNames = new ArrayList<>();

		user.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});

		if (roleNames.contains("ROLE_ADMIN") ) {
			dashBoard = commonComboMapper.dashBoardv2A(dashBoardVO);
		}
		if (roleNames.contains("ROLE_USER") ) {
			dashBoard = commonComboMapper.dashBoardv2U(dashBoardVO);
		}
		if (roleNames.contains("ROLE_MEMBER") ) {
			dashBoard = commonComboMapper.dashBoardv2P(dashBoardVO);
		}
		return dashBoard;
	}

	@Override
	public List<AlarmVO> selectAlarmList(DashBoardVO dashBoardVO) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String userId = user.getUsername();
		dashBoardVO.setUserId(userId);

		List<String> roleNames = new ArrayList<>();

		user.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		List<AlarmVO> alarmVO = null;

		if (roleNames.contains("ROLE_ADMIN") ) {
			alarmVO = commonComboMapper.selectAlarmListA(dashBoardVO);
		}
		if (roleNames.contains("ROLE_USER") ) {
			alarmVO = commonComboMapper.selectAlarmListU(dashBoardVO);
		}
		if (roleNames.contains("ROLE_MEMBER") ) {
			alarmVO = commonComboMapper.selectAlarmListP(dashBoardVO);
		}

		return alarmVO;
	}

	@Override
	public int selectAlarmTotalCount(AlarmVO alarmVO) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String userId = user.getUsername();
		alarmVO.setUserId(userId);

		List<String> roleNames = new ArrayList<>();

		user.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		int rVal = 0;

		if (roleNames.contains("ROLE_ADMIN") ) {
			rVal = commonComboMapper.selectAlarmTotalCountA(alarmVO);
		}
		if (roleNames.contains("ROLE_USER") ) {
			rVal = commonComboMapper.selectAlarmTotalCountU(alarmVO);
		}
		if (roleNames.contains("ROLE_MEMBER") ) {
			rVal = commonComboMapper.selectAlarmTotalCountP(alarmVO);
		}
		return rVal;
		//return commonComboMapper.selectAlarmTotalCount(alarmVO);
	}

	@Override
	public List<AlarmVO> selectAlarmList(PageVO pageVO, AlarmVO alarmVO) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String userId = user.getUsername();
		alarmVO.setUserId(userId);

		List<String> roleNames = new ArrayList<>();

		user.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		List<AlarmVO> alarmVOR = null;

		System.out.println("CCCCCCCCCCCCC");
		System.out.println("impll>>"+alarmVO.getSearchDateFrom());
		System.out.println("DDDDDDDDDDDDDD");


		if (roleNames.contains("ROLE_ADMIN") ) {
			System.out.println("EEEEEEEEEEEEEEEEEEEEEE");
			alarmVOR = commonComboMapper.selectMenuAlarmListA(pageVO, alarmVO);
			System.out.println("FFFFFFFFFFFFFFFF");
		}
		if (roleNames.contains("ROLE_USER") ) {
			alarmVOR = commonComboMapper.selectMenuAlarmListU(pageVO, alarmVO);
		}
		if (roleNames.contains("ROLE_MEMBER") ) {
			alarmVOR = commonComboMapper.selectMenuAlarmListP(pageVO, alarmVO);
		}

		return alarmVOR;

		//return m5Sub2Mapper.selectMatList(pageVO, m5Sub2VO);
	}

	@Override
	public int selectUserTotalCount(UserVO userVO) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String userId = user.getUsername();
		userVO.setUserId(userId);

		List<String> roleNames = new ArrayList<>();

		user.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		int rVal = 0;

		if (roleNames.contains("ROLE_ADMIN") ) {
			rVal = commonComboMapper.selectUserTotalCountA(userVO);
		}
		if (roleNames.contains("ROLE_USER") ) {
			rVal = commonComboMapper.selectUserTotalCountU(userVO);
		}
		if (roleNames.contains("ROLE_MEMBER") ) {
			rVal = commonComboMapper.selectUserTotalCountP(userVO);
		}
		return rVal;
		//return commonComboMapper.selectAlarmTotalCount(alarmVO);
	}

	@Override
	public List<UserVO> selectUserList(PageVO pageVO, UserVO userVO) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String userId = user.getUsername();
		userVO.setUserId(userId);

		List<String> roleNames = new ArrayList<>();

		user.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		List<UserVO> userVOR = null;


		if (roleNames.contains("ROLE_ADMIN") ) {
			userVOR = commonComboMapper.selectMenuUserListA(pageVO, userVO);
		}
		if (roleNames.contains("ROLE_USER") ) {
			userVOR = commonComboMapper.selectMenuUserListU(pageVO, userVO);
		}
		if (roleNames.contains("ROLE_MEMBER") ) {
			userVOR = commonComboMapper.selectMenuUserListP(pageVO, userVO);
		}

		return userVOR;

		//return m5Sub2Mapper.selectMatList(pageVO, m5Sub2VO);
	}

}
