package kr.hyunnn.shop1.Manager.repository;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.hyunnn.shop1.Manager.model.CategoryVO;
import kr.hyunnn.shop1.Manager.model.CompanyVO;
import kr.hyunnn.shop1.Manager.model.ProductVO;
import kr.hyunnn.shop1.commons.criteria.Paging;


public interface IManagerDAO {

	public List<CategoryVO> selectCategory() throws Exception;

	public List<CompanyVO> selectCompany(String category) throws Exception;
	public void productInsert(ProductVO vo) throws Exception;
	
	public List<ProductVO> productList(Map<String, Object> map) throws Exception;
	public void productUpdate(ProductVO vo) throws Exception;
	public void productDelete(int productId) throws Exception;
	public int countProducts(String category) throws Exception;
}
