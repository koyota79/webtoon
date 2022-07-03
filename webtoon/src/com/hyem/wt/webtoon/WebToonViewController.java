package com.hyem.wt.webtoon;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest; 

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hyem.wt.common.AES256Chiper;
import com.hyem.wt.lastview.service.LastViewItemService;
import com.hyem.wt.main.service.MainPageService;
import com.hyem.wt.webtoon.service.WebtoonItemService;

@Controller
public class WebToonViewController {

	@Resource(name="WebtoonItemService")
	private WebtoonItemService service;
	
	
	@RequestMapping(value="/webToonDetail.do" , method = { RequestMethod.POST})
	public ModelAndView LastViewItem(@RequestParam HashMap<String,Object> param, Model mode) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		HashMap hmap = service.selectWebtoonItem("selectWebtoonItemData" , param);
		//System.out.println("::::::LastViewItemList Size::::::"+list.size());
	    
	    mv.addObject("DATA", hmap);
	    mv.setViewName("/webtoon/webToonDetail");
	    return mv;
	}
}