package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.BoardDTO;

@Mapper("BoardMapper")
public interface BoardMapper {
	public List<BoardDTO> getBoardList() throws Exception;
	public List<BoardDTO> getNoticeList() throws Exception;
	public int insertBoardProc(BoardDTO bDTO) throws Exception;

}
