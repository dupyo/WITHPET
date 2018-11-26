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
		log.info(this.getClass() + " uDTO : " + uDTO);
		/*log.info("LoginProcSuccess : " + uDTO.getPassword());*/
		
		
		if (uDTO == null) {
			log.info("로그인 실패");
			model.addAttribute("msg", "failed Sign in!");
			model.addAttribute("url", "/user/userLogin.do");
			log.info("------------------------End : "+this.getClass());
			return "/alert";
		} else {
			session.setAttribute("uDTO", uDTO);
			log.info("------------------------End : "+this.getClass());
			return "redirect:/main.do";
		}
		
	}
	
	//로그아웃 실행
	@RequestMapping(value="user/userLogoutProc")
	public String userLogoutProc(HttpServletRequest request, HttpSession session) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		session.invalidate();
		
		log.info("------------------------End : "+this.getClass());
		return "redirect://localhost:8080/main.do";
	}
	
	//회원가입 창 이동
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
			log.info("회원가입 실패");
			model.addAttribute("msg", "failed registered!");
			model.addAttribute("/user/userReg.do");
		} else {
			model.addAttribute("msg", "success registered. \\ntry sign in!");
			model.addAttribute("url", "/user/userLogin.do");
		}
		
		
		log.info("------------------------End : "+this.getClass());
		return "/alert";
	}
	
	//회원정보 상세보기 창 이동
	@RequestMapping(value="user/userDetail")
	public String userDetail(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		UserDTO uDTO = new UserDTO();
		
		if(session != null) {
			uDTO = (UserDTO)session.getAttribute("uDTO");
		}
		
		if (uDTO == null) {
			log.info("로그인 세션 만료");
			model.addAttribute("msg", "로그인 후 이용하실 수 있습니다.");
			model.addAttribute("url", "/user/userLogin.do");
			log.info("------------------------End : "+this.getClass());
			return "/alert";
		} else {
			log.info("------------------------End : "+this.getClass());
			return "/user/userDetail";
		}
		
	}
	
	//회원정보수정 실행
	@RequestMapping(value="user/updateUserInfoProc")
	public String updateUserInfoProc(HttpServletRequest request, Model model, HttpSession session, UserDTO uDTO) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		if(session != null) {
			UserDTO sDTO = (UserDTO)session.getAttribute("uDTO");
			uDTO.setUserNo(sDTO.getUserNo());
			log.info("DTOuserNo : " + uDTO.getUserNo());
			log.info("DTOuserName : " + uDTO.getUserName());
			log.info("DTOuserEmail : " + uDTO.getUserEmail());
			log.info("DTOuserTel : " + uDTO.getUserTel());
			log.info("DTOpassword : " + uDTO.getPassword());
			
			int result = userService.updateUserInfo(uDTO);
			
			if (result == 0) {
				log.info("회원수정 실패");
				model.addAttribute("msg", "failed updated!");
			} else {
				model.addAttribute("msg", "Success updated!");
				session.setAttribute("uDTO", uDTO);
			}
			model.addAttribute("url", "/main.do");
			
		} else {
			model.addAttribute("msg", "로그인 세션이 만료되었습니다. \\n다시 로그인 하세요");
			model.addAttribute("url", "/user/userLogin.do");
		}
		log.info("------------------------End : "+this.getClass());
		return "/alert";
		
	}
	
	//테스트 ajax
	@RequestMapping(value="/userDetail2")
	public String asdasd(HttpServletRequest request, Model model, HttpSession session, UserDTO uDTO) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		log.info("------------------------End : "+this.getClass());
		return "/user/userDetail2";
		
	}
	
	//회원정보수정 유효성 검사 ajax name
	@RequestMapping(value="mynameChk", method=RequestMethod.POST)
	public @ResponseBody void mynameChk(HttpServletRequest request,HttpServletResponse response,HttpSession session, UserDTO uDTO) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		String userName = request.getParameter("userName");
		UserDTO sDTO = (UserDTO)session.getAttribute("uDTO");
		uDTO.setUserNo(sDTO.getUserNo());
		log.info("getAjax no : " + uDTO.getUserNo());
		log.info("getAjax name : " + userName);
		//체크하기 위한 변수
		int count = 0 ;
		count = userService.getMyNameChk(uDTO);
		response.getWriter().println(count);
		log.info("responseAjax");
		
		log.info("------------------------End : "+this.getClass());
	}
	
	//회원가입 유효성 검사 ajax name
	@RequestMapping(value="nameChk", method=RequestMethod.POST)
	public @ResponseBody void nameChk(HttpServletRequest request,HttpServletResponse response, UserDTO uDTO) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		String userName = request.getParameter("userName");
		log.info("getAjax name : " + userName);
		//체크하기 위한 변수
		int count = 0 ;
		count = userService.getNameChk(uDTO);
		response.getWriter().println(count);
		log.info("responseAjax");
		
		log.info("------------------------End : "+this.getClass());
	}
	
	//회원가입 유효성 검사 ajax email
	@RequestMapping(value="emailChk", method=RequestMethod.POST)
	public @ResponseBody void emailChk(HttpServletRequest request, HttpServletResponse response, UserDTO uDTO) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		String userEmail = request.getParameter("userEmail");
		log.info("getAjax email : " + userEmail);
		//체크하기 위한 변수
		int count = 0 ;
		count = userService.getEmailChk(uDTO);
		response.getWriter().println(count);
		log.info("responseAjax");
		
		log.info("------------------------End : "+this.getClass());
	}
	
	//회원탈퇴 실행
	@RequestMapping(value="user/deleteUserProc")
	public String deleteUserProc(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		UserDTO uDTO = new UserDTO();
		
		if(session != null) {
			uDTO = (UserDTO)session.getAttribute("uDTO");
		}
		
		if (uDTO == null) {
			log.info("로그인 세션 만료");
			model.addAttribute("msg", "로그인 세션이 만료되었습니다. \\n다시 로그인 하세요");
			model.addAttribute("url", "/user/userLogin.do");
			log.info("------------------------End : "+this.getClass());
			return "/alert";
		} else {
			String userNo = uDTO.getUserNo();
			int result = userService.deleteUserProc(userNo);
			
			if (result == 0) {
				log.info("회원탈퇴 실패");
				model.addAttribute("msg", "failed deleted!");
				model.addAttribute("url", "/user/userDetail.do");
				log.info("------------------------End : "+this.getClass());
				return "/alert";
			} else {
				log.info("회원탈퇴 성공");
				log.info("------------------------End : "+this.getClass());
				return "redirect:/main.do";
			}
		}
		
	}
	
	//내 관심센터 창 이동
	@RequestMapping(value="user/myFvrCenter")
	public String myFvrCenter(HttpServletRequest request, Model model) throws Exception {
		log.info("------------------------Start : "+this.getClass());
		
		log.info("------------------------End : "+this.getClass());
		return "/user/myFvrCenter";
	}
	
	//회원정보 리스트 불러오기 - 아직 구현 안됨
	@RequestMapping(value="user/userInfoList")
	public String getUserList(HttpServletRequest request, Model model) throws Exception {
		return "/user/userInfoList";
	}
	
	
	
}
