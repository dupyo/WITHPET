package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.NewsDTO;

@Mapper("NewsMapper")
public interface NewsMapper {
	public int insertNewsProc(NewsDTO nDTO) throws Exception;
	public List<NewsDTO> getNewsList(String newsNo) throws Exception;
	public NewsDTO getNewsInfo(NewsDTO nDTO) throws Exception;
	public int updateNewsProc(String newsNo) throws Exception;
	public int deleteNewsProc(String newsNo) throws Exception;
	
}
