package kr.hyunnn.shop1.order.repository;

import java.util.Map;

import kr.hyunnn.shop1.cart.model.CartVO;

public interface IOrderDAO {

	public void addOrder(Map<String, Object> map) throws Exception;

}
