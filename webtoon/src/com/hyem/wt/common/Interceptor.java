package com.hyem.wt.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class Interceptor implements HandlerInterceptor{
	  // controller로 보내기 전에 처리하는 인터셉터
	  // 반환이 false라면 controller로 요청을 안함
	  // 매개변수 Object는 핸들러 정보를 의미한다. ( RequestMapping , DefaultServletHandler )
	  @Override
	  public boolean preHandle(
	      HttpServletRequest request, HttpServletResponse response,
	      Object obj) throws Exception {
	     
	    System.out.println("MyInterCeptor - preHandle = [" + request.getHeader("User-Agent") + "]");
	    
	    if(request.getHeader("User-Agent").indexOf("Mobile") != -1) {
	    	  System.out.println(":::::::::::Mobile 버전:::::::::::::::");
	    	  return true;
	    } else {
	    	  System.out.println(":::::::::::PC 버전:::::::::::::::");
	    	  return true; //false 또는 web으로 전환
	  	    //response.sendRedirect("/main.do");	
	    }
	    

	  }
	 
	  // controller의 handler가 끝나면 처리됨
	  @Override
	  public void postHandle(
	      HttpServletRequest request, HttpServletResponse response,
	      Object obj, ModelAndView mav)
	      throws Exception {
	  }
	 
	  // view까지 처리가 끝난 후에 처리됨
	  @Override
	  public void afterCompletion(
	      HttpServletRequest request, HttpServletResponse response,
	      Object obj, Exception e)
	      throws Exception {
	  }
	}

