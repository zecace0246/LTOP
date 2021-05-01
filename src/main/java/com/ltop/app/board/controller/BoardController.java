package com.ltop.app.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.ltop.app.board.domain.BoardAttachVO;
import com.ltop.app.board.domain.BoardVO;
import com.ltop.app.board.domain.Criteria;
import com.ltop.app.board.domain.PageDTO;
import com.ltop.app.board.service.BoardService;
import com.ltop.app.common.utils.JsonToStringUtil;

import lombok.Setter;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Setter(onMethod_ = @Autowired)
    private BoardService service;

    /**
     * Sample
     * @param model
     * @return
     */
    @GetMapping(value = "/example")
    public String selectExampleList(ModelMap model) {
        model.addAttribute("test_str", "1234");
        return "jsonView";
    }

    /**
     * Example
     * @param cri
     * @param model
     */
    @RequestMapping(value="/practice/responseBodyTest")
    @ResponseBody
    public List<Map<String, Object>> responseBodyTest(@RequestParam Map<String, Object> params, HttpServletRequest request){
        List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();

       // result = testService.selectData(params);
        return result;
    }

    /**
     * 게시판 리스트
     * @param cri
     * @param model
     */
    @GetMapping("/boardList")
    public void boardList(Criteria cri, Model model) {

        model.addAttribute("list", service.selectBoardList(cri));

        int total = service.selectBoardTotalCount(cri);

        model.addAttribute("pageMaker", new PageDTO(cri, total));
    }

    /**
     * Moble Json 테스트 위한 게시판 리스트
     * @param cri
     * @param model
     */
    @GetMapping("/mob/boardList")
    @ResponseBody
    public String mobBoardList(@RequestParam Map<String, Object> params, Criteria cri, HttpServletRequest request){
        List<BoardVO> bodList = service.selectBoardList(cri);

        Gson gson = new Gson();
        String gsonString = gson.toJson(bodList);

        System.out.println(" Moble Json  Board List ::> "+ gsonString);

        return gsonString;
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
