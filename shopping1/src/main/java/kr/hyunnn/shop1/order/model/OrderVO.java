package kr.hyunnn.shop1.order.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVO {

	private int order_id;
	private String userId;
	private int productId;
	private int count;
	private Date orderDate;
}
