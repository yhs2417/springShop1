package kr.hyunnn.shop1.Manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.hyunnn.shop1.Manager.model.CategoryVO;
import kr.hyunnn.shop1.Manager.model.CompanyVO;
import kr.hyunnn.shop1.Manager.model.ProductVO;
import kr.hyunnn.shop1.commons.criteria.Paging;
import kr.hyunnn.shop1.commons.criteria.SearchCriteria;


public interface IManagerService
{
	public List<CategoryVO> selectCategory() throws Exception;
	public List<CompanyVO> selectCompany(String category) throws Exception;
	public void productInsert(ProductVO vo) throws Exception;
	public List<ProductVO> productList(String category,Paging paging,SearchCriteria cri) throws Exception;
	public void productUpdate(ProductVO vo) throws Exception;
	public void productDelete(int productId) throws Exception;
	public int countProducts(String category,SearchCriteria cri) throws Exception;
	public List<ProductVO> getRecommendProduct(String category) throws Exception;
	public List<Integer> recommendedList(String category) throws Exception;
	public void recommendUpdate(int productId) throws Exception;
	public void recommendInit(String category) throws Exception;
	public void recommendDelete(int productId) throws Exception;


}
