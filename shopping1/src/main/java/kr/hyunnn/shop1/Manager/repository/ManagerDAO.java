package kr.hyunnn.shop1.Manager.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.hyunnn.shop1.Manager.model.CategoryVO;
import kr.hyunnn.shop1.Manager.model.CompanyVO;
import kr.hyunnn.shop1.Manager.model.ProductVO;


public class ManagerDAO{

	/*
	@Autowired
	private SqlSession session;
	
	@Override
	public List<CategoryVO> selectCategory() throws Exception {
	 
		return session.selectList("mapper1.selectCategory");
	}

	@Override
	public List<CompanyVO> selectCompany(String category) throws Exception {
		 
		return session.selectList("mapper1.selectCompany",category);
	}

	@Override
	public void productInsert(ProductVO vo) throws Exception {
		
		session.insert("mapper1.productInsert",vo);
		
	}*/

}
