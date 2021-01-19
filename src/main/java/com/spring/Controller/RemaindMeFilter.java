package com.spring.Controller;
import java.io.IOException;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class RemaindMeFilter implements Filter {
    
    
    private static final boolean debug = true;
    private FilterConfig filterConfig = null;
    
     public RemaindMeFilter() {
    } 
      
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
    		throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(false);
		Boolean byPassFilter = req.getServletPath().contains("signup.do")
				|| req.getServletPath().contains("createUser.do") || req.getServletPath().contains("index.do")
				|| req.getServletPath().contains("loginSuccess.do");
		if (session != null && session.getAttribute("loginStatus") != null || byPassFilter) {
			chain.doFilter(request, response);
		} else {
			HttpServletResponse res = (HttpServletResponse) response;
			res.sendRedirect("index.do");
		}
	}

    @Override
    public void destroy() {
    }
    

}
