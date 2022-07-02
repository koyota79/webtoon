package com.hyem.wt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyem.wt.TestService;
import com.hyem.wt.VO.TestVO;

@Repository
public class TestServiceImpl implements TestService {
      
      @Autowired
      TestDAO TestDAO;
      
      @Override
      public List<TestVO> getTestValue(TestVO testVO){
            return TestDAO.getTestValue(testVO);
      }
}

