package com.hyem.wt.buy;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hyem.wt.VO.LoginVO;
import com.hyem.wt.buy.service.BuyItemService;
import com.hyem.wt.login.service.LoginService;

@Controller
public class BuyItemController {
	
	@Resource(name="buyItemService")
	private BuyItemService service;
	
	@RequestMapping("/buyItemView")
	public String MainPage(Model model, HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		
		return "/buy/buyItemView";  
	}
	
	
	@RequestMapping("/buyItemList.json")
	public ModelAndView BuyItemList(@RequestParam HashMap<String,Object> param, HttpServletRequest request ,HttpServletResponse response) {
	    // 데이터와 뷰를 동시에 설정이 가능
	    ModelAndView mv     = new ModelAndView();
    	ArrayList list 		= null;
    	try{
	    	 list = service.selectBuyItemList("selectBuyItemList" , param);
	    	 System.out.println("::::::buyList Size::::::"+list.size());
	    	//Logger logger = Logger.getLogger("::::::::::::"+result.get("user_id"));
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	
	    mv.addObject("DATA", list);
	    return mv;
	}
	
}
