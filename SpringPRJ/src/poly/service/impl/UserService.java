package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.UserDTO;
import poly.persistance.mapper.UserMapper;
import poly.service.IUserService;
import poly.util.CmmUtil;

@Service("UserService")
public class UserService implements IUserService{

	@Resource(name="UserMapper")
	private UserMapper userMapper;
	
	@Override
	public int insertUser(UserDTO uDTO) throws Exception {
		System.out.println("Service userName : " + CmmUtil.nvl(uDTO.getUserName()));
		System.out.println("Service userEmail : " + CmmUtil.nvl(uDTO.getUserEmail()));
		return userMapper.insertUser(uDTO);
	}

	@Override
	public UserDTO userLoginProc(UserDTO uDTO) throws Exception {
		System.out.println("Service userName : " + CmmUtil.nvl(uDTO.getUserName()));
		System.out.println("Service userEmail : " + CmmUtil.nvl(uDTO.getUserEmail()));
		System.out.println("Service password : " + CmmUtil.nvl(uDTO.getPassword()));
		return userMapper.userLoginProc(uDTO);
	}

	@Override
	public int updateUserInfo(UserDTO uDTO) throws Exception {
		System.out.println("Service userNo : " + CmmUtil.nvl(uDTO.getUserNo()));
		System.out.println("Service userName : " + CmmUtil.nvl(uDTO.getUserName()));
		System.out.println("Service userEmail : " + CmmUtil.nvl(uDTO.getUserEmail()));
		System.out.println("Service userTel : " + CmmUtil.nvl(uDTO.getUserTel()));
		System.out.println("Service password : " + CmmUtil.nvl(uDTO.getPassword()));
		return userMapper.updateUserInfo(uDTO);
	}
	
	@Override
	public int getMyNameChk(UserDTO uDTO) throws Exception {
		System.out.println("Service userName Ajax : " + CmmUtil.nvl(uDTO.getUserName()));
		/*System.out.println("Service userEmail Ajax : " + CmmUtil.nvl(uDTO.getUserEmail()));*/
		return userMapper.getMyNameChk(uDTO);
	}
	
	@Override
	public int getNameChk(UserDTO uDTO) throws Exception {
		System.out.println("Service userName Ajax : " + CmmUtil.nvl(uDTO.getUserName()));
		/*System.out.println("Service userEmail Ajax : " + CmmUtil.nvl(uDTO.getUserEmail()));*/
		return userMapper.getNameChk(uDTO);
	}
	
	@Override
	public int getEmailChk(UserDTO uDTO) throws Exception {
		/*System.out.println("Service userName Ajax : " + CmmUtil.nvl(uDTO.getUserName()));*/
		System.out.println("Service userEmail Ajax : " + CmmUtil.nvl(uDTO.getUserEmail()));
		return userMapper.getEmailChk(uDTO);
	}

	@Override
	public int deleteUserProc(String userNo) throws Exception {
		return userMapper.deleteUserProc(userNo);
	}

}
