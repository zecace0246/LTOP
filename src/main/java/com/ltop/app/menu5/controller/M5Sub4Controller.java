package com.ltop.app.menu5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ltop.app.common.domain.PageDTO;
import com.ltop.app.common.domain.PageVO;
import com.ltop.app.menu5.domain.M5Sub4VO;
import com.ltop.app.menu5.service.M5Sub4Service;

import lombok.Setter;

@Controller
@RequestMapping("/menu5")
public class M5Sub4Controller {

	@Setter(onMethod_ = @Autowired)
	private M5Sub4Service m5Sub4Service;
	
	// 알람속성 목록 화면
	@GetMapping("/sub4/alarmPropertyList")
	public String list(PageVO pageVO, M5Sub4VO m5Sub4VO, Model model) {
		int total = m5Sub4Service.selectAlarmPropertyTotalCount(m5Sub4VO);
		
		List<M5Sub4VO> alarmPropertyList = m5Sub4Service.selectAlarmPropertyList(pageVO, m5Sub4VO);
		
		model.addAttribute("alarmPropertyList", alarmPropertyList);
		model.addAttribute("searchCategory", m5Sub4VO.getSearchCategory());
		model.addAttribute("searchCategorySub", m5Sub4VO.getSearchCategorySub());
		model.addAttribute("searchAlarmType", m5Sub4VO.getSearchAlarmType());
		model.addAttribute("pageMaker", new PageDTO(pageVO, total));
		
		return "/menu5/sub4/alarmPropertyList";
	}
	
	// 알람속성 등록 화면
	@GetMapping("/sub4/alarmPropertyRegister")
	public String alarmPropertyRegister() {
		return "/menu5/sub4/alarmPropertyRegister";
	}
	
	// 알람속성 등록
	@PostMapping("/sub4/register")
	@ResponseBody
	public ResponseEntity<String> register(M5Sub4VO m5Sub4VO) {		
		boolean result = m5Sub4Service.insertAlarmProperty(m5Sub4VO);

		return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}	
	
	// 알람속성 상세 보기
	@PostMapping("/sub4/alarmPropertyView")
	public String alarmPropertyView(M5Sub4VO m5Sub4VO, @ModelAttribute("pageVO") PageVO pageVO, Model model) {
		model.addAttribute("alarmProperty", m5Sub4Service.selectAlarmPropertyInfo(m5Sub4VO));
		
		model.addAttribute("searchCategory", m5Sub4VO.getSearchCategory());
		model.addAttribute("searchCategorySub", m5Sub4VO.getSearchCategorySub());
		model.addAttribute("searchAlarmType", m5Sub4VO.getSearchAlarmType());
		
		return "/menu5/sub4/alarmPropertyView";
	}
	
	// 알람속성 수정 화면
	@PostMapping("/sub4/alarmPropertyModify")
	public String alarmPropertyModify(M5Sub4VO m5Sub4VO, @ModelAttribute("pageVO") PageVO pageVO, Model model) {
		model.addAttribute("alarmProperty", m5Sub4Service.selectAlarmPropertyInfo(m5Sub4VO));
		
		model.addAttribute("searchCategory", m5Sub4VO.getSearchCategory());
		model.addAttribute("searchCategorySub", m5Sub4VO.getSearchCategorySub());
		model.addAttribute("searchAlarmType", m5Sub4VO.getSearchAlarmType());
		
		return "/menu5/sub4/alarmPropertyModify";
	}
	
	// 알람속성 수정
	@PostMapping("/sub4/modify")
	@ResponseBody
	public ResponseEntity<String> modify(M5Sub4VO m5Sub4VO, RedirectAttributes rttr) {		
		boolean result = m5Sub4Service.updateAlarmProperty(m5Sub4VO);
		
		rttr.addAttribute("searchCategory", m5Sub4VO.getSearchCategory());
		rttr.addAttribute("searchCategorySub", m5Sub4VO.getSearchCategorySub());
		rttr.addAttribute("searchAlarmType", m5Sub4VO.getSearchAlarmType());
		
		return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 알람속성 삭제
	@PostMapping("/sub4/remove")
	public ResponseEntity<String> remove(M5Sub4VO m5Sub4VO) {		
		boolean result = m5Sub4Service.deleteAlarmProperty(m5Sub4VO);
		
		return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}	
	
}
