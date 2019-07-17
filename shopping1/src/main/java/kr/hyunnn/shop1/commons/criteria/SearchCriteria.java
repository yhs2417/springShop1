package kr.hyunnn.shop1.commons.criteria;

public class SearchCriteria extends Criteria{

	private String condition; //검색 조건
	private String keyword;
	
	//부모 클래스 생성자 가져오는거 구현 안해도 자동으로 인식하긴함. 
	public SearchCriteria() 
	{
		super();	
	}
	
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
}
