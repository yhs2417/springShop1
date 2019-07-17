package kr.hyunnn.shop1.Manager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.hyunnn.shop1.Manager.model.CategoryVO;
import kr.hyunnn.shop1.Manager.model.CompanyVO;

@Service
public interface IManagerService
{
	public List<CategoryVO> selectCategory() throws Exception;
	public List<CompanyVO> selectCompany(String category) throws Exception;

}
