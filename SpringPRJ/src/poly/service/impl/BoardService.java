package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BoardDTO;
import poly.persistance.mapper.BoardMapper;
import poly.persistance.mapper.ReviewMapper;
import poly.service.IBoardService;

@Service("BoardService")
public class BoardService implements IBoardService{
	
	@Resource(name="BoardMapper")
	private BoardMapper boardMapper;
	
	@Resource(name="ReviewMapper")
	private ReviewMapper reviewMapper;

	@Override
	public List<BoardDTO> getBoardList() throws Exception {
		System.out.println("Service ----------------------");
		return boardMapper.getBoardList();
	}

	@Override
	public List<BoardDTO> getNoticeList() throws Exception {
		System.out.println("Service ----------------------");
		return boardMapper.getNoticeList();
	}

	@Override
	public int insertBoardProc(BoardDTO bDTO) throws Exception {
		System.out.println("Service ----------------------");
		return boardMapper.insertBoardProc(bDTO);
	}

	@Override
	public BoardDTO getBoardDetail(String boardNo) throws Exception {
		System.out.println("Service ----------------------");
		return boardMapper.getBoardDetail(boardNo);
	}

	@Override
	public int updateBoardProc(BoardDTO bDTO) throws Exception {
		return boardMapper.updateBoardProc(bDTO);
	}

	@Override
	public int deleteBoardProc(String boardNo) throws Exception {
		reviewMapper.deleteReviewProc(boardNo);
		return boardMapper.deleteBoardProc(boardNo);
	}
	
}
