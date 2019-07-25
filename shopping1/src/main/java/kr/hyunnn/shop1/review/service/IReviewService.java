package kr.hyunnn.shop1.review.service;

import java.util.List;
import kr.hyunnn.shop1.review.model.ReviewVO;

import org.springframework.stereotype.Service;

import kr.hyunnn.shop1.commons.criteria.Paging;
import kr.hyunnn.shop1.commons.criteria.SearchCriteria;

@Service
public interface IReviewService 
{
	public int countReviews(int productId) throws Exception;
	public List<ReviewVO> reviewList(int productId,Paging paging,SearchCriteria cri) throws Exception;
	public void reviewRegister(ReviewVO vo) throws Exception;
	public void reviewDelete(int reviewId) throws Exception;
	public void reviewModify(ReviewVO vo) throws Exception;





}
