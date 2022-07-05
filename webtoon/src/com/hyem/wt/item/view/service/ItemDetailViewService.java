package com.hyem.wt.item.view.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hyem.wt.common.AbstractDAO;

@Service("itemDetailViewService")
public class ItemDetailViewService {
	private final String namespace = "com.hyem.wt.view.ItemDetailViewDao.";
	
	@Resource(name="abstractDAO")
	private AbstractDAO abstractDAO; 
	

	public ArrayList selectItemDetailViewList(String queryId, HashMap param) throws Exception {	
		return abstractDAO.selectList(namespace + queryId ,param);
	}
}
