package com.hyem.wt.item.view;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hyem.wt.common.AES256Chiper;
import com.hyem.wt.item.view.service.ItemDetailViewService;
import com.hyem.wt.lastview.service.LastViewItemService;


@Controller
public class ItemDetailViewController {

	@Resource(name="itemDetailViewService")
	private ItemDetailViewService service;
	
	@Resource(name="aes256Chiper")
	private AES256Chiper aes256Chiper;
	
	@RequestMapping("/itemDetailView")
	public String ItemDetailView(@RequestParam("q") String params , Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		System.out.println("::::v_param::::"+params);
		System.out.println("::::v_param DEC::::"+aes256Chiper.decrypt(params));
		String v_data = aes256Chiper.decrypt(params);
		
		JSONParser parser = new JSONParser();
		HashMap hMap = (HashMap)parser.parse(v_data);
		
		//hMap.put(arg0, arg1);
		ArrayList list 		= null;
	    list = service.selectItemDetailViewList("selectItemDetailViewList" , hMap);
		model.addAttribute("itemDetailViewList", list);
		return "/view/itemDetailView";  
	}
	
}
