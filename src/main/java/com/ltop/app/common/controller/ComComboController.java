package com.ltop.app.common.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ltop.app.common.domain.AlarmVO;
import com.ltop.app.common.domain.CommonComboVO;
import com.ltop.app.common.domain.DashBoardVO;
import com.ltop.app.common.domain.PageDTO;
import com.ltop.app.common.domain.PageVO;
import com.ltop.app.common.domain.UserVO;
import com.ltop.app.common.service.ComComboService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ComComboController {

    @Setter(onMethod_ = @Autowired)
    private ComComboService comComboService;

    /*
    @GetMapping("/selectAgencyGroupCombo")
    @ResponseBody
    public Object selectAgencyGroupCombo(CommonComboVO comVo, Model model) {

        List<CommonComboVO> comboAgCyGrpList = commonComboService.selectAgencyGroupCombo(comVo);

        return comboAgCyGrpList ;
    }*/

}
