package kr.hyunnn.shop1.review.controller;

import java.util.HashMap;
import kr.hyunnn.shop1.review.model.ReviewVO;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.hyunnn.shop1.commons.criteria.Paging;
import kr.hyunnn.shop1.commons.criteria.SearchCriteria;
import kr.hyunnn.shop1.review.service.IReviewService;
import kr.hyunnn.shop1.review.service.ReviewService;

@RestController
@RequestMapping("/review")
public class ReviewController 
{
	@Autowired
	private ReviewService service;
	
	@PostMapping("/list/{pg}/{productId}")
	public Map<String,Object> reviewList(@RequestBody SearchCriteria cri,
			@PathVariable int pg, @PathVariable int productId) throws Exception
	{
		System.out.println("리뷰 리스트 조회 진입"+cri+"페이지:"+pg+"아이디:"+productId);
		
		cri.setPg(pg);
		cri.setPerPage(6);
		int totalA=service.countReviews(productId);
		
		Paging paging=new Paging(cri,totalA);
		
		List<ReviewVO> review=service.reviewList(
				productId,paging,cri);  //cri는 정렬용
		
		System.out.println("리뷰조회 내용출력"+review);
		System.out.println("리뷰조회 날짜출력"+review.get(0).getRegDate().getTime());

		Map<String,Object> map=new HashMap<>();
		map.put("review",review);
		map.put("paging",paging);
		return map;
	}
 	
	@PostMapping("/register")
	public String reviewRegister(@RequestBody ReviewVO vo) throws Exception
	{
		System.out.println("후기작성"+vo);
		
		service.reviewRegister(vo);
		return "success"; 
			
	}
	
	@DeleteMapping("/delete")
	public String reviewDelete(@RequestBody String reviewId) throws Exception
	{
		System.out.println("후기삭제"+reviewId);
		
		service.reviewDelete(Integer.parseInt(reviewId));
		return "success"; 
			
	}
	
	@PutMapping("/modify")
	public String reviewModify(@RequestBody ReviewVO vo) throws Exception
	{
		System.out.println("후기수정 진입"+vo);
		
		service.reviewModify(vo);
		return "success"; 
			
	}
}
