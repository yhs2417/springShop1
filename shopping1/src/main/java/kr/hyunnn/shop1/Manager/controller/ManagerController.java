package kr.hyunnn.shop1.Manager.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.hyunnn.shop1.Manager.model.CategoryVO;
import kr.hyunnn.shop1.Manager.model.CompanyVO;
import kr.hyunnn.shop1.Manager.service.IManagerService;
import kr.hyunnn.shop1.Manager.service.ManagerService;

@RestController
@RequestMapping("/manager")
public class ManagerController 
{
	@Autowired
	private ManagerService service;
	
	@GetMapping("")
	public ModelAndView getCategory() throws Exception
	{
		List<CategoryVO> category=service.selectCategory();
		System.out.println("카테고리 출력"+category);
		return new ModelAndView("manager/productMan",
				"category",category);
	}
	
	@GetMapping("/companies/{category}")
	public List<CompanyVO> getCompany(@PathVariable String category) throws Exception
	{
		List<CompanyVO> company=service.selectCompany(category);
		System.out.println("company 출력"+company);
		return company;
	}
	
	@PostMapping("/register")
	public void registerProduct(HttpSession session,MultipartFile img)
	{
		System.out.println("summernote진입");
		String path=session.getServletContext()
		.getRealPath("resources/images/uploads/");
		
		UUID uuid = UUID.randomUUID();
		/*
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;
		System.out.println(path);
		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		//String filepath = path + str_filename;
		//System.out.println("파일경로 : " + filepath);

		File f = new File(path,str_filename);
		
		FileCopyUtils.copy(file.getInputStream(),
						new FileOutputStream(f));
		//file.transferTo(f);
		
		System.out.println("리턴할 url1 :"+"resources/images/uploads/"+str_filename);
	*/
	}
	
}
