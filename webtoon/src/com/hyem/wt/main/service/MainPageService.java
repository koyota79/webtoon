package com.hyem.wt.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.hyem.wt.common.AbstractDAO;

@Service("mainPageService")
public class MainPageService {
	private final String namespace = "com.hyem.wt.mainpage.MainPageDao.";
	
	@Resource(name="abstractDAO")
	private AbstractDAO abstractDAO; 
	
//          리턴값      매서드                (매개변수 스트링 해쉬맵)
	public ArrayList selectTodayWebToonList(String queryId, HashMap param) throws Exception {	
		return abstractDAO.selectList(namespace + queryId ,param);
	}

}
