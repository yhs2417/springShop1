package kr.hyunnn.shop1.Manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.hyunnn.shop1.Manager.model.CategoryVO;
import kr.hyunnn.shop1.Manager.model.CompanyVO;
import kr.hyunnn.shop1.Manager.repository.IManagerDAO;

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
	
}
