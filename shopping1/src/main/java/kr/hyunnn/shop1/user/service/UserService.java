package kr.hyunnn.shop1.user.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.hyunnn.shop1.user.model.UserVO;
import kr.hyunnn.shop1.user.model.loginVO;
import kr.hyunnn.shop1.user.repository.IUserDAO;

@Service
public class UserService implements IUserService{
	
	@Autowired
	private IUserDAO dao;
	
	@Override
	public void register(UserVO vo) throws Exception {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		vo.setUserPwd(encoder.encode(vo.getUserPwd()));
		
		dao.register(vo);
	}

	@Override
	public int confirmId(String userId) throws Exception {
		 
		return dao.confirmId(userId);
	}

	@Override
	public UserVO login(loginVO vo) throws Exception {
	
		return dao.login(vo); //일단 아이디로 검색해서 다 가져옴.
	}

	@Override
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception {
		Map<String,Object> data = new HashMap<>();
		
		data.put("userId",userId);
		data.put("sessionId",sessionId);
		data.put("sessionLimit",sessionLimit);
		
		dao.keepLogin(data);
	}

	@Override
	public UserVO getUserWithCookie(String sessionId) throws Exception {
		 
		return dao.getUserWithCookie(sessionId);
	}

	@Override
	public void updateUser(UserVO vo) throws Exception {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		vo.setUserPwd(encoder.encode(vo.getUserPwd()));
		
		dao.updateUser(vo);
	}

	@Override
	public void withdrawal(int userNum) throws Exception {
		dao.withdrawal(userNum);
		
	}

}
