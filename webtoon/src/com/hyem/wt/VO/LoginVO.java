package com.hyem.wt.VO;
import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Data
@Getter @Setter
public class LoginVO {
	
	private String userId 		= "";
	private String login_id     = "";
	private String password 	= "";
	private String sessionKey 	= "";
	private String email 		= "";
	private String receiveSms 	= "";
	private String receiveEmail = "";
	private String adult 		= "";
	private int level 			= 0;
	private Date lastLoginDate;
	private Date inDate;
	
	public void setPassword(String password) {
		this.password = password;		// 
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;		// 
	}
	
	public String getPassword() {
		// TODO Auto-generated method stub
		return password;
	}
	public String getLogin_id() {
		// TODO Auto-generated method stub
		return login_id;
	}

}
