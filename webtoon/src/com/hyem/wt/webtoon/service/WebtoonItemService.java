package com.hyem.wt.webtoon.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hyem.wt.common.AbstractDAO;

@Service("WebtoonItemService")
public class WebtoonItemService {
	private final String namespace = "com.hyem.wt.webtoon.WebtoonItemDao.";
	
	@Resource(name="abstractDAO")
	private AbstractDAO abstractDAO; 
	

	public HashMap selectWebtoonItem(String queryId, HashMap param) throws Exception {	
		HashMap result = abstractDAO.selectOne(namespace + queryId ,param); 
		return result;
	}

	
}
