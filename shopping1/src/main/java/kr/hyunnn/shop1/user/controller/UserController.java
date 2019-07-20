package kr.hyunnn.shop1.user.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import kr.hyunnn.shop1.user.model.UserVO;
import kr.hyunnn.shop1.user.model.loginVO;
import kr.hyunnn.shop1.user.service.IUserService;


@RestController
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService service;
	
	@GetMapping("/info")
	public ModelAndView userInfo() throws Exception
	{
		System.out.println("회원정보수정");
		return new ModelAndView("user/userInfo");
	}
	@PostMapping("/info")
	public String updateUser(@RequestBody UserVO vo,HttpSession session) throws Exception
	{
		
		//session.removeAttribute("login");
		
		//session.invalidate(); //로그아웃됨.
		System.out.println(vo);
		session.setAttribute("login", vo);
		service.updateUser(vo);
		System.out.println("회원수정완료"+vo);
		
		
		return "success";
	}
	
	@GetMapping("")
	public ModelAndView join() throws Exception
	{
		System.out.println("회원가입진입");
		return new ModelAndView("user/signup");
	}
	
	@PostMapping("/idCheck")
	public String confirmId(@RequestBody String userId) throws Exception
	{
		System.out.println("idcheck진입"+userId);
		String res = null;
		
		int user=service.confirmId(userId);
		System.out.println(user);
		if(user==0) //없는 유저여야 가입가능함
		{res="ok";}
		else if (user==1)
		{res= "no";}
	
		return res;
	}
	
	@RequestMapping(value="" ,method=RequestMethod.POST)
	public String register(@RequestBody UserVO vo) throws Exception
	{
		System.out.println(vo);
		service.register(vo);
		System.out.println("회원가입완료");
		return "success";
	}

	//로그인
	@GetMapping("/login")
	public ModelAndView login() throws Exception
	{
		return new ModelAndView("user/login");
	}
	
	@PostMapping("/loginCheck")
	public String login(@RequestBody loginVO vo,HttpSession session,HttpServletResponse response) throws Exception
	{
		String res;
		
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		UserVO user=service.login(vo);
		System.out.println("login(db유저정보)"+user);
		System.out.println("login(받은유저정보)"+vo);
		if(user !=null)
		{
			if(encoder.matches(vo.getUserPwd(),user.getUserPwd()))
			{
				res="success";
				user.setUserPwd(vo.getUserPwd()); //이거 안하면 유저정보수정시, 인코딩된 암호가 뜸
				session.setAttribute("login", user);
				
				long limitTime = 60 *60 *24*90; //90일
				
				//자동로그인 체크시
				if(vo.isAutoLogin())
				{
					Date sessionLimit= new Date(System.currentTimeMillis()+ (limitTime *1000)) ; 
					System.out.println("자동로그인 쿠기진입");
					Cookie loginCookie = new Cookie("loginCookie",session.getId());
					loginCookie.setMaxAge((int)limitTime); //90일
					loginCookie.setPath("/"); //response 객체에 같이보냄
					
					response.addCookie(loginCookie);
					
					service.keepLogin(user.getUserId(), session.getId(), sessionLimit);
					System.out.println("로그인성공");
				}
			}
			else {
				System.out.println("로그인실패");
				res="pwFail";	
			}
		}
		else
		{
			System.out.println("일치하는 아이디의 회원이 없습니다");
			res="idFail";
		}
		return res;
	}
	
	//로그아웃 요청
	   @GetMapping("/logout")
	   public ModelAndView logout(HttpServletRequest request,
	            HttpServletResponse response,HttpSession session) throws Exception 
	   {
	      Object object = session.getAttribute("login");
	        if (object != null) {
	            UserVO userVO = (UserVO) object; //user 테이블 세션정보업데이트위함
	            session.removeAttribute("login");
	            session.invalidate(); //세션삭제
	            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
	            if (loginCookie != null) {
	                loginCookie.setPath("/");
	                loginCookie.setMaxAge(0);  //쿠키삭제
	                response.addCookie(loginCookie);// 0 짜리 보내면 쿠키삭제됨.
	                service.keepLogin(userVO.getUserId(), "none", new Date());//update
	            }
	        }
	      
	      return new ModelAndView("redirect:/");
	   }
	   
	   @DeleteMapping("/withdrawal")
	   public String withdrawal(@RequestBody int userNum,HttpSession session) throws Exception
	   {
		   System.out.println(userNum);
		   service.withdrawal(userNum);
		   session.invalidate();
		   System.out.println("탈퇴성공");
		   return "success";
	   }
}


