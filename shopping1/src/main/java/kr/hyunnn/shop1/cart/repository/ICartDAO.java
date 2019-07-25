package kr.hyunnn.shop1.cart.repository;

import java.util.*;

import kr.hyunnn.shop1.cart.model.CartVO;

public interface ICartDAO {
	
	public void addCart(CartVO vo) throws Exception;
	public List<CartVO> cartList(String userId) throws Exception;
	public int confirmCarted(Map<String,Object> map) throws Exception;
	public void modifyCart(CartVO vo) throws Exception;
	public void modCount(CartVO vo) throws Exception;
	public void delCart(int cartId) throws Exception;

	
	
	
}
