package com.hyem.wt.common;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyem.wt.VO.LoginVO;

@Repository("abstractDAO")
public class AbstractDAO {
    protected Log log = LogFactory.getLog(AbstractDAO.class);
     
    @Autowired
    private SqlSessionTemplate sqlSession;
     
    protected void printQueryId(String queryId) {
        if(log.isDebugEnabled()){
            log.debug("\t QueryId  \t:  " + queryId);
        }
    }
     
    public int insert(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.insert(queryId, params);
    }
     
    public Object update(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.update(queryId, params);
    }
     
    public Object delete(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.delete(queryId, params);
    }
     
    public Object selectOne(String queryId ){
        printQueryId(queryId);
        return sqlSession.selectOne(queryId);
    }
     
    public HashMap selectOne(String queryId, Object params){
        printQueryId(queryId);
        return (HashMap)sqlSession.selectOne(queryId, params);
    }
 
    @SuppressWarnings("rawtypes")
    public ArrayList selectList(String queryId){
        printQueryId(queryId);
        return (ArrayList) sqlSession.selectList(queryId);
    }
     
    @SuppressWarnings("rawtypes")
    public ArrayList selectList(String queryId, Object params){
        printQueryId(queryId);
        return (ArrayList) sqlSession.selectList(queryId,params);
    }
    
    //:::::::::::::::::::::::::: VO SQL SESSION ::::::::::::::::::::::::::
    public LoginVO selectOneVO(String queryId, HashMap params){
        printQueryId(queryId);
        return sqlSession.selectOne(queryId , params);
    }
}
