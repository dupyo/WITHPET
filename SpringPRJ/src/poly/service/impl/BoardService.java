package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BoardDTO;
import poly.persistance.mapper.BoardMapper;
import poly.service.IBoardService;

@Service("BoardService")
public class BoardService implements IBoardService{
	
	@Resource(name="BoardMapper")
	private BoardMapper boardMapper;

	@Override
	public List<BoardDTO> getBoardList() throws Exception {
		return boardMapper.getBoardList();
	}
	
}
