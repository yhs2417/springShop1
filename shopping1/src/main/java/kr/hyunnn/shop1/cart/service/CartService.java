package kr.hyunnn.shop1.cart.service;

import java.util.List;

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
		dao.addCart(vo);
	}
	@Override
	public List<CartVO> cartList(String userId) throws Exception {
		return dao.cartList(userId);
	}

}
