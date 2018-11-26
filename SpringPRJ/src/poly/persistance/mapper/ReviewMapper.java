package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.ReviewDTO;

@Mapper("ReviewMapper")
public interface ReviewMapper {
	public int insertReviewProc(ReviewDTO rDTO) throws Exception;
	public List<ReviewDTO> getReviewList(String boardNo) throws Exception;
	public List<ReviewDTO> insertNgetListAjax(ReviewDTO rDTO) throws Exception;
	public int updateReviewProc(ReviewDTO rDTO) throws Exception;
	public int deleteReviewProc(String boardNo) throws Exception;
	
}
