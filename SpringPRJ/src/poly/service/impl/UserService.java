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
		System.out.println("userName : " + CmmUtil.nvl(uDTO.getUserName()));
		System.out.println("userEmail : " + CmmUtil.nvl(uDTO.getUserEmail()));
		return userMapper.insertUser(uDTO);
	}

	@Override
	public UserDTO userLoginProc(UserDTO uDTO) throws Exception {
		System.out.println("userName : " + CmmUtil.nvl(uDTO.getUserName()));
		System.out.println("userEmail : " + CmmUtil.nvl(uDTO.getUserEmail()));
		return userMapper.userLoginProc(uDTO);
	}

}
