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
	public List<ProductVO> productList(String category,Paging paging) throws Exception {
		System.out.println("productListservice 진입");
		Map<String, Object> map=new HashMap<>();
		map.put("category",category);
		map.put("startRow",paging.getStartRow());
		map.put("endRow",paging.getEndRow());
			
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
	public int countProducts(String category) throws Exception {
		 
		return dao.countProducts(category);
	}
	
}
