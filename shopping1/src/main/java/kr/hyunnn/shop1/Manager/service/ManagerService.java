package kr.hyunnn.shop1.Manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.hyunnn.shop1.Manager.model.CategoryVO;
import kr.hyunnn.shop1.Manager.model.CompanyVO;
import kr.hyunnn.shop1.Manager.model.ProductVO;
import kr.hyunnn.shop1.Manager.repository.IManagerDAO;
import kr.hyunnn.shop1.Manager.repository.ManagerDAO;
import kr.hyunnn.shop1.commons.criteria.Paging;
import kr.hyunnn.shop1.commons.criteria.SearchCriteria;

@Service
public class ManagerService implements IManagerService
{
	@Autowired
	IManagerDAO dao;
	
	@Override
	public List<CategoryVO> selectCategory() throws Exception
	{
		return dao.selectCategory();
	}

	@Override
	public List<CompanyVO> selectCompany(String category) throws Exception {
		
		return dao.selectCompany(category);
	}

	@Override
	public void productInsert(ProductVO vo) throws Exception {

		System.out.println(" product삽입 service진입"+vo);
		dao.productInsert(vo);
	}

	@Override
	public List<ProductVO> productList(String category,Paging paging,SearchCriteria cri) throws Exception {
		System.out.println("productListservice 진입");
		Map<String, Object> map=new HashMap<>();
		
		map.put("category",category);
		map.put("startRow",paging.getStartRow());
		map.put("endRow",paging.getEndRow());
		map.put("align",cri.getAlign());
		map.put("condition",cri.getCondition());
		map.put("keyword",cri.getKeyword());
		
		System.out.println("서비스에서인수값 확인:"+category+cri.getAlign()+cri.getCondition()+cri.getKeyword());
		
		return dao.productList(map);
	}

	@Override
	public void productUpdate(ProductVO vo) throws Exception {
		System.out.println("productupdate Service 진입");

		dao.productUpdate(vo);
	}

	@Override
	public void productDelete(int productId) throws Exception {
		dao.productDelete(productId);	
	}

	@Override
	public int countProducts(String category,SearchCriteria cri) throws Exception {
		
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("category",category);
		map.put("condition",cri.getCondition());
		map.put("keyword",cri.getKeyword());
		
		return dao.countProducts(map);
	}

	@Override
	public List<ProductVO> getRecommendProduct(String category) throws Exception {
		
		return dao.getRecommendProduct(category);
	}

	@Override
	public List<Integer> recommendedList(String category) throws Exception {
 		
		return dao.recommendedList(category);
	}

	@Override
	public void recommendUpdate(int productId) throws Exception {
		 dao.recommendUpdate(productId);
	}

	@Override
	public void recommendInit(String category) throws Exception {
	 
		dao.recommendInit(category);
	}

	@Override
	public void recommendDelete(int productId) throws Exception {
		 
		dao.recommendDelete(productId);
	}



}
