package poly.service;

import java.util.List;

import poly.dto.ReviewDTO;

public interface IReviewService {
	public int insertReviewProc(ReviewDTO rDTO) throws Exception;
	public List<ReviewDTO> getReviewList(String boardNo) throws Exception;
	public List<ReviewDTO> insertNgetListAjax(ReviewDTO rDTO) throws Exception;
	public int updateReviewProc(ReviewDTO rDTO) throws Exception;
	public int deleteReviewProc(String boardNo) throws Exception;
}
