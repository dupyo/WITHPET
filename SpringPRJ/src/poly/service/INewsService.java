package poly.service;

import java.util.List;

import poly.dto.NewsDTO;

public interface INewsService {
	public int insertNewsProc(NewsDTO nDTO) throws Exception;
	public List<NewsDTO> getNewsList(String newsNo) throws Exception;
	public NewsDTO getNewsInfo(NewsDTO nDTO) throws Exception;
	public int updateNewsProc(String newsNo) throws Exception;
	public int deleteNewsProc(String newsNo) throws Exception;
}
