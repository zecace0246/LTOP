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
import com.ltop.app.menu5.domain.M5Sub2VO;
import com.ltop.app.menu5.service.M5Sub2Service;

import lombok.Setter;

@Controller
@RequestMapping("/menu5")
public class M5Sub2Controller {

	@Setter(onMethod_ = @Autowired)
	private CommonComboService commonComboService;

	@Setter(onMethod_ = @Autowired)
	private M5Sub2Service m5Sub2Service;

	// 사용자 목록 화면
	@GetMapping("/sub2/matList")
	public String list(PageVO pageVO, M5Sub2VO m5Sub2VO, Model model) {
		int total = m5Sub2Service.selectMatTotalCount(m5Sub2VO);

		List<M5Sub2VO> matList = m5Sub2Service.selectMatList(pageVO, m5Sub2VO);
	    List<CommonComboVO> comboGrpList = commonComboService.selectAgencyCombo();

		model.addAttribute("matList", matList);
		model.addAttribute("comboGrpList", comboGrpList);
		model.addAttribute("searchMatId", m5Sub2VO.getSearchMatId());
		model.addAttribute("searchMatDesc", m5Sub2VO.getSearchMatDesc());
		model.addAttribute("searchAgency", m5Sub2VO.getSearchAgency());
		model.addAttribute("searchUseYn", m5Sub2VO.getSearchUseYn());
		model.addAttribute("pageMaker", new PageDTO(pageVO, total));

		return "/menu5/sub2/matList";
	}

	// 사용자 등록 화면
	@GetMapping("/sub2/matRegister")
	public String matRegister() {
		return "/menu5/sub2/matRegister";
	}

	// 사용자 등록
	@PostMapping("/sub2/register")
	@ResponseBody
	public ResponseEntity<String> register(M5Sub2VO m5Sub2VO) {
		boolean result = m5Sub2Service.insertMat(m5Sub2VO);

		return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 사용자 상세 보기
	@PostMapping("/sub2/matView")
	public String matView(M5Sub2VO m5Sub2VO, @ModelAttribute("pageVO") PageVO pageVO, Model model) {
		model.addAttribute("mat", m5Sub2Service.selectMatInfo(m5Sub2VO));

		model.addAttribute("searchMatId", m5Sub2VO.getSearchMatId());
		model.addAttribute("searchUseYn", m5Sub2VO.getSearchUseYn());

		return "/menu5/sub2/matView";
	}

	// 사용자 수정 화면
	@PostMapping("/sub2/matModify")
	public String matModify(M5Sub2VO m5Sub2VO, @ModelAttribute("pageVO") PageVO pageVO, Model model) {
		model.addAttribute("mat", m5Sub2Service.selectMatInfo(m5Sub2VO));

		model.addAttribute("searchMatId", m5Sub2VO.getSearchMatId());
		model.addAttribute("searchUseYn", m5Sub2VO.getSearchUseYn());

		return "/menu5/sub2/matModify";
	}

	// 사용자 수정
	@PostMapping("/sub2/modify")
	@ResponseBody
	public ResponseEntity<String> modify(M5Sub2VO m5Sub2VO, RedirectAttributes rttr) {
		boolean result = m5Sub2Service.updateMat(m5Sub2VO);

		rttr.addAttribute("searchMatId", m5Sub2VO.getSearchMatId());
		rttr.addAttribute("searchUseYn", m5Sub2VO.getSearchUseYn());

		return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 사용자 삭제
	@PostMapping("/sub2/remove")
	public ResponseEntity<String> remove(M5Sub2VO m5Sub2VO) {
		boolean result = m5Sub2Service.deleteMat(m5Sub2VO);

		return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
