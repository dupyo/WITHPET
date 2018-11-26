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
	
	//게시판 리스트 불러오기 창 이동
	@RequestMapping(value="board/boardList")
	public String getBoardList(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		List<BoardDTO> bList = boardService.getBoardList();
		log.info("bList : " + bList);
		model.addAttribute("bList", bList);
		log.info("add to model~~!!");
		
		//bList = null;

		log.info("------------------------End : "+this.getClass());		
		return "/board/boardList";
	}
	
	//공지사항 리스트 불러오기 창 이동
	@RequestMapping(value="notice/noticeList")
	public String getNoticeList(HttpServletRequest request, Model model) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		List<BoardDTO> nList = boardService.getNoticeList();
		log.info("nList : " + nList);
		model.addAttribute("nList", nList);
		log.info("add to model~~!!");
		
		//bList = null;

		log.info("------------------------End : "+this.getClass());		
		return "/notice/noticeList";
	}
	
	//게시물 작성하기 창 이동
	@RequestMapping(value="board/insertBoard")
	public String insertBoard(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
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
			
			log.info("------------------------End : "+this.getClass());
			return "/board/insertBoard";
		}
	}

	//게시물 작성 실행
	@RequestMapping(value="board/insertBoardProc", method=RequestMethod.POST)
	public String insertBoardProc(HttpServletRequest request, Model model, HttpSession session, BoardDTO bDTO) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
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
		
		
		log.info("------------------------End : "+this.getClass());
		return "/alert";
	}
	
	//게시뭉 상세보기
	@RequestMapping(value="board/boardDetail", method=RequestMethod.POST)
	public String getBoardDetail(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		/*UserDTO sDTO = (UserDTO)session.getAttribute("uDTO");*/
		String boardNo = request.getParameter("boardNo");
		log.info("boardNo : " + boardNo);
		
		BoardDTO bDTO = boardService.getBoardDetail(boardNo);
		model.addAttribute("bDTO", bDTO);
		
		log.info("------------------------End : "+this.getClass());
		return "/board/boardDetail";
	}
	
	//게시물 수정 실행
	@RequestMapping(value="user/updateBoardProc", method=RequestMethod.POST)
	public String updateBoardProc(HttpServletRequest request, Model model, BoardDTO bDTO) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		log.info("getDTOboardNo : " + bDTO.getBoardNo());
		log.info("getDTOtitle : " + bDTO.getTitle());
		log.info("getDTOcontent : " + bDTO.getContent());
		
		int result = boardService.updateBoardProc(bDTO);
		
		if (result == 0) {
			log.info("게시물 수정 실패");
		} else {
			log.info("게시물 수정 성공");
		}
		
		log.info("------------------------End : "+this.getClass());
		return "redirect:/board/boardList.do";
		
	}
	
	//게시물 삭제 실행
	@RequestMapping(value="board/deleteBoardProc", method=RequestMethod.GET)
	public String deleteBoardProc(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		/*UserDTO sDTO = (UserDTO)session.getAttribute("uDTO");*/
		String boardNo = request.getParameter("boardNo");
		log.info("boardNo : " + boardNo);
		
		int result = boardService.deleteBoardProc(boardNo);
		
		if (result == 0) {
			log.info("게시물 삭제 실패");
		} else {
			log.info("게시물 삭제 성공");
		}
		
		log.info("------------------------End : "+this.getClass());
		return "redirect:/board/boardList.do";
		
	}
	
	
}
