package com.hyem.wt.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class Interceptor implements HandlerInterceptor{
	  // controller�� ������ ���� ó���ϴ� ���ͼ���
	  // ��ȯ�� false��� controller�� ��û�� ����
	  // �Ű����� Object�� �ڵ鷯 ������ �ǹ��Ѵ�. ( RequestMapping , DefaultServletHandler )
	  @Override
	  public boolean preHandle(
	      HttpServletRequest request, HttpServletResponse response,
	      Object obj) throws Exception {
	     
	    System.out.println("MyInterCeptor - preHandle = [" + request.getHeader("User-Agent") + "]");
	    
	    if(request.getHeader("User-Agent").indexOf("Mobile") != -1) {
	    	  System.out.println(":::::::::::Mobile ����:::::::::::::::");
	    	  return true;
	    } else {
	    	  System.out.println(":::::::::::PC ����:::::::::::::::");
	    	  return true; //false �Ǵ� web���� ��ȯ
	  	    //response.sendRedirect("/main.do");	
	    }
	    

	  }
	 
	  // controller�� handler�� ������ ó����
	  @Override
	  public void postHandle(
	      HttpServletRequest request, HttpServletResponse response,
	      Object obj, ModelAndView mav)
	      throws Exception {
	  }
	 
	  // view���� ó���� ���� �Ŀ� ó����
	  @Override
	  public void afterCompletion(
	      HttpServletRequest request, HttpServletResponse response,
	      Object obj, Exception e)
	      throws Exception {
	  }
	}

