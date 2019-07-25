package kr.hyunnn.shop1.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.hyunnn.shop1.commons.criteria.Paging;
import kr.hyunnn.shop1.commons.criteria.SearchCriteria;
import kr.hyunnn.shop1.review.model.ReviewVO;
import kr.hyunnn.shop1.review.repository.IReviewDAO;

@Service
public class ReviewService implements IReviewService
{
	@Autowired
	private IReviewDAO dao;
	
	@Override
	public int countReviews(int productId) throws Exception {
 		return dao.countReviews(productId);
	}

	@Override
	public List<ReviewVO> reviewList(int productId, Paging paging, SearchCriteria cri) throws Exception {
 		
		Map<String,Object> map=new HashMap<>();
		map.put("productId",productId);
		map.put("startRow",paging.getStartRow());
		map.put("endRow",paging.getEndRow());
		map.put("align",cri.getAlign());
		return dao.reviewList(map);
	}

	@Override
	public void reviewRegister(ReviewVO vo) throws Exception {
		 dao.reviewRegister(vo);
		
	}

	@Override
	public void reviewDelete(int reviewId) throws Exception {
		dao.reviewDelete(reviewId);
		
	}

	@Override
	public void reviewModify(ReviewVO vo) throws Exception {
		dao.reviewModify(vo);
	}
}
