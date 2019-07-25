package kr.hyunnn.shop1.review.repository;

import java.util.List;
import java.util.Map;

import kr.hyunnn.shop1.review.model.ReviewVO;

public interface IReviewDAO 
{
	public int countReviews(int productId) throws Exception;
	public List<ReviewVO> reviewList(Map<String,Object> map) throws Exception;
	public void reviewRegister(ReviewVO vo) throws Exception;
	public void reviewDelete(int reviewId) throws Exception;
	public void reviewModify(ReviewVO vo) throws Exception;
	
}
