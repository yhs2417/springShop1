package kr.hyunnn.shop1.product.controller;

import java.util.*;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.hyunnn.shop1.Manager.model.ProductVO;

@RestController
@RequestMapping("/product")
public class ProductController 
{
	@GetMapping("/list")
	public ModelAndView productList(@RequestParam("category") String category) throws Exception
	{
		System.out.println("productList.jsp진입"+category);
		return  new ModelAndView("product/productList","category",category);
	}
}
