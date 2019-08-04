package kr.hyunnn.shop1.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import kr.hyunnn.shop1.order.service.IOrderService;
import kr.hyunnn.shop1.order.service.OrderService;
import kr.hyunnn.shop1.user.model.UserVO;

@RestController
@RequestMapping("/order")
public class OrderController 
{
	@Autowired
	private ICartService service;
	@Autowired
	private OrderService orderService;
	
	@GetMapping("/info")
	public ModelAndView IntoOrderList() throws Exception
	{
		System.out.println("주문정보 확인 jsp진입");
		return new ModelAndView("order/orderList");
	}
	
	@GetMapping("/list")
	public Map<String,Object> cartList(HttpSession session) throws Exception
	{
		UserVO vo=(UserVO)session.getAttribute("login");
		String user=vo.getUserId();
		
		List<CartVO> cart=service.cartList(user);
		System.out.println(user+"의 장바구니 정보출력"+cart);
		
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
	
	@GetMapping("/complete")
	public ModelAndView orderComplete() throws Exception
	{
		
		return new ModelAndView("order/orderComplete");
	}
	
	@PostMapping("/complete")
	public String orderComplete(@RequestBody Map<String,Object> map,HttpSession session) throws Exception
	{
		UserVO vo=(UserVO)session.getAttribute("login");
		String user=vo.getUserId();
		
		String msg="";
		String key1="payNo";
		String key2="totalPrice";
		
		String payNo=(String)map.get(key1);
		int totalPrice=(Integer)map.get(key2);
		
		System.out.println("주문완료 진입 imp_uid는"+payNo);
		
		String accessToken=orderService.getAccessToken();
		
		//결제된 금액 받기
		long payAmount=orderService.getOrderData(accessToken,payNo);
		
		//실제 결제금액과 주문 총 금액이 같으면, 주문내역 db에 저장
		System.out.println("결제된 금액과 db금액 비교"+payAmount+totalPrice);
		if((int)payAmount==totalPrice)
		{
			List<CartVO> cart=service.cartList(user);
			for (CartVO vo1 : cart)
			{
				orderService.addOrder(vo1);
				//기존 장바구니 삭제
				service.delCart(vo1.getCartId());
			}
			System.out.println("주문db저장, 기존장바구니 삭제");
			msg="success";
		}
		else if(payAmount!=totalPrice)
		{
			msg="error";
		}
			
		return msg;
	}
	
}
