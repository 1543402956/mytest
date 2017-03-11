package org.lcz.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lcz.entity.User;


public class LoginFilter implements Filter {


	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
			ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req=(HttpServletRequest)request;
		String uri = req.getRequestURI();
		if(uri.indexOf("login.jsp")!=-1||uri.indexOf("login.do")!=-1){
			 chain.doFilter(request, response);
		}else{
			User u=(User) req.getSession().getAttribute("user");
		   if(u==null){
			 if(uri.indexOf("addUser.do")>=1||uri.indexOf("regist.jsp")>=1){
				 chain.doFilter(request, response);
			 }else{
			   HttpServletResponse resp=(HttpServletResponse)response;
			   resp.sendRedirect(req.getContextPath()+"/login.jsp");
			   }
		   }else{
			   chain.doFilter(request, response);
		   }
		}
		
	}

	
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

  
}
