package poly.service;

import java.util.List;

import poly.dto.BoardDTO;

public interface IBoardService {
	public List<BoardDTO> getBoardList() throws Exception;
	public List<BoardDTO> getNoticeList() throws Exception;
	public int insertBoardProc(BoardDTO bDTO) throws Exception;
}
