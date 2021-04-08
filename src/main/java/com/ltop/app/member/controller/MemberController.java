package com.ltop.app.member.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
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
	public void adminLogin(String error, String logout, Model model) {
		if (error != null) {
			model.addAttribute("loginError", "Login Error Check Your Account");
		}
	}
	
	@GetMapping("/adminRegister")
	public void adminRegister(Locale locale, Model model) {
	}
		
	@PostMapping("/adminLogout")
	public void adminLogout() {
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
