package com.hyem.wt.lastview.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hyem.wt.common.AbstractDAO;

@Service("lastViewItemService")
public class LastViewItemService {
	private final String namespace = "com.hyem.wt.lastview.LastViewItemDao.";
	
	@Resource(name="abstractDAO")
	private AbstractDAO abstractDAO; 
	

	public ArrayList selectLastViewList(String queryId, HashMap param) throws Exception {	
		return abstractDAO.selectList(namespace + queryId ,param);
	}
}
