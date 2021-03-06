package kr.hyunnn.shop1.product.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.hyunnn.shop1.Manager.model.ProductVO;
import kr.hyunnn.shop1.Manager.service.IManagerService;
import kr.hyunnn.shop1.product.service.IProductService;
import kr.hyunnn.shop1.product.service.ProductService;

@RestController
@RequestMapping("/product")
public class ProductController 
{
	@Autowired
	private ProductService service;
	
	@GetMapping("/list")
	public ModelAndView productList(@RequestParam("category") String category,
							@RequestParam("keyword") String keyword,
							@RequestParam("condition") String condition
							) throws Exception
	{
		System.out.println("productList.jsp진입"+category);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/productList");
		mav.addObject("category",category);
		mav.addObject("keyword",keyword);
		mav.addObject("condition",condition);

		return mav;
	}
	
	@GetMapping("/detail")
	public ModelAndView productDetail(@RequestParam("id") int productId) throws Exception
	{
		System.out.println("productDetil.jsp진입"+productId);
		
		return  new ModelAndView("product/productDetail","product",
								service.productDetail(productId));
	}
}
