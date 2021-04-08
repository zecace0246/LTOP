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

import com.ltop.app.common.domain.CommonComboVO;
import com.ltop.app.common.domain.PageDTO;
import com.ltop.app.common.domain.PageVO;
import com.ltop.app.common.service.CommonComboService;
import com.ltop.app.menu5.domain.M5Sub3VO;
import com.ltop.app.menu5.service.M5Sub3Service;

import lombok.Setter;

@Controller
@RequestMapping("/menu5")
public class M5Sub3Controller {

	@Setter(onMethod_ = @Autowired)
	private CommonComboService commonComboService;	
	
	@Setter(onMethod_ = @Autowired)
	private M5Sub3Service m5Sub3Service;

	
	// 그룹 목록 화면
	@GetMapping("/sub3/agencyList")
	public String list(PageVO pageVO, M5Sub3VO m5Sub3VO, Model model) {
		int total = m5Sub3Service.selectAgencyTotalCount(m5Sub3VO);
		
		List<M5Sub3VO> agencyList = m5Sub3Service.selectAgencyList(pageVO, m5Sub3VO);
		
		List<CommonComboVO> matCombo = commonComboService.selectMatCombo();
		
		model.addAttribute("agencyList", agencyList);
		model.addAttribute("matCombo", matCombo);
		model.addAttribute("searchAgencyName", m5Sub3VO.getSearchAgencyName());
		model.addAttribute("searchAdmName", m5Sub3VO.getSearchAdmName());
		model.addAttribute("searchUseYn", m5Sub3VO.getSearchUseYn());
		model.addAttribute("pageMaker", new PageDTO(pageVO, total));
		
		return "/menu5/sub3/agencyList";
	}
	
	// 그룹 등록 화면
	@GetMapping("/sub3/agencyRegister")
	public String agencyRegister(Model model) {
		List<CommonComboVO> agencyAdminCombo = commonComboService.selectAgencyAdminCombo();
		
		model.addAttribute("agencyAdminCombo", agencyAdminCombo);
		
		return "/menu5/sub3/agencyRegister";
	}
	
	// 그룹 등록
	@PostMapping("/sub3/register")
	@ResponseBody
	public ResponseEntity<String> register(M5Sub3VO m5Sub3VO) {		
		boolean result = m5Sub3Service.insertAgency(m5Sub3VO);

		return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}	
	
	// 그룹 상세 보기
	@PostMapping("/sub3/agencyView")
	public String agencyView(M5Sub3VO m5Sub3VO, @ModelAttribute("pageVO") PageVO pageVO, Model model) {
		List<CommonComboVO> agencyAdminCombo = commonComboService.selectAgencyAdminCombo();
		
		model.addAttribute("agencyAdminCombo", agencyAdminCombo);
		
		model.addAttribute("agency", m5Sub3Service.selectAgencyInfo(m5Sub3VO));
		model.addAttribute("agencyMathList", m5Sub3Service.selectAgencyMathList(m5Sub3VO));
		
		model.addAttribute("searchAgencyName", m5Sub3VO.getSearchAgencyName());
		model.addAttribute("searchAdmName", m5Sub3VO.getSearchAdmName());
		model.addAttribute("searchUseYn", m5Sub3VO.getSearchUseYn());
		
		return "/menu5/sub3/agencyView";
	}
	
	// 그룹 수정 화면
	@PostMapping("/sub3/agencyModify")
	public String gencyModify(M5Sub3VO m5Sub3VO, @ModelAttribute("pageVO") PageVO pageVO, Model model) {
		List<CommonComboVO> agencyAdminCombo = commonComboService.selectAgencyAdminCombo();
		List<CommonComboVO> agencyUserCombo = commonComboService.selectAgencyUserCombo();
		List<CommonComboVO> matCombo = commonComboService.selectMatCombo();
		
		model.addAttribute("agencyAdminCombo", agencyAdminCombo);
		model.addAttribute("agencyUserCombo", agencyUserCombo);
		model.addAttribute("matCombo", matCombo);
		
		model.addAttribute("agency", m5Sub3Service.selectAgencyInfo(m5Sub3VO));
		model.addAttribute("agencyMathList", m5Sub3Service.selectAgencyMathList(m5Sub3VO));
				
		model.addAttribute("searchAgencyName", m5Sub3VO.getSearchAgencyName());
		model.addAttribute("searchAdmName", m5Sub3VO.getSearchAdmName());
		model.addAttribute("searchUseYn", m5Sub3VO.getSearchUseYn());
		
		return "/menu5/sub3/agencyModify";
	}
	
	// 그룹 수정
	@PostMapping("/sub3/modify")
	@ResponseBody
	public ResponseEntity<String> modify(M5Sub3VO m5Sub3VO, RedirectAttributes rttr) {		
		boolean result = m5Sub3Service.updateAgency(m5Sub3VO);
		
		rttr.addAttribute("searchAgencyName", m5Sub3VO.getSearchAgencyName());
		rttr.addAttribute("searchAdmName", m5Sub3VO.getSearchAdmName());
		rttr.addAttribute("searchUseYn", m5Sub3VO.getSearchUseYn());
		
		return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 그룹 삭제
	@PostMapping("/sub3/remove")
	public ResponseEntity<String> remove(M5Sub3VO m5Sub3VO) {		
		boolean result = m5Sub3Service.deleteAgency(m5Sub3VO);
		
		if (result) {
			m5Sub3Service.deleteAgencyMath(m5Sub3VO);
		}
		
		return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}	
	
	// 그룹 상세 목록 화면
	@GetMapping("/sub3/agencyMathList")
	public void agencyMathList(M5Sub3VO m5Sub3VO, Model model) {

		List<M5Sub3VO> agencyMathList = m5Sub3Service.selectAgencyMathList(m5Sub3VO);
		
		model.addAttribute("agencyMathList", agencyMathList);
	}
	
	// 그룹 상세 등록
	@PostMapping("/sub3/detailRegister")
	@ResponseBody
	public ResponseEntity<List<M5Sub3VO>> detailRegister(M5Sub3VO m5Sub3VO) {		
		boolean result = m5Sub3Service.insertAgencyMath(m5Sub3VO);

		List<M5Sub3VO> agencyMathList = m5Sub3Service.selectAgencyMathList(m5Sub3VO);
		
		return result ? new ResponseEntity<>(agencyMathList, HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 그룹 수정 정보
	@PostMapping("/sub3/agencyDetailModify")
	@ResponseBody
	public ResponseEntity<M5Sub3VO> agencyDetailModify(M5Sub3VO m5Sub3VO) {
		M5Sub3VO agencyMath = m5Sub3Service.selectAgencyMathInfo(m5Sub3VO);
		
		return agencyMath != null ? new ResponseEntity<>(agencyMath, HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 그룹 상세 수정
	@PostMapping("/sub3/detailModify")
	@ResponseBody
	public ResponseEntity<List<M5Sub3VO>> detailModify(M5Sub3VO m5Sub3VO) {		
		boolean result = m5Sub3Service.updateAgencyMath(m5Sub3VO);
		
		List<M5Sub3VO> agencyMathList = m5Sub3Service.selectAgencyMathList(m5Sub3VO);

		return result ? new ResponseEntity<>(agencyMathList, HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}	
	
	// 그룹 상세 삭제
	@PostMapping("/sub3/detailRemove")
	@ResponseBody
	public ResponseEntity<List<M5Sub3VO>> detailRemove(M5Sub3VO m5Sub3VO) {		
		boolean result = m5Sub3Service.deleteAgencyMath(m5Sub3VO);
		
		List<M5Sub3VO> agencyMathList = m5Sub3Service.selectAgencyMathList(m5Sub3VO);
		
		return result ? new ResponseEntity<>(agencyMathList, HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
