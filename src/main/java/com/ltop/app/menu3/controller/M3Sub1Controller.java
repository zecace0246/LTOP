package com.ltop.app.menu3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ltop.app.menu3.domain.M3Sub1VO;
import com.ltop.app.menu3.service.M3Sub1Service;

import lombok.Setter;
@Controller
@RequestMapping("/menu3")
public class M3Sub1Controller {

	@Setter(onMethod_ = @Autowired)
	private M3Sub1Service m3Sub1Service;
	
	
	// 사용자 목록 화면
	@GetMapping("/sub1/userList")
	public String list(M3Sub1VO m3Sub1VO, Model model) {
		List<M3Sub1VO> userList = m3Sub1Service.selectUserList(m3Sub1VO);
		
		model.addAttribute("userList", userList);
		
		model.addAttribute("searchUserName", m3Sub1VO.getSearchUserName());
		model.addAttribute("searchMatId", m3Sub1VO.getSearchMatId());
		model.addAttribute("searchUseYn", m3Sub1VO.getSearchUseYn());
		model.addAttribute("searchGroup", m3Sub1VO.getSearchGroup());
		
		return "/menu3/sub1/userList";
	}
	
}
