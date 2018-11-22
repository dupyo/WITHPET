package poly.service;

import poly.dto.UserDTO;

public interface IUserService {
	public int insertUser(UserDTO uDTO) throws Exception;
	public UserDTO userLoginProc(UserDTO uDTO) throws Exception;
	public int updateUserInfo(UserDTO uDTO) throws Exception;
	public int getEmailChk(UserDTO uDTO) throws Exception;
}
