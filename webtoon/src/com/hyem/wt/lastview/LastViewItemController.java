package com.hyem.wt.lastview;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hyem.wt.common.AES256Chiper;
import com.hyem.wt.lastview.service.LastViewItemService;


@Controller
public class LastViewItemController {

	@Resource(name="lastViewItemService")
	private LastViewItemService service;
	
	@Resource(name="aes256Chiper")
	private AES256Chiper aes256Chiper;
	
	@RequestMapping("/lastViewItem")
	public String LastViewItem(@RequestParam("q") String params , Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		System.out.println("::::v_param::::"+params);
		System.out.println("::::v_param DEC::::"+aes256Chiper.decrypt(params));
		
		String v_data = aes256Chiper.decrypt(params);
		JSONParser parser = new JSONParser();
		HashMap hMap = (HashMap)parser.parse(v_data);
		ArrayList list 		= null;
		System.out.println("::::::" + hMap.get("user_id") );
	    list = service.selectLastViewList("selectLastViewitemList" , hMap);
		model.addAttribute("viewList", list);
		return "/lastview/lastViewItem";  
	}
	
	@RequestMapping("/lastViewItemList.json")
	public ModelAndView LastViewItemList(@RequestParam HashMap<String,Object> param, Model model) throws Exception {
	    // 데이터와 뷰를 동시에 설정이 가능
	    ModelAndView mv     = new ModelAndView();
    	ArrayList list 		= null;
	    list = service.selectLastViewList("selectLastViewitemList" , param);
	    System.out.println("::::::LastViewItemList Size::::::"+list.size());
	    //Logger logger = Logger.getLogger("::::::::::::"+result.get("user_id"));
	    //model.addAttribute("viewList", list);
	    
	    mv.addObject("DATA", list);
	    return mv;
	}
	
	@RequestMapping("/lastViewItemMap")
	public String LastViewItem(@RequestParam("q") HashMap params , Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		System.out.println("::::v_param::::"+params.size());

		
		String v_data = (String) params.get("USER_ID");

		
		System.out.println(v_data);
		
		
		ArrayList list 		= null;
		HashMap<String,Object> param = new HashMap();
	    param.put("user_id", "test@tset.com");
	    list = service.selectLastViewList("selectLastViewitemList" , param);
		model.addAttribute("viewList", list);
		return "/lastview/lastViewItem";  
	}
}
