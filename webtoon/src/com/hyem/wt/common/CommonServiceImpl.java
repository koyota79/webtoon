package com.hyem.wt.common;

import java.util.ArrayList;
import java.util.HashMap;

public interface CommonServiceImpl {
	
	 ArrayList<HashMap<String, Object>> selectList(String query ,HashMap param)throws Exception;
	
	 HashMap<String, Object> selectOne(String query ,HashMap param)throws Exception;
}
