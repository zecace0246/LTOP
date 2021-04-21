package com.ltop.app.common.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ltop.app.common.domain.CommonComboVO;
import com.ltop.app.common.domain.PageDTO;
import com.ltop.app.common.domain.PageVO;
import com.ltop.app.common.domain.DashBoardVO;
import com.ltop.app.common.domain.AlarmVO;
import com.ltop.app.common.domain.UserVO;
import com.ltop.app.common.service.CommonComboService;
import com.ltop.app.menu5.domain.M5Sub2VO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommonController {

    @Setter(onMethod_ = @Autowired)
    private CommonComboService commonComboService;

    @GetMapping(value = {"/","/home"})
    public String home(Locale locale, Model model) {
        return "home";
    }

    @GetMapping("/error/accessDeny")
    public void accessDenied(Authentication auth, Model model) {
        model.addAttribute("msg", "Access Denied");
    }

	@GetMapping("/dashboardv1")
	public String dashBoardv1(DashBoardVO dashBoardVO, Model model) {

		model.addAttribute("dashboard", commonComboService.dashBoardv1(dashBoardVO));
		model.addAttribute("dashboardm", commonComboService.dashBoardv2(dashBoardVO));

		List<AlarmVO> alarmList = commonComboService.selectAlarmList(dashBoardVO);

		model.addAttribute("alarmList", alarmList);

		return "dashboardv1";
	}

	@GetMapping("/alarm")
	public String alarmList(PageVO pageVO, AlarmVO alarmVO, Model model) {
		int total = commonComboService.selectAlarmTotalCount(alarmVO);

		List<AlarmVO> alarmList = commonComboService.selectAlarmList(pageVO, alarmVO);

		model.addAttribute("alarmList", alarmList);
		model.addAttribute("searchDateFrom", alarmVO.getSearchDateFrom());
		model.addAttribute("searchDateTo", alarmVO.getSearchDateTo());
		model.addAttribute("searchType", alarmVO.getSearchType());
		model.addAttribute("pageMaker", new PageDTO(pageVO, total));

		return "alarmList";
	}

	@GetMapping("/user")
	public String userList(PageVO pageVO, UserVO userVO, Model model) {
		int total = commonComboService.selectUserTotalCount(userVO);

		List<UserVO> userList = commonComboService.selectUserList(pageVO, userVO);

		model.addAttribute("userList", userList);
		//model.addAttribute("searchDateFrom", userVO.getSearchDateFrom());
		//model.addAttribute("searchDateTo", userVO.getSearchDateTo());
		//model.addAttribute("searchType", userVO.getSearchType());
		model.addAttribute("pageMaker", new PageDTO(pageVO, total));

		return "userList";
	}

    @GetMapping("/dashboardv3")
    public String dashboardv3() {
        return "dashboardv3";
    }

    @GetMapping("/dashboardv4")
    public String dashboardv4() {
        return "dashboardv4";
    }

    @GetMapping("/selectAgencyGroupCombo")
    @ResponseBody
    public Object selectAgencyGroupCombo(CommonComboVO comVo, Model model) {

        List<CommonComboVO> comboAgCyGrpList = commonComboService.selectAgencyGroupCombo(comVo);

        return comboAgCyGrpList ;
    }

    @GetMapping("/selectAgencyAdminCombo")
    @ResponseBody
    public Object selectAgencyAdminCombo(CommonComboVO comVo, Model model) {

        List<CommonComboVO> comboAgCyAdmList = commonComboService.selectAgencyAdminCombo(comVo);

        return comboAgCyAdmList ;
    }

}
