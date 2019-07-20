package kr.hyunnn.shop1.Manager.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.hyunnn.shop1.Manager.model.CategoryVO;
import kr.hyunnn.shop1.Manager.model.CompanyVO;
import kr.hyunnn.shop1.Manager.model.ProductVO;
import kr.hyunnn.shop1.Manager.service.IManagerService;
import kr.hyunnn.shop1.Manager.service.ManagerService;
import kr.hyunnn.shop1.commons.criteria.Criteria;
import kr.hyunnn.shop1.commons.criteria.Paging;

@RestController
@RequestMapping("/manager")
public class ManagerController 
{
	@Autowired
	private IManagerService service;
	
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
	public ModelAndView registerProduct(HttpSession session,MultipartFile img,
								ProductVO vo,RedirectAttributes red) throws Exception
	{
		System.out.println("상품등록진입"+vo);
		String path=session.getServletContext()
		.getRealPath("resources/images/uploads/");
		
		UUID uuid = UUID.randomUUID();
		
		String filename = uuid.toString() + img.getOriginalFilename();
		
		System.out.println(path);
		System.out.println("저장할 파일명 : " + filename);

		File f = new File(path,filename);
		
		FileCopyUtils.copy(img.getInputStream(),new FileOutputStream(f));

		vo.setThumNail("resources/images/uploads/"+filename);
		System.out.println("상품등록 service 전 vo"+vo);
		vo.setPrice(123456);
		service.productInsert(vo);
		System.out.println("상품등록 service성공");
		red.addFlashAttribute("redirectMsg","상품을 등록하였습니다");
		return new ModelAndView("redirect:/manager");
	}
	
	@GetMapping("/productList/{category}/{pg}")
	public Map<String,Object> productList(
						@PathVariable String category,
						@PathVariable int pg) throws Exception
	{	System.out.println("상품 조회 진입"+category+pg);
		Criteria cri= new Criteria();
		cri.setPg(pg);
		cri.setPerPage(8);
		
		int totalA=service.countProducts(category);
		
		Paging paging = new Paging(cri, totalA);
		
		List<ProductVO> product=service.productList(category,paging);
		System.out.println("Product조회 내용출력"+product);
		
		Map<String,Object> map=new HashMap<>();
		map.put("product",product);
		map.put("paging",paging);
		return map;
	}
	
	@PutMapping("/productUpdate")
	public String productUpdate(HttpSession session,MultipartFile img,
			@RequestBody ProductVO vo) throws Exception
	{
		System.out.println("상품수정진입"+vo);
		//이미지 변경은 jsp에서 파일 안올려서 null 인 경우는 그대로 두고,
		//파일 업로드 한경우만 바꿔주면 됨.
		
		if(img!=null)
		{
			System.out.println("이미지 수정파일 들어옴");
			String path=session.getServletContext()
								.getRealPath("resources/images/uploads/");
		
			UUID uuid = UUID.randomUUID();
		
			String filename = uuid.toString() + img.getOriginalFilename();
		
			System.out.println(path);
			System.out.println("저장할 파일명 : " + filename);

			File f = new File(path,filename);
		
			FileCopyUtils.copy(img.getInputStream(),new FileOutputStream(f));

			vo.setThumNail("resources/images/uploads/"+filename);
		} 
		System.out.println("상품수정service에 들어갈 vo="+vo);
 
		service.productUpdate(vo);
		
		return "success";
	}
	
	@DeleteMapping("/productDelete")
	public String productDelete(@RequestBody int productId) throws Exception
	{
		System.out.println("상품 삭제 진입"+productId);
		
		service.productDelete(productId);
		
		return "success";
	}
}
