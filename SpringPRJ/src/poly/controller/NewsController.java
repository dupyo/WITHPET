package poly.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import poly.service.INewsService;

@Controller
public class NewsController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="NewsService")
	private INewsService newsService;
}
