package com.ltop.app.menu5.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ltop.app.board.domain.BoardVO;
import com.ltop.app.board.domain.Criteria;
import com.ltop.app.common.domain.CommonComboVO;
import com.ltop.app.common.domain.PageDTO;
import com.ltop.app.common.domain.PageVO;
import com.ltop.app.common.service.CommonComboService;
import com.ltop.app.menu5.domain.M5Sub1VO;
import com.ltop.app.menu5.service.M5Sub1Service;

import lombok.Setter;
@Controller
@RequestMapping("/menu5")
public class M5Sub1Controller {

    @Setter(onMethod_ = @Autowired)
    private CommonComboService commonComboService;

    @Setter(onMethod_ = @Autowired)
    private M5Sub1Service m5Sub1Service;

    // 사용자 목록 화면
    @GetMapping("/sub1/userList")
    public String list(PageVO pageVO, M5Sub1VO m5Sub1VO, Model model) {
        int total = m5Sub1Service.selectUserTotalCount(m5Sub1VO);

        List<M5Sub1VO> userList = m5Sub1Service.selectUserList(pageVO, m5Sub1VO);
        List<CommonComboVO> comboAgnyList = commonComboService.selectAgencyCombo();

        model.addAttribute("userList", userList);
        model.addAttribute("comboAgnyList", comboAgnyList);
        model.addAttribute("searchUserName", m5Sub1VO.getSearchUserName());
        model.addAttribute("searchMatId", m5Sub1VO.getSearchMatId());
        model.addAttribute("searchEnabled", m5Sub1VO.getSearchEnabled());
        model.addAttribute("searchAgency", m5Sub1VO.getSearchAgency());
        model.addAttribute("pageMaker", new PageDTO(pageVO, total));

        return "/menu5/sub1/userList";
    }

    // 사용자 등록 화면
    @GetMapping("/sub1/userRegister")
    public String userRegister(Model model) {

        List<CommonComboVO> comboMatList = commonComboService.selectMatCombo();
        List<CommonComboVO> comboAgnyList = commonComboService.selectAgencyCombo();

        model.addAttribute("comboMatList", comboMatList);
        model.addAttribute("comboAgnyList", comboAgnyList);
        return "/menu5/sub1/userRegister";
    }

    // 사용자 등록
    @PostMapping("/sub1/register")
    //@ResponseBody
    public ResponseEntity<String> register(M5Sub1VO m5Sub1VO) {
        boolean result = m5Sub1Service.insertUser(m5Sub1VO);

        return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // 사용자 상세 보기
    @PostMapping("/sub1/userView")
    public String userView(@RequestParam("userId") String userId, M5Sub1VO m5Sub1VO, Model model) {

        List<CommonComboVO> comboMatList = commonComboService.selectMatCombo();
        List<CommonComboVO> comboAgnyList = commonComboService.selectAgencyCombo();

        model.addAttribute("user", m5Sub1Service.selectUserInfo(userId));

        model.addAttribute("searchUserName", m5Sub1VO.getSearchUserName());
        model.addAttribute("searchMatId", m5Sub1VO.getSearchMatId());
        model.addAttribute("searchEnabled", m5Sub1VO.getSearchEnabled());
        model.addAttribute("searchAgency", m5Sub1VO.getSearchAgency());

        model.addAttribute("comboMatList", comboMatList);
        model.addAttribute("comboAgnyList", comboAgnyList);

        return "/menu5/sub1/userView";
    }

    // 사용자 수정 화면
    @PostMapping("/sub1/userModify")
    public String userModify(@RequestParam("userId") String userId, M5Sub1VO m5Sub1VO, Model model) {

        List<CommonComboVO> comboMatList = commonComboService.selectMatCombo();
        List<CommonComboVO> comboAgnyList = commonComboService.selectAgencyCombo();

        model.addAttribute("user", m5Sub1Service.selectUserInfo(userId));
        model.addAttribute("searchUserName", m5Sub1VO.getSearchUserName());
        model.addAttribute("searchMatId", m5Sub1VO.getSearchMatId());
        model.addAttribute("searchEnabled", m5Sub1VO.getSearchEnabled());
        model.addAttribute("searchAgency", m5Sub1VO.getSearchAgency());

        model.addAttribute("comboMatList", comboMatList);
        model.addAttribute("comboAgnyList", comboAgnyList);

        return "/menu5/sub1/userModify";
    }

    // 사용자 수정
    @PostMapping("/sub1/modify")
    @ResponseBody
    public ResponseEntity<String> modify(M5Sub1VO m5Sub1VO, RedirectAttributes rttr) {
        boolean result = m5Sub1Service.updateUser(m5Sub1VO);

        rttr.addAttribute("searchUserName", m5Sub1VO.getSearchUserName());
        rttr.addAttribute("searchMatId", m5Sub1VO.getSearchMatId());
        rttr.addAttribute("searchEnabled", m5Sub1VO.getSearchEnabled());
        rttr.addAttribute("searchAgency", m5Sub1VO.getSearchAgency());

        return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // 사용자 삭제
    @PostMapping("/sub1/remove")
    public ResponseEntity<String> remove(M5Sub1VO m5Sub1VO) {
        boolean result = m5Sub1Service.deleteUser(m5Sub1VO);

        return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

}
