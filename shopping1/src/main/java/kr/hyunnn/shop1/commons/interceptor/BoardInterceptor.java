package kr.hyunnn.shop1.commons.interceptor;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class BoardInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
	
		
		
		System.out.println("게시판 인터셉터작동");
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login")==null)

		{
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print("<script>alert('로그인필요'); location.href='/spring/user/login'; </script>");
			
			out.flush(); //버퍼비우기
			out.close();
			
			return false;
		}
		
		return true;
	}
	
}
