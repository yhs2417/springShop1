package kr.hyunnn.shop1.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.hyunnn.shop1.Manager.model.ProductVO;
import kr.hyunnn.shop1.product.repository.IProductDAO;

@Service
public class ProductService implements IProductService
{
	@Autowired
	private IProductDAO dao;
	 
	@Override
	public ProductVO productDetail(int productId) throws Exception {
		 
		return dao.productDetail(productId);
	}

	
}
