package kr.hyunnn.shop1.cart.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.hyunnn.shop1.cart.model.CartVO;

@Service
public interface ICartService {
	public void addCart(CartVO vo) throws Exception;
	public List<CartVO> cartList(String userId) throws Exception;

}
