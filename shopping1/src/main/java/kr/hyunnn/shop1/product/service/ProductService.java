package kr.hyunnn.shop1.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.hyunnn.shop1.Manager.model.ProductVO;
import kr.hyunnn.shop1.product.repository.IProductDAO;

public class ProductService implements IProductService
{
	@Autowired
	private IProductDAO dao;
	
	@Override
	public List<ProductVO> getProductList(String category) throws Exception {
		return dao.getProductList(category);
	}

	
}
