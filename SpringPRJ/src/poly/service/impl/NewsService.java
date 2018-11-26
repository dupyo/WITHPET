package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.NewsDTO;
import poly.persistance.mapper.NewsMapper;
import poly.service.INewsService;

@Service("NewsService")
public class NewsService implements INewsService {
	
	@Resource(name="NewsMapper")
	private NewsMapper newsMapper;

	@Override
	public int insertNewsProc(NewsDTO nDTO) throws Exception {
		return newsMapper.insertNewsProc(nDTO);
	}

	@Override
	public List<NewsDTO> getNewsList(String newsNo) throws Exception {
		return newsMapper.getNewsList(newsNo);
	}
	
	@Override
	public NewsDTO getNewsInfo(NewsDTO nDTO) throws Exception {
		return newsMapper.getNewsInfo(nDTO);
	}

	@Override
	public int updateNewsProc(String newsNo) throws Exception {
		return newsMapper.updateNewsProc(newsNo);
	}

	@Override
	public int deleteNewsProc(String newsNo) throws Exception {
		return newsMapper.deleteNewsProc(newsNo);
	}
	
}
