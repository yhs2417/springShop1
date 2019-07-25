package kr.hyunnn.shop1.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.hyunnn.shop1.cart.model.CartVO;
import kr.hyunnn.shop1.cart.service.ICartService;
import kr.hyunnn.shop1.user.model.UserVO;

@RestController
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private ICartService service;
	
	@GetMapping("/info")
	public ModelAndView cartList(HttpSession session) throws Exception
	{
		UserVO vo=(UserVO)session.getAttribute("login");
		String user=vo.getUserId();
		System.out.println("장바구나 jsp진입"+user);
		
		List<CartVO> cart=service.cartList(user);
		
		return new ModelAndView("cart/cartList","cart",cart);
	}
	
	
	
	@PostMapping("/add")
	public String addCart(@RequestBody CartVO vo) throws Exception
	{
		System.out.println("카트 추가 진입"+vo);
		
		service.addCart(vo);
		
		return "success";
	}
}
