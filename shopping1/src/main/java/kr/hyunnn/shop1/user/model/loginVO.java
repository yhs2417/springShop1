package kr.hyunnn.shop1.user.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class loginVO {
	private String userId;
	private String userPwd;
	private boolean autoLogin;
}
