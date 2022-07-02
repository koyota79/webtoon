package com.hyem.wt.common;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository("commonDAO")
public class CommonDAO extends AbstractDAO{

	 
    public ArrayList<HashMap<String, Object>> selectList(String query ,HashMap<String, Object> map) throws Exception{
        return selectList(query, map);
    }
    
    public HashMap<String, Object> selectOne(String query ,HashMap<String, Object> map) throws Exception{
        return this.selectOne(query, map);
    }
}
