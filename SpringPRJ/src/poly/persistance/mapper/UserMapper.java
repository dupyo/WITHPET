package poly.persistance.mapper;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface UserMapper {
	public int insertUser(UserDTO uDTO) throws Exception;
	public UserDTO userLoginProc(UserDTO uDTO) throws Exception;
	public int updateUserInfo(UserDTO uDTO) throws Exception;
	public int getEmailChk(UserDTO uDTO) throws Exception;
}
