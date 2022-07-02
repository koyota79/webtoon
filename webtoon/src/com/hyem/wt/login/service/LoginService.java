package com.hyem.wt.login.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hyem.wt.VO.LoginVO;
import com.hyem.wt.common.AbstractDAO;
import com.hyem.wt.common.CommonDAO;
import com.hyem.wt.common.CommonServiceImpl;

@Service("loginService")
public class LoginService{ 

	private final String namespace = "com.hyem.wt.login.LoginDao.";
	
	@Resource(name="abstractDAO")
	private AbstractDAO abstractDAO; 
	
	
	//아이디 로그인 정보 
	public HashMap selectLoginChk(String queryId, HashMap param) throws Exception {	
		return abstractDAO.selectOne(namespace + queryId ,param);
	}
	
	public LoginVO selectLoginChkVO(String queryId, HashMap param) throws Exception {	
		return abstractDAO.selectOneVO(namespace + queryId ,param);
	}
	
	public int insertLoginTempInfo(String queryId, HashMap param) throws Exception {	
		return abstractDAO.insert(namespace + queryId ,param);
	}
}
