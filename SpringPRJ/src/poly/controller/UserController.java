package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.SpringLayout.Constraints;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		log.info("------------------------Start : "+this.getClass());
		
		log.info("------------------------End : "+this.getClass());
		return "/user/userLogin";
	}

	//로그인 실행
	@RequestMapping(value="user/userLoginProc", method=RequestMethod.POST)
	public String userLoginProc(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		String userNameOrEmail = CmmUtil.nvl(request.getParameter("userNameOrEmail"));
		log.info("userNameOrEmail : " + userNameOrEmail);
		String str = "@";
		String password = CmmUtil.nvl(request.getParameter("password"));
		log.info("password : " + password);
		boolean isEmail = false;
		
		isEmail = userNameOrEmail.contains(str);
		log.info("isEmail : " + isEmail);
		
		UserDTO uDTO = new UserDTO();
		
		if (isEmail) {
			uDTO.setUserEmail(userNameOrEmail);
			log.info("getDTOuserEmail : " + uDTO.getUserEmail());
		} else {
			uDTO.setUserName(userNameOrEmail);
			log.info("getDTOuserName : " + uDTO.getUserName());
		}
		uDTO.setPassword(password);
		log.info("getDTOpassword : " + uDTO.getPassword());
		
		uDTO = userService.userLoginProc(uDTO);

		log.info("LoginProcSuccess : " + uDTO.getPassword());
		
			
		if (
			uDTO.getUserNo() == null ||
			uDTO.getUserName() == null ||
			uDTO.getUserEmail() == null ||
			uDTO.getUserTel() == null ||
			uDTO.getUserAuth() == null ||
			uDTO.getBirthGender() == null ||
			uDTO.getRegDate() == null ||
			uDTO.getPassword() == null
				) {
			model.addAttribute("msg", "failed Sign in!");
			model.addAttribute("url", "/user/userLogin.do");
			log.info("------------------------End : "+this.getClass());
			return "/alert";
		} else {
			session.setAttribute("uDTO", uDTO);
			log.info("------------------------End : "+this.getClass());
			return "/index";
		}
		
	}
	
	//로그아웃
	@RequestMapping(value="user/userLogoutProc")
	public String userLogoutProc(HttpServletRequest request, HttpSession session) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		session.invalidate();
		
		log.info("------------------------End : "+this.getClass());
		return "redirect://localhost:8080/main.do";
	}
	
	//회원가입
	@RequestMapping(value="user/userReg")
	public String userReg(HttpServletRequest request, Model model) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		log.info("------------------------End : "+this.getClass());
		return "/user/userReg";
	}
	//회원가입 실행
	@RequestMapping(value="user/userRegProc", method=RequestMethod.POST)
	public String userRegProc(HttpServletRequest request, Model model, UserDTO uDTO) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		//form태그에서 입력한 정보는 UserDTO에 담겨져 있어서 따로 name으로 getParameter하지 않아도 uDTO에서 받아와 사용할 수 있음.
		String idBirth = request.getParameter("idBirth");
		log.info("idBirth : " + idBirth);
		String idGender = request.getParameter("idGender");
		log.info("idGender : " + idGender);
		
		String birthGender = idBirth + idGender;
		log.info("birthGender : " + birthGender);
		
		uDTO.setBirthGender(birthGender);
		log.info("uDTOgetname : " + uDTO.getUserName());
		int result = userService.insertUser(uDTO);
		
		if (result == 0) {
			model.addAttribute("msg", "failed registered!");
			model.addAttribute("/user/userReg.do");
		} else {
			model.addAttribute("msg", "success registered. \\ntry sign in!");
			model.addAttribute("url", "/user/userLogin.do");
		}
		
		
		log.info("------------------------End : "+this.getClass());
		return "/alert";
	}
	
	//회원정보 상세보기
	@RequestMapping(value="user/userDetail")
	public String userDetail(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		UserDTO uDTO = new UserDTO();
		
		if(session != null) {
			uDTO = (UserDTO)session.getAttribute("uDTO");
		}
		
		if (uDTO == null) {
			model.addAttribute("msg", "로그인 후 이용하실 수 있습니다.");
			model.addAttribute("url", "/user/userLogin.do");
			log.info("------------------------End : "+this.getClass());
			return "/alert";
		} else {
			log.info("------------------------End : "+this.getClass());
			return "/user/userDetail";
		}
		
	}
	
	//회원정보 수정
	@RequestMapping(value="user/updateUserInfoProc")
	public String updateUserInfoProc(HttpServletRequest request, Model model, HttpSession session, UserDTO uDTO) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		log.info("180");
		if(session != null) {
			UserDTO sDTO = (UserDTO)session.getAttribute("uDTO");
			log.info("183");
			uDTO.setUserNo(sDTO.getUserNo());
			log.info("DTOuserNo : " + uDTO.getUserNo());
			log.info("DTOuserName : " + uDTO.getUserName());
			log.info("DTOuserEmail : " + uDTO.getUserEmail());
			log.info("DTOuserTel : " + uDTO.getUserTel());
			log.info("DTOpassword : " + uDTO.getPassword());
			
			int result = userService.updateUserInfo(uDTO);
			log.info("192");
			
			if (result == 0) {
				log.info("195");
				model.addAttribute("msg", "failed updated!");
			} else {
				log.info("198");
				model.addAttribute("msg", "Success updated!");
				session.setAttribute("uDTO", uDTO);
			}
			model.addAttribute("url", "/main.do");
			
		} else {
			log.info("205");
			model.addAttribute("msg", "로그인 후 이용하실 수 있습니다.");
			model.addAttribute("url", "/user/userLogin.do");
		}
		log.info("------------------------End : "+this.getClass());
		return "/alert";
		
	}
	
	@RequestMapping(value="/userDetail2")
	public String asdasd(HttpServletRequest request, Model model, HttpSession session, UserDTO uDTO) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		log.info("------------------------End : "+this.getClass());
		return "/user/userDetail2";
		
	}
	
	
	@RequestMapping(value="/emailChk", method=RequestMethod.POST)
	public @ResponseBody void emailChk(HttpServletRequest request,HttpServletResponse response) throws Exception{
		log.info("------------------------Start : "+this.getClass());
		String userEmail = request.getParameter("userEmail");
		log.info(userEmail);
		UserDTO uDTO = new UserDTO();
		uDTO.setUserEmail(userEmail);
		//체크하기 위한 변수
		int count =0 ;
		count = userService.getEmailChk(uDTO);
		response.getWriter().println(count);
		
		log.info("------------------------End : "+this.getClass());
	}
	
	@RequestMapping(value="user/myFvrCenter")
	public String myFvrCenter(HttpServletRequest request, Model model) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		log.info("------------------------End : "+this.getClass());
		return "/user/myFvrCenter";
	}
	
	
}
