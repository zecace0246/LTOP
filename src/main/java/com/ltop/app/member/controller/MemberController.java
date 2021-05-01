package com.ltop.app.member.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.ltop.app.board.domain.BoardVO;
import com.ltop.app.board.domain.Criteria;
import com.ltop.app.member.domain.MemberVO;
import com.ltop.app.member.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member")
public class MemberController {

    @Setter(onMethod_ = @Autowired)
    private MemberService memberService;

    @GetMapping("/adminLogin")
    public void adminLogin(String error, String logout, MemberVO memberVO, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();

        MemberVO member = memberService.selectMemberInfo(memberVO);

        if (error != null) {
            model.addAttribute("loginError", "Login Error Check Your Account");
        }

        if(member != null){
            session.setAttribute("member", member);

            System.out.println( " member ::: "+ member );
            System.out.println( " member getUserId ::: "+ member.getUserId() );
            System.out.println( " member getUserName ::: "+ member.getUserName() );
            System.out.println( " member getUserPw ::: "+ member.getUserPw() );
        }

        //return "redirect:/";
    }

    @GetMapping("/adminRegister")
    public void adminRegister(Locale locale, Model model) {
    }

    @PostMapping("/adminLogout")
    public String adminLogout(HttpSession session) {
        session.invalidate();

        return "redirect:/";
    }

    @PostMapping("/memberRegister")
    public String regist(MemberVO memberVO, RedirectAttributes rttr) {
        log.info("MemberVO : " + memberVO);

        int result = memberService.insertMember(memberVO);

        if (result == 0) {
            rttr.addFlashAttribute("registerResult", "Member Register Fail");
        } else if (result == 1) {
            rttr.addFlashAttribute("registerResult", "Member Register Success");
        } else if (result == 99) {
            rttr.addFlashAttribute("registerResult", "Member Register Fail (Userid Check)");
        }

        return "redirect:/member/adminLogin";
    }

    @GetMapping("/memberList")
    public String list(MemberVO memberVO, Model model) {

        List<MemberVO> result = memberService.selectMemberList(memberVO);

        model.addAttribute("list", result);

        return "/member/memberList";
    }

    /**
     * Moble Json ID 중복확인
     * @param cri
     * @param model
     */
    @GetMapping("/mob/idDupChk")
    @ResponseBody
    public String idDupChk(@RequestParam Map<String, Object> params, HttpServletRequest request){
    	System.out.println(" User id :::>  "+ params.get("userId").toString());

    	Gson gson = new Gson();
    	String rstStr = "false";

    	// membervo에 param 으로 받은 id 셋팅
    	MemberVO memberVO = new MemberVO();
    	memberVO.setUserId(params.get("userId").toString());

    	int rst = 0;
    	rst = memberService.selectIdDupChk(memberVO);

    	if(rst >0) {
    		rstStr = "true";
    	}
    	memberVO.setResult(rstStr);

    	String gsonString  = gson.toJson(memberVO);

        System.out.println(" Moble Json rst ::> "+ gsonString);

        return gsonString;
    }

    /**
     * Moble Json 회원가입
     * @param
     * @param model
     */
    @GetMapping("/mob/memberRegister")
    @ResponseBody
    public String memberRegister(@RequestParam Map<String, Object> params, HttpServletRequest request){

    	Gson gson = new Gson();
    	String rstStr = "failed";

    	// membervo에 param 으로 받은 id 셋팅
    	MemberVO memberVO = new MemberVO();
    	memberVO.setUserId(params.get("userId").toString());
    	memberVO.setUserPw(params.get("userPw").toString());
    	memberVO.setUserName(params.get("userName").toString());
    	memberVO.setBirthday(params.get("birthday").toString());
    	memberVO.setHeight(params.get("height").toString());
    	memberVO.setWeight(params.get("weight").toString());
    	memberVO.setTel(params.get("tel").toString());
    	memberVO.setSexCd(params.get("sexCd").toString());

    	if(memberVO.getUserId().equals("") || memberVO.getUserPw().equals("")
    		|| memberVO.getUserName().equals("") || memberVO.getBirthday().equals("")
    		|| memberVO.getTel().equals("") || memberVO.getSexCd().equals("")) {

    		rstStr = "failed";
    	}else {

	    	int rst = 0;

	    	rst = memberService.insertMember(memberVO);

	    	if(rst >0) {
	    		rstStr = "success";
	    	}
    	}

    	memberVO.setResult(rstStr);

    	String gsonString  = gson.toJson(memberVO);

    	return gsonString;
    }

    /**
     * Moble Json 임시비번발급
     * @param
     * @param model
     */
    @GetMapping("/mob/getTmpPw")
    @ResponseBody
    public String getTmpPw(@RequestParam Map<String, Object> params, HttpServletRequest request){

    	Gson gson = new Gson();
    	String rstStr = ""; //a123456b

    	// membervo에 param 으로 받은 id 셋팅
    	MemberVO memberVO = new MemberVO();
    	memberVO.setUserId(params.get("userId").toString());

    	String tmpPw = "";
    	for (int i = 0; i < 9; i++) {
    		tmpPw += (char) ((Math.random() * 26) + 97);
		}

    	System.out.println( "임시비번 ::>> " + tmpPw);

    	memberVO.setUserPw(tmpPw);

        memberService.updateMember(memberVO);

        memberVO.setUserPw(tmpPw);

    	String gsonString  = gson.toJson(memberVO);

    	return gsonString;
    }

}
