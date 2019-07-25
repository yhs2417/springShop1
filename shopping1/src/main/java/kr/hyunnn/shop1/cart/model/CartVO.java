package kr.hyunnn.shop1.cart.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartVO {
	private int cartId	;
	private String userId;
	private int productId;
	private int count;
}
