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
import com.ltop.app.common.service.CommonComboService;

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
    public String dashboardv1() {
        return "dashboardv1";
    }

    @GetMapping("/dashboardv2")
    public String dashboardv2() {
        return "dashboardv2";
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

}
