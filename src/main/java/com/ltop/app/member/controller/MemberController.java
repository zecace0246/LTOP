package com.ltop.app.member.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

}
