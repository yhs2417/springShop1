package kr.hyunnn.shop1.commons.criteria;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchCriteria extends Criteria{

	private String condition; //검색 조건
	private String keyword; //검색어
	private String align; //정렬조건
	
	//부모 클래스 생성자 가져오는거 구현 안해도 자동으로 인식하긴함. 
	public SearchCriteria() 
	{
		super();	
	}
	

}
