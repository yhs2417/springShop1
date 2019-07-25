package kr.hyunnn.shop1.cart.repository;

import java.util.List;

import kr.hyunnn.shop1.cart.model.CartVO;

public interface ICartDAO {
	
	public void addCart(CartVO vo) throws Exception;
	public List<CartVO> cartList(String userId) throws Exception;

}
