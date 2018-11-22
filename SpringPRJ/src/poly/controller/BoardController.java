package poly.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
/*import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;*/
import org.springframework.web.bind.annotation.*;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
/*import poly.dto.BoardDTO;
import poly.dto.UserDTO;*/
import poly.dto.*;
import poly.service.IBoardService;

@Controller
public class BoardController {
	private Logger log = Logger.getLogger(this.getClass());
	String msg = "";
	String url = "";
	@Resource(name="BoardService")
	private IBoardService boardService;
	
	//게시판 리스트 불러오기
	@RequestMapping(value="board/boardList")
	public String getBoardList(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		log.info("boardList Start~~!!");
		
		List<BoardDTO> bList = boardService.getBoardList();
		log.info("bList : " + bList);
		model.addAttribute("bList", bList);
		log.info("add to model~~!!");
		
		//bList = null;
		
		log.info("boardList End~~!!");
		return "/board/boardList";
	}
	
	//공지사항 리스트 불러오기
	@RequestMapping(value="notice/noticeList")
	public String getNoticeList(HttpServletRequest request, Model model) throws Exception {
		log.info("noticeList Start~~!!");
		
		List<BoardDTO> nList = boardService.getNoticeList();
		log.info("nList : " + nList);
		model.addAttribute("nList", nList);
		log.info("add to model~~!!");
		
		//bList = null;
		
		log.info("noticeList End~~!!");
		return "/notice/noticeList";
	}
	
	//게시물 작성하기
	@RequestMapping(value="board/insertBoard")
	public String insertBoard(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		log.info("insertBoard Start~~!!");
		
		UserDTO uDTO = new UserDTO();
		
		log.info("71");
		if(session != null) {
			uDTO = (UserDTO)session.getAttribute("uDTO");
			log.info("74");
		}
		log.info("76");
		
		if (uDTO == null) {
			log.info("79");
			model.addAttribute("msg", "로그인 후 이용하실 수 있습니다.");
			model.addAttribute("url", "/user/userLogin.do");
			log.info("insertBoard End~~!!");
			return "/alert";
		} else {
			log.info("84");
			log.info("insertBoard End~~!!");
			return "/board/insertBoard";
		}
	}

	//게시물 작성하기
	@RequestMapping(value="board/insertBoardProc", method=RequestMethod.POST)
	public String insertBoardProc(HttpServletRequest request, Model model, HttpSession session, BoardDTO bDTO) throws Exception {
		log.info("insertBoardProc Start~~!!");
		
		UserDTO uDTO = (UserDTO)session.getAttribute("uDTO");
		String userNo = uDTO.getUserNo();
		
		bDTO.setUserNo(userNo);
		log.info("bDTOget : " + bDTO.getTitle());
		log.info("bDTOget : " + bDTO.getContent());
		int result = boardService.insertBoardProc(bDTO);
		
		if (result == 0) {
			model.addAttribute("msg", "failed writed!");
			model.addAttribute("url", "/board/insertBoard.do");
		} else {
			model.addAttribute("msg", "success writed!");
			model.addAttribute("url", "/board/boardList.do");
		}
		
		log.info("insertBoardProc End~~!!");
		return "/alert";
	}
	
}
