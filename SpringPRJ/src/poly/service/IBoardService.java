package poly.service;

import java.util.List;

import poly.dto.BoardDTO;

public interface IBoardService {
	public List<BoardDTO> getBoardList(List<BoardDTO> bList) throws Exception;
}
