package com.hyem.wt.main;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hyem.wt.lastview.service.LastViewItemService;
import com.hyem.wt.main.service.MainPageService;

@Controller
public class MainPageController {

	
	@Resource(name="mainPageService")
	private MainPageService service;
	
	
	@RequestMapping("/main")
	public String MainPage(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();

    	HashMap param 		= new HashMap();
    	ArrayList wt_list 	= service.selectTodayWebToonList("selectTodayWebToonList" , param);
	    model.addAttribute("wtList", wt_list);
		return "mainPage";  
	}
	
	
	@RequestMapping("/todayWebToonList.json")
	public ModelAndView todayWebToonList(@RequestParam HashMap<String,Object> param, Model model) throws Exception {
	    // �����Ϳ� �並 ���ÿ� ������ ����
	    ModelAndView mv     = new ModelAndView();
    	ArrayList list 		= null;
	    list = service.selectTodayWebToonList("selectTodayWebToonList" , param);
	    System.out.println("::::::LastViewItemList Size::::::"+list.size());
	    
	    mv.addObject("DATA", list);
	    return mv;
	}
}
