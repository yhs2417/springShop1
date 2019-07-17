package kr.hyunnn.shop1.commons.criteria;

public class Criteria 
{
	private int pg;
	private int perPage;  //한페이지당
	
	public Criteria()
	{
		this.pg=1;
		this.perPage=10;
	}
	
	public int getPg() {
		return pg;
	}
	
	public void setPg(int pg) {
		this.pg = pg;
	}
	
	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + pg + ", countPerPage=" +perPage + "]";
	}
	
	
	
	
	/*
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page<=0)
			
		
		this.page = page;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		if(countPerPage <=0 || countPerPage >100)
		{
			this.countPerPage =10;
			return;
		}
		
		this.countPerPage = countPerPage;
	}
	//limit절의 조회 시작 인덱스르 계산해서 리턴하는 메서드
	public int getPageStart()
	{
		return (this.countPerPage -1) * countPerPage;
		
	}
	*/
	
}
