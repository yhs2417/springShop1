package kr.hyunnn.shop1.user.model;

import java.util.Date;

import kr.hyunnn.shop1.user.model.UserVO;
import lombok.Data;

@Data
public class UserVO {
	
	private int userNum;
	private String userId;
	private String userPwd;
	private String userName;
	private String addrNum;
	private String addr1;
	private String addr2;
	private Date regDate;
	private String sessionID;
	private Date sessionLimit;	

		
}


