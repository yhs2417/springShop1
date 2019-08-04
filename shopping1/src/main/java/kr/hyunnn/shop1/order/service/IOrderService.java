package kr.hyunnn.shop1.order.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import kr.hyunnn.shop1.cart.model.CartVO;

@Service
public interface IOrderService {

	public String getAccessToken() throws Exception;
	public long getOrderData(String accessToken,String payNo) throws Exception; 
	public void addOrder(CartVO vo) throws Exception;


}
