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
import com.ltop.app.menu5.domain.M5Sub5VO;
import com.ltop.app.menu5.service.M5Sub5Service;

import lombok.Setter;

@Controller
@RequestMapping("/menu5")
public class M5Sub5Controller {

	@Setter(onMethod_ = @Autowired)
	private M5Sub5Service m5Sub5Service;

	// 그룹 목록 화면
	@GetMapping("/sub5/groupList")
	public String list(PageVO pageVO, M5Sub5VO m5Sub5VO, Model model) {
		int total = m5Sub5Service.selectGroupTotalCount(m5Sub5VO);

		List<M5Sub5VO> groupList = m5Sub5Service.selectGroupList(pageVO, m5Sub5VO);

		model.addAttribute("groupList", groupList);
		model.addAttribute("searchAgencyName", m5Sub5VO.getSearchAgencyName());
		model.addAttribute("searchGroupName", m5Sub5VO.getSearchGroupName());
		model.addAttribute("searchAdmName", m5Sub5VO.getSearchAdmName());
		model.addAttribute("pageMaker", new PageDTO(pageVO, total));

		return "/menu5/sub5/groupList";
	}

	// 그룹 등록 화면
	@GetMapping("/sub5/groupRegister")
	public String alarmPropertyRegister() {
		return "/menu5/sub5/groupRegister";
	}

	// 그룹 등록
	@PostMapping("/sub5/register")
	@ResponseBody
	public ResponseEntity<String> register(M5Sub5VO m5Sub5VO) {
		boolean result = m5Sub5Service.insertGroup(m5Sub5VO);

		return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 그룹 상세 보기
	@PostMapping("/sub5/groupView")
	public String alarmPropertyView(M5Sub5VO m5Sub5VO, @ModelAttribute("pageVO") PageVO pageVO, Model model) {
		model.addAttribute("groupInfo", m5Sub5Service.selectGroupInfo(m5Sub5VO));

		model.addAttribute("searchAgencyName", m5Sub5VO.getSearchAgencyName());
		model.addAttribute("searchGroupName", m5Sub5VO.getSearchGroupName());
		model.addAttribute("searchAdmName", m5Sub5VO.getSearchAdmName());

		return "/menu5/sub5/groupView";
	}

	// 그룹 수정 화면
	@PostMapping("/sub5/groupModify")
	public String alarmPropertyModify(M5Sub5VO m5Sub5VO, @ModelAttribute("pageVO") PageVO pageVO, Model model) {
		model.addAttribute("groupInfo", m5Sub5Service.selectGroupInfo(m5Sub5VO));

		model.addAttribute("searchAgencyName", m5Sub5VO.getSearchAgencyName());
		model.addAttribute("searchGroupName", m5Sub5VO.getSearchGroupName());
		model.addAttribute("searchAdmName", m5Sub5VO.getSearchAdmName());

		return "/menu5/sub5/groupModify";
	}

	// 그룹 수정
	@PostMapping("/sub5/modify")
	@ResponseBody
	public ResponseEntity<String> modify(M5Sub5VO m5Sub5VO, RedirectAttributes rttr) {
		boolean result = m5Sub5Service.updateGroup(m5Sub5VO);

		rttr.addAttribute("searchAgencyName", m5Sub5VO.getSearchAgencyName());
		rttr.addAttribute("searchGroupName", m5Sub5VO.getSearchGroupName());
		rttr.addAttribute("searchAdmName", m5Sub5VO.getSearchAdmName());

		return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 그룹 삭제
	@PostMapping("/sub5/remove")
	public ResponseEntity<String> remove(M5Sub5VO m5Sub5VO) {
		boolean result = m5Sub5Service.deleteGroup(m5Sub5VO);

		return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
