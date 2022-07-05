package com.hyem.wt;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hyem.wt.VO.TestVO;

@Controller
public class TestController {
	  @Autowired
      TestService TestService;
      
      @RequestMapping("/goTestPage.do")
      public String goTestPage(Model model, HttpServletRequest request){
            
            TestVO testVO = new TestVO(); 
            List<TestVO> list = TestService.getTestValue(testVO);
            System.out.println(":::::::list.size():::::::::"+list.size());
            if( list.size() > 0 ){
                  model.addAttribute("output", "Success_DB_Connection");
            }else{
                  model.addAttribute("output", "Fail_DB_Connection");
            }
            
            return "test";
      }
}
