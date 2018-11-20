package poly.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.BoardDTO;
import poly.dto.UserDTO;
import poly.service.IBoardService;

@Controller
public class BoardController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="BoardService")
	private IBoardService boardService;
	
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
}
