package kr.hyunnn.shop1.commons.criteria;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import kr.hyunnn.shop1.commons.criteria.SearchCriteria;

public class Paging 
{
	private int startRow;
	private int endRow;
	
	private int startPg;
	private int endPg;
	private int totalA;
	private int totalP;
	
	private Criteria cri;
	
	public Criteria getCri() {
		return cri;
	}
	//객체주입법1
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public Paging(Criteria cri,int totalA)
	{
		//객체주입법2
		this.cri=cri;
		this.endRow = cri.getPg()*cri.getPerPage();
		this.startRow = endRow-(cri.getPerPage()-1);
		
		//10=페이징 그룹 숫자.
		this.startPg=((cri.getPg()-1)/10)*10 +1;
		this.endPg=startPg+9;
		
		this.totalA=totalA;
		this.totalP=(totalA+(cri.getPerPage()-1))/cri.getPerPage();
		
		if(endPg>totalP) this.endPg=totalP;
	
	}
	/*
	public String PageURI(int page) {
		UriComponents ucp = UriComponentsBuilder.newInstance()
							.queryParam("page", page)
							.queryParam("countPerPage", criteria.getCountPerPage())
							.build();
		return ucp.toUriString();
	}*/
	 //page만 받는 이유는 page숫자를 +1 -1 넣는 경우가 있어서인듯. 다른 것들은 jsp에서의 값 그대로 넣고
	public String mkUri(int pg)
	{
		UriComponents ucp = UriComponentsBuilder.newInstance()
				.queryParam("pg", pg)
				.queryParam("perPage", cri.getPerPage())
				.queryParam("condition", ((SearchCriteria)cri).getCondition())
				.queryParam("keyword", ((SearchCriteria)cri).getKeyword())
				.build();
		return ucp.toUriString();
	}

	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int StartRow) {
		this.startRow = StartRow;
	}
	public int getStartPg() {
		return startPg;
	}
	public void setStartPg(int startPg) {
		this.startPg = startPg;
	}
	public int getEndPg() {
		return endPg;
	}
	public void setEndPg(int endPg) {
		this.endPg = endPg;
	}
	public int getTotalA() {
		return totalA;
	}
	public void setTotalA(int totalA) {
		this.totalA = totalA;
	}
	public int getTotalP() {
		return totalP;
	}
	public void setTotalP(int totalP) 
	{
		this.totalP = totalP;
	}
	
}
