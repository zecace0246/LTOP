package com.ltop.app.common.controller;

import java.util.Locale;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommonController {
	
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
				
}
