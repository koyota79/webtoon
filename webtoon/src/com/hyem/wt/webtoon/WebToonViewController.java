package com.hyem.wt.webtoon;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest; 

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hyem.wt.common.AES256Chiper;
import com.hyem.wt.lastview.service.LastViewItemService;

@Controller
public class WebToonViewController {

	@RequestMapping("/webToonDetail")
	public String LastViewItem(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		return "/webtoon/webToonDetail";  
	}
}