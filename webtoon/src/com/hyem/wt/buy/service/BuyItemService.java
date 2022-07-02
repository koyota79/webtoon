package com.hyem.wt.buy.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hyem.wt.common.AbstractDAO;

@Service("buyItemService")
public class BuyItemService {
	private final String namespace = "com.hyem.wt.buy.BuyItemDao.";
	
	@Resource(name="abstractDAO")
	private AbstractDAO abstractDAO; 
	

	public ArrayList selectBuyItemList(String queryId, HashMap param) throws Exception {	
		return abstractDAO.selectList(namespace + queryId ,param);
	}
}
