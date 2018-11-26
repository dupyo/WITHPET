package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.service.ICenterService;

@Controller
public class CenterController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CenterService")
	private ICenterService centerService;
	
	@RequestMapping(value="center/centerList")
	public String centerList(HttpServletRequest request, Model model) throws Exception {
		return null;
	}
}
