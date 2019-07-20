package kr.hyunnn.shop1.Manager.model;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO 
{
	private int productId;
	private String productName;
	private int price;
	private Date regDate ;
	private String category;
	private String companyName;
	private String explain1;
	private String explain2;
	private String thumNail;
	private int recommend;
}
