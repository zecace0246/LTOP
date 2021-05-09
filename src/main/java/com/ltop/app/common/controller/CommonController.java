package com.ltop.app.common.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.google.gson.Gson;
import com.ltop.app.common.domain.CommonComboVO;
import com.ltop.app.common.domain.PageDTO;
import com.ltop.app.common.domain.PageVO;
import com.ltop.app.common.domain.DashBoardVO;
import com.ltop.app.common.domain.AlarmVO;
import com.ltop.app.common.domain.DashBoardAVO;
import com.ltop.app.common.domain.UserVO;
import com.ltop.app.common.service.CommonComboService;
import com.ltop.app.menu5.domain.M5Sub1VO;
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

		List<AlarmVO> 		alarmList	= commonComboService.selectAlarmList(dashBoardVO);
		List<DashBoardAVO> 	alarmCnt 	= commonComboService.selectAlarmCnt(dashBoardVO);
		
		model.addAttribute("alarmList", alarmList);
		model.addAttribute("alarmCnt", alarmCnt);

		return "dashboardv1";
	}

	@GetMapping("/mob/dashboardv1")
    @ResponseBody
	public String mobdashBoardv1(DashBoardVO dashBoardVO, Model model) {
		Gson gson = new Gson();
		
		model.addAttribute("dashboard", commonComboService.dashBoardv1(dashBoardVO));
		model.addAttribute("dashboardm", commonComboService.dashBoardv2(dashBoardVO));

		List<AlarmVO> alarmList = commonComboService.selectAlarmList(dashBoardVO);

		model.addAttribute("alarmList", alarmList);
		
    	String gsonString  = gson.toJson(model);

        System.out.println(" Moble Json rst ::> "+ gsonString);

        return gsonString;
		//return "dashboardv1";
	}
	
	@GetMapping("/alarm")
	public String alarmList(PageVO pageVO, AlarmVO alarmVO, Model model) {
		int total = commonComboService.selectAlarmTotalCount(alarmVO);

		List<AlarmVO> alarmList = commonComboService.selectAlarmList(pageVO, alarmVO);
		
		List<CommonComboVO> comboAgnyList = commonComboService.selectAgencyCombo();
        model.addAttribute("comboAgnyList", comboAgnyList);
        
		model.addAttribute("alarmList", alarmList);
		model.addAttribute("searchDateFrom", alarmVO.getSearchDateFrom());
		model.addAttribute("searchDateTo", alarmVO.getSearchDateTo());
		model.addAttribute("searchType", alarmVO.getSearchType());
		model.addAttribute("agencyNo", 			alarmVO.getAgencyNo());
		model.addAttribute("groupSeq", 			alarmVO.getGroupSeq());
		model.addAttribute("searchUserName", 	alarmVO.getSearchUserName());
		model.addAttribute("pageMaker", new PageDTO(pageVO, total));

		return "alarmList";
	}

	@GetMapping("/mob/alarm")
    @ResponseBody
	public String mobalarmList(PageVO pageVO, AlarmVO alarmVO, Model model) {
		Gson gson = new Gson();
		
		int total = commonComboService.selectAlarmTotalCount(alarmVO);

		List<AlarmVO> alarmList = commonComboService.selectAlarmList(pageVO, alarmVO);

		model.addAttribute("alarmList", alarmList);
		model.addAttribute("searchDateFrom", alarmVO.getSearchDateFrom());
		model.addAttribute("searchDateTo", alarmVO.getSearchDateTo());
		model.addAttribute("searchType", alarmVO.getSearchType());
		model.addAttribute("agencyNo", 			alarmVO.getAgencyNo());
		model.addAttribute("groupSeq", 			alarmVO.getGroupSeq());
		model.addAttribute("searchUserName", 	alarmVO.getSearchUserName());
		model.addAttribute("pageMaker", new PageDTO(pageVO, total));

    	String gsonString  = gson.toJson(model);

        System.out.println(" Moble Json rst ::> "+ gsonString);

        return gsonString;
        
		//return "alarmList";
	}
	
	@GetMapping("/user")
	public String userList(PageVO pageVO, UserVO userVO, Model model) {
		int total = commonComboService.selectUserTotalCount(userVO);

		List<UserVO> userList = commonComboService.selectUserList(pageVO, userVO);
		
		List<CommonComboVO> comboAgnyList = commonComboService.selectAgencyCombo();
        model.addAttribute("comboAgnyList", comboAgnyList);
        
		model.addAttribute("userList", userList);
		model.addAttribute("searchDateFrom", 	userVO.getSearchDateFrom());
		model.addAttribute("agencyNo", 			userVO.getAgencyNo());
		model.addAttribute("groupSeq", 			userVO.getGroupSeq());
		model.addAttribute("searchUserName", 	userVO.getSearchUserName());
		model.addAttribute("pageMaker", new PageDTO(pageVO, total));

		return "userList";
	}

	@GetMapping("/mob/user")
    @ResponseBody
	public String mobuserList(PageVO pageVO, UserVO userVO, Model model) {
		Gson gson = new Gson();
		
		int total = commonComboService.selectUserTotalCount(userVO);

		List<UserVO> userList = commonComboService.selectUserList(pageVO, userVO);

		model.addAttribute("userList", userList);
		model.addAttribute("pageMaker", new PageDTO(pageVO, total));

    	String gsonString  = gson.toJson(model);

        System.out.println(" Moble Json rst ::> "+ gsonString);

        return gsonString;
		//return "userList";
	}
	
    // 사용자 상세 보기
    @PostMapping("/user/userDetail")
    public String userView(@RequestParam("userId") String userId, UserVO userVO, Model model) {
/*
        List<CommonComboVO> comboMatList = commonComboService.selectMatCombo();
        List<CommonComboVO> comboAgnyList = commonComboService.selectAgencyCombo();

        model.addAttribute("user", m5Sub1Service.selectUserInfo(userId));

        model.addAttribute("searchUserName", m5Sub1VO.getSearchUserName());
        model.addAttribute("searchMatId", m5Sub1VO.getSearchMatId());
        model.addAttribute("searchEnabled", m5Sub1VO.getSearchEnabled());
        model.addAttribute("searchAgency", m5Sub1VO.getSearchAgency());

        model.addAttribute("comboMatList", comboMatList);
        model.addAttribute("comboAgnyList", comboAgnyList);
*/
        model.addAttribute("user", commonComboService.selectUserTodayInfo(userId));
        model.addAttribute("userBcg", commonComboService.selectUserTodayBcg(userId));
        model.addAttribute("userAlarm", commonComboService.selectUserTodayAlarm(userId));
        model.addAttribute("userId", userId);     
        return "userDetail";
    }

    // 사용자 상세 보기
    @GetMapping("/mob/user/userDetail")
    @ResponseBody
    public String mobuserView(@RequestParam("userId") String userId, UserVO userVO, Model model) {
    	//System.out.println(" User id :::>  "+ params.get("userId").toString());
		Gson gson = new Gson();
/*
        List<CommonComboVO> comboMatList = commonComboService.selectMatCombo();
        List<CommonComboVO> comboAgnyList = commonComboService.selectAgencyCombo();

        model.addAttribute("user", m5Sub1Service.selectUserInfo(userId));

        model.addAttribute("searchUserName", m5Sub1VO.getSearchUserName());
        model.addAttribute("searchMatId", m5Sub1VO.getSearchMatId());
        model.addAttribute("searchEnabled", m5Sub1VO.getSearchEnabled());
        model.addAttribute("searchAgency", m5Sub1VO.getSearchAgency());

        model.addAttribute("comboMatList", comboMatList);
        model.addAttribute("comboAgnyList", comboAgnyList);
*/
        model.addAttribute("user", commonComboService.selectUserTodayInfo(userId));
        model.addAttribute("userBcg", commonComboService.selectUserTodayBcg(userId));
        model.addAttribute("userAlarm", commonComboService.selectUserTodayAlarm(userId));
        model.addAttribute("userId", userId); 
        
    	String gsonString  = gson.toJson(model);

        System.out.println(" Moble Json rst ::> "+ gsonString);

        return gsonString;

        //return "userDetail";
    }
    
    // 알람확인
    @PostMapping("/user/alarmUpdate")
    @ResponseBody
    public ResponseEntity<String> alarmUpdate(AlarmVO alarmVO, RedirectAttributes rttr) {
        boolean result = commonComboService.alarmUpdate(alarmVO);
/*
 		boolean result = commonComboService.updateUser(alarmVO);
        rttr.addAttribute("searchUserName", m5Sub1VO.getSearchUserName());
        rttr.addAttribute("searchMatId", m5Sub1VO.getSearchMatId());
        rttr.addAttribute("searchEnabled", m5Sub1VO.getSearchEnabled());
        rttr.addAttribute("searchAgency", m5Sub1VO.getSearchAgency());
*/
        return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // 알람확인
    @GetMapping("/mob/user/alarmUpdate")
    @ResponseBody
    public String mobalarmUpdate(AlarmVO alarmVO, RedirectAttributes rttr) {
    	Gson gson = new Gson();
    	String rstStr = "false";
    	
        boolean result = commonComboService.alarmUpdate(alarmVO);
/*
 		boolean result = commonComboService.updateUser(alarmVO);
        rttr.addAttribute("searchUserName", m5Sub1VO.getSearchUserName());
        rttr.addAttribute("searchMatId", m5Sub1VO.getSearchMatId());
        rttr.addAttribute("searchEnabled", m5Sub1VO.getSearchEnabled());
        rttr.addAttribute("searchAgency", m5Sub1VO.getSearchAgency());
*/
    	if(result) {
    		rstStr = "true";
    	}
    	rttr.addAttribute("result", rstStr);

    	String gsonString  = gson.toJson(rttr);

        System.out.println(" Moble Json rst ::> "+ gsonString);

        return gsonString;
        
        //return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    // 자세변경
    @PostMapping("/user/positionUpdate")
    @ResponseBody
    public ResponseEntity<String> positionUpdate(UserVO userVO, RedirectAttributes rttr) {
        boolean result = commonComboService.positionUpdate(userVO);
/*
 		boolean result = commonComboService.updateUser(alarmVO);
        rttr.addAttribute("searchUserName", m5Sub1VO.getSearchUserName());
        rttr.addAttribute("searchMatId", m5Sub1VO.getSearchMatId());
        rttr.addAttribute("searchEnabled", m5Sub1VO.getSearchEnabled());
        rttr.addAttribute("searchAgency", m5Sub1VO.getSearchAgency());
*/
        return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    // 자세변경
    @GetMapping("/mob/user/positionUpdate")
    @ResponseBody
    public String mobpositionUpdate(UserVO userVO, RedirectAttributes rttr) {
    	Gson gson = new Gson();
    	String rstStr = "false";
    	
        boolean result = commonComboService.positionUpdate(userVO);
/*
 		boolean result = commonComboService.updateUser(alarmVO);
        rttr.addAttribute("searchUserName", m5Sub1VO.getSearchUserName());
        rttr.addAttribute("searchMatId", m5Sub1VO.getSearchMatId());
        rttr.addAttribute("searchEnabled", m5Sub1VO.getSearchEnabled());
        rttr.addAttribute("searchAgency", m5Sub1VO.getSearchAgency());
*/
    	if(result) {
    		rstStr = "true";
    	}
    	rttr.addAttribute("result", rstStr);

    	String gsonString  = gson.toJson(rttr);

        System.out.println(" Moble Json rst ::> "+ gsonString);

        return gsonString;
        
        //return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
	@GetMapping("/summary")
	public String summaryList(PageVO pageVO, UserVO userVO, Model model) {
		int total = commonComboService.selectSummaryTotalCount(userVO);

		
		List<UserVO> summaryList = commonComboService.selectSummaryList(pageVO, userVO);
        
		List<CommonComboVO> comboAgnyList = commonComboService.selectAgencyCombo();
        model.addAttribute("comboAgnyList", comboAgnyList);

		model.addAttribute("summaryList", summaryList);
		model.addAttribute("searchDateFrom", 	userVO.getSearchDateFrom());
		model.addAttribute("agencyNo", 			userVO.getAgencyNo());
		model.addAttribute("groupSeq", 			userVO.getGroupSeq());
		model.addAttribute("searchUserName", 	userVO.getSearchUserName());
		model.addAttribute("pageMaker", new PageDTO(pageVO, total));

		return "summaryList";
	}

	@GetMapping("/mob/summary")
    @ResponseBody
	public String mobsummaryList(PageVO pageVO, UserVO userVO, Model model) {
		Gson gson = new Gson();
		int total = commonComboService.selectSummaryTotalCount(userVO);

		List<UserVO> summaryList = commonComboService.selectSummaryList(pageVO, userVO);

		model.addAttribute("summaryList", summaryList);
		//model.addAttribute("searchDateFrom", userVO.getSearchDateFrom());
		//model.addAttribute("searchDateTo", userVO.getSearchDateTo());
		//model.addAttribute("searchType", userVO.getSearchType());
		model.addAttribute("pageMaker", new PageDTO(pageVO, total));
		
    	String gsonString  = gson.toJson(model);

        System.out.println(" Moble Json rst ::> "+ gsonString);

        return gsonString;
		//return "summaryList";
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
