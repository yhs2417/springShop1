package kr.hyunnn.shop1.user.repository;

import java.util.Map;

import kr.hyunnn.shop1.user.model.UserVO;
import kr.hyunnn.shop1.user.model.loginVO;

public interface IUserDAO {

	public void register(UserVO vo) throws Exception;

	public int confirmId(String userId) throws Exception;
	
	public UserVO login(loginVO vo) throws Exception;
	
	public void keepLogin(Map<String,Object> data) throws Exception;
	
	public void updateUser(UserVO vo) throws Exception;
	public void withdrawal(int userNum) throws Exception;
	public UserVO getUserWithCookie(String sessionId) throws Exception;
}
