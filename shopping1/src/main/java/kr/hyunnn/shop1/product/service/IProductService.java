package kr.hyunnn.shop1.product.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.hyunnn.shop1.Manager.model.ProductVO;

@Service
public interface IProductService {

	public ProductVO productDetail(int productId) throws Exception;

}
