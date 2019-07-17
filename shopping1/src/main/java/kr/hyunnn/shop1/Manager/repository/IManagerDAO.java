package kr.hyunnn.shop1.Manager.repository;

import java.util.List;

import kr.hyunnn.shop1.Manager.model.CategoryVO;
import kr.hyunnn.shop1.Manager.model.CompanyVO;

public interface IManagerDAO {

	public List<CategoryVO> selectCategory() throws Exception;

	public List<CompanyVO> selectCompany(String category) throws Exception;
	
}
