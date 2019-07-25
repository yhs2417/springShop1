package kr.hyunnn.shop1.commons.interceptor;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.hyunnn.shop1.user.model.UserVO;
import kr.hyunnn.shop1.user.service.IUserService;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter
{

	@Autowired
	private IUserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception 
	{
 
		System.out.println("자동로그인 인터셉터 작동");

		HttpSession session = request.getSession();
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		if(loginCookie !=null)
		{
			System.out.println("로컬에서 쿠기 발견됨");
			String sessionId=loginCookie.getValue(); //sessionid받기
			
			UserVO user=service.getUserWithCookie(sessionId);
			
			if(user != null) {
				session.setAttribute("login", user); //세션 등록(=로그인)
		}
		}
		return true;
		
}
}
