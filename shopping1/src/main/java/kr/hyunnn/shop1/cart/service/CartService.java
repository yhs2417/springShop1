package kr.hyunnn.shop1.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.hyunnn.shop1.cart.model.CartVO;
import kr.hyunnn.shop1.cart.repository.ICartDAO;

@Service
public class CartService implements ICartService{

	@Autowired
	private ICartDAO dao;
	
	@Override
	public void addCart(CartVO vo) throws Exception {
		
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("userId",vo.getUserId());
		map.put("productId",vo.getProductId());
		
		//productId와 userid일치하는 행 있는지 검사
		int cartId=dao.confirmCarted(map);
		System.out.println("기존에 카트에 있던건지 확인"+cartId);
		if(cartId==0)
		{
			dao.addCart(vo);
		}
		else
		{
			dao.modifyCart(vo); 
		}
		
	}
	@Override
	public List<CartVO> cartList(String userId) throws Exception {
		return dao.cartList(userId);
	}
	@Override
	public void modCount(CartVO vo) throws Exception {
		dao.modCount(vo);
		
	}
	@Override
	public void delCart(int cartId) throws Exception {
		dao.delCart(cartId);
	}
 
}
