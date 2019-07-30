package kr.hyunnn.shop1.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.hyunnn.shop1.cart.model.CartVO;
import kr.hyunnn.shop1.cart.service.ICartService;
import kr.hyunnn.shop1.user.model.UserVO;
//12345
@RestController
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private ICartService service;
	
	@GetMapping("/info")
	public ModelAndView IntoCart(HttpSession session) throws Exception
	{
		System.out.println("장바구나 jsp진입");
		return new ModelAndView("cart/cartList");
	}
	
	@GetMapping("/list")
	public Map<String,Object> cartList(HttpSession session) throws Exception
	{
		UserVO vo=(UserVO)session.getAttribute("login");
		String user=vo.getUserId();
		
		List<CartVO> cart=service.cartList(user);
		System.out.println(user+"의 장바구나 정보출력"+cart);
		
		//총합계액 구하기
		int totalPrice=0;
		for(CartVO i : cart)
		{
			totalPrice+=i.getCount()*i.getProductvo().getPrice();
		}
		System.out.println("해당 장바구니 총 금액:"+totalPrice);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cart",cart);
		map.put("totalPrice",totalPrice);
		return map;
	}
	
	@PostMapping("/add")
	public String addCart(@RequestBody CartVO vo) throws Exception
	{
		System.out.println("카트 추가 진입"+vo);
		
		service.addCart(vo);
		
		return "success";
	}
	
	@PutMapping("/modCount")
	public String modCount(@RequestBody CartVO vo) throws Exception
	{
		System.out.println("카트 수정진입"+vo);
		
		service.modCount(vo);
		
		return "success";
	}
	
	@DeleteMapping("/delete")
	public String delCart(@RequestBody int cartId) throws Exception
	{
		System.out.println("카트삭제진입"+cartId);
		
		service.delCart(cartId);
		
		return "success";
	}
	
}
