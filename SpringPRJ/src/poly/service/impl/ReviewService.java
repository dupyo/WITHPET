package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.ReviewDTO;
import poly.persistance.mapper.ReviewMapper;
import poly.service.IReviewService;

@Service("ReviewService")
public class ReviewService implements IReviewService{
	
	@Resource(name="ReviewMapper")
	private ReviewMapper reviewMapper;
	
	@Override
	public int insertReviewProc(ReviewDTO rDTO) throws Exception {
		return reviewMapper.insertReviewProc(rDTO);
	}
	
	@Override
	public List<ReviewDTO> getReviewList(String boardNo) throws Exception {
		return reviewMapper.getReviewList(boardNo);
	}
	
	@Override
	public List<ReviewDTO> insertNgetListAjax(ReviewDTO rDTO) throws Exception {
		reviewMapper.insertReviewProc(rDTO);
		return reviewMapper.insertNgetListAjax(rDTO);
	}
	
	@Override
	public int updateReviewProc(ReviewDTO rDTO) throws Exception {
		return reviewMapper.updateReviewProc(rDTO);
	}

	@Override
	public int deleteReviewProc(String boardNo) throws Exception {
		return reviewMapper.deleteReviewProc(boardNo);
	}

}
