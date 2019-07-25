package kr.hyunnn.shop1.product.repository;

import java.util.List;

import kr.hyunnn.shop1.Manager.model.ProductVO;

public interface IProductDAO {

	public ProductVO productDetail(int productId) throws Exception;

}
