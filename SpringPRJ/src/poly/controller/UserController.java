package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.SpringLayout.Constraints;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.UserDTO;
import poly.service.IUserService;
import poly.util.CmmUtil;

@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());
	String msg = "";
	String url = "";
	
	
	@Resource(name="UserService")
	private IUserService userService;
	
	//로그인 창 이동
	@RequestMapping(value="user/userLogin")
	public String userLogin(HttpServletRequest request, Model model) throws Exception {
		log.info("userLogin Start~~!!");
		
		log.info("userLogin End~~!!");
		return "/user/userLogin";
	}

	//로그인
	@RequestMapping(value="user/userLoginProc", method=RequestMethod.POST)
	public String userLoginProc(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		log.info("userLoginProc Start~~!!");
		
		String userNameOrEmail = CmmUtil.nvl(request.getParameter("userNameOrEmail"));
		log.info("userNameOrEmail : " + userNameOrEmail);
		String str = "@";
		String password = CmmUtil.nvl(request.getParameter("password"));
		log.info("password : " + password);
		boolean isEmail = false;
		
		isEmail = userNameOrEmail.contains(str);
		log.info("isEmail : " + isEmail);
		
		UserDTO uDTO = new UserDTO();
		log.info("uDTO : " + uDTO);
		if (isEmail) {
			uDTO.setUserEmail(userNameOrEmail);
			log.info("userEmail : " + uDTO.getUserEmail());
		} else {
			uDTO.setUserName(userNameOrEmail);
			log.info("userName : " + uDTO.getUserName());
		}
		uDTO.setPassword(password);
		log.info("password : " + uDTO.getPassword());
		
		uDTO = userService.userLoginProc(uDTO);

		
			
		if (
			uDTO.getUserNo() == null ||
			uDTO.getUserName() == null ||
			uDTO.getUserEmail() == null ||
			uDTO.getUserTel() == null ||
			uDTO.getUserAuth() == null ||
			uDTO.getBirthGender() == null ||
			uDTO.getRegDate() == null
			
			/*"".equals(uDTO.getUserNo()) ||
			"".equals(uDTO.getUserName()) ||
			"".equals(uDTO.getUserEmail()) ||
			"".equals(uDTO.getUserTel()) ||
			"".equals(uDTO.getUserAuth()) ||
			"".equals(uDTO.getBirthGender()) ||
			"".equals(uDTO.getRegDate())*/			
				) {
			msg="failed Sign in!";
			url="/user/userLogin.do";
		} else {
			session.setAttribute("uDTO", uDTO);
			msg="success Sign in!";
			url="/main.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		log.info("userLoginProc End~~!!");
		return "/alert";
	}
	
	//로그아웃
	@RequestMapping(value="user/userLogoutProc")
	public String userLogoutProc(HttpServletRequest request, HttpSession session) throws Exception {
		log.info("userLogoutProc Start~~!!");
		
		session.invalidate();
		
		log.info("userLogoutProc End~~!!");
		return "redirect://localhost:8080/main.do";
	}
	
	//회원가입
	@RequestMapping(value="user/userReg")
	public String userReg(HttpServletRequest request, Model model) throws Exception {
		log.info("userReg Start~~!!");
		
		log.info("userReg End~~!!");
		return "/user/userReg";
	}
	//회원가입실행
	@RequestMapping(value="user/userRegProc", method=RequestMethod.POST)
	public String userRegProc(HttpServletRequest request, Model model) throws Exception {
		log.info("userRegProc Start~~!!");

		String userName = request.getParameter("userName");
		log.info("userName : " + userName);
		String userEmail = request.getParameter("userEmail");
		log.info("userEmail : " + userEmail);
		String password = request.getParameter("password");
		log.info("pwd : " + password);
		String userTel = request.getParameter("userTel");
		log.info("userTel : " + userTel);
		String idBirth = request.getParameter("idBirth");
		log.info("idBirth : " + idBirth);
		String idGender = request.getParameter("idGender");
		log.info("idGender : " + idGender);
		
		String birthGender = idBirth + idGender;
		log.info("birthGender : " + birthGender);
		
		UserDTO uDTO = new UserDTO();
		uDTO.setUserName(userName);
		uDTO.setUserEmail(userEmail);
		uDTO.setPassword(password);
		uDTO.setUserTel(userTel);
		uDTO.setBirthGender(birthGender);
		
		int result = userService.insertUser(uDTO);
		
		if (result == 0) {
			msg="failed registered!";
			url="/user/userReg.do";
		} else {
			msg="success registered. \\ntry sign in!";
			url="/user/userLogin.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		log.info("userRegProc End~~!!");
		return "/alert";
	}
}
