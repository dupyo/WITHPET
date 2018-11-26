package poly.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.ReviewDTO;
import poly.persistance.mapper.ReviewMapper;
import poly.service.IReviewService;

@Controller
public class ReviewController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="ReviewService")
	private IReviewService reviewService;
	
	//리뷰 작성 실행
	@RequestMapping(value="review/insertNgetListAjax")
	public @ResponseBody List<ReviewDTO> insertNgetListAjax(HttpServletRequest request, HttpSession session, HttpServletResponse response, ReviewDTO rDTO) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		List<ReviewDTO> rList = reviewService.insertNgetListAjax(rDTO);
		
		log.info("------------------------End : "+this.getClass());
		return rList;
	}
	
}
