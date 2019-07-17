package kr.hyunnn.shop1.user.service;

import java.util.Date;

import kr.hyunnn.shop1.user.model.UserVO;
import kr.hyunnn.shop1.user.model.loginVO;

public interface IUserService {
	public void register(UserVO vo) throws Exception;

	public int confirmId(String userId) throws Exception;
	void updateUser(UserVO vo) throws Exception;
	UserVO login(loginVO vo) throws Exception;
	void withdrawal(int userNum) throws Exception;
	void keepLogin(String userId,String sessionId,Date sessionLimit) throws Exception;
	
	UserVO getUserWithCookie(String sessionId) throws Exception;
}
