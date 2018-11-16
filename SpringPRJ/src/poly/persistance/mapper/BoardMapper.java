package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.BoardDTO;

@Mapper("BoardMapper")
public interface BoardMapper {
	public List<BoardDTO> getBoardList(List<BoardDTO> bList) throws Exception;

}
