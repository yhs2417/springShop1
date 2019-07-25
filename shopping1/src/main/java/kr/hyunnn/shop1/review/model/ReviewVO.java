package kr.hyunnn.shop1.review.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {
	private int reviewId;
	private String content;
	private int productId;
	private String userId;
	private Date regDate;
	private String header;
}
