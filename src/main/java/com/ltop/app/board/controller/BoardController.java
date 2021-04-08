package com.ltop.app.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ltop.app.board.domain.BoardAttachVO;
import com.ltop.app.board.domain.BoardVO;
import com.ltop.app.board.domain.Criteria;
import com.ltop.app.board.domain.PageDTO;
import com.ltop.app.board.service.BoardService;

import lombok.Setter;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@GetMapping("/boardList")
	public void boardList(Criteria cri, Model model) {
		model.addAttribute("list", service.selectBoardList(cri));

		int total = service.selectBoardTotalCount(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/boardRegister")
	public String boardRegister() {
		
		return "/board/boardRegister";
	}
			
	@PostMapping(value = "/register", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<String> register(BoardVO boardVO, MultipartFile[] uploadFile) {		
		
		boolean result = service.register(boardVO, uploadFile);

		return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
		
	@PostMapping("/boardView")
	public String boardView(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("board", service.selectBoardInfo(bno));
		model.addAttribute("attatchList", service.getAttachList(bno));
		
		return "/board/boardView";
	}
	
	@PostMapping("/boardModify")
	public String boardModify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("board", service.selectBoardInfo(bno));
		model.addAttribute("attatchList", service.getAttachList(bno));
		
		return "/board/boardModify";
	}
	
	@PostMapping(value = "/modify", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<String> modify(BoardVO boardVO, Criteria cri, RedirectAttributes rttr, MultipartFile[] uploadFile) {		
		boolean result = service.modify(boardVO, uploadFile);

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("searchTitle", cri.getSearchTitle());
		rttr.addAttribute("searchContent", cri.getSearchContent());
		rttr.addAttribute("searchWriter", cri.getSearchWriter());
		
		return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping(value = "/remove", produces = "application/json")
	public ResponseEntity<String> remove(@RequestBody BoardVO boardVO, Criteria cri, RedirectAttributes rttr) {		
		boolean result = service.remove(boardVO.getBno());
		
		return result ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
}
