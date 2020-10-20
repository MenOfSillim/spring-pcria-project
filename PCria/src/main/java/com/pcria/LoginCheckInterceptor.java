package com.pcria;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);
		String[] uriArr = uri.split("/");
		
		System.out.println("uriArr.length : " + uriArr.length);
		
		if(uri.equals("/")) {
			return true;
		} else if(uriArr[1].equals("res")) {
			return true;			
		}
		
		System.out.println("인터셉터");
		boolean isLogout = SecurityUtils.isLogout(request);
		
		switch(uriArr[1]) {
		case ViewRef.URI_USER:
			switch(uriArr[2]) {
			case "login":
				if(!isLogout) {
					response.sendRedirect("/main/seat");
					return false;
				}
			}
			break;
		case ViewRef.URI_MAIN:
			if(isLogout) {
				response.sendRedirect("/access/login");
				return false;
			}
		}
		return true;
	}	
}
