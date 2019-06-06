package com.magneto.controller;

import com.magneto.pojo.Emp;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        if (url.indexOf("/reg.action") >= 0) {
            return true;
        }
        if (url.indexOf("/login.action") >= 0) {
            return true;
        }
        if(url.indexOf("/checkUsernameRepeat.action") >= 0){
            return true;
        }
        if(url.indexOf("/verify.action") >= 0){
            return true;
        }
        HttpSession session = request.getSession();
        Emp emp = (Emp) session.getAttribute("emp");
        if(emp!=null){
            return true;
        }

        request.setAttribute("msg","当前用户还未登陆，请先登陆！");
        request.getRequestDispatcher("../index.jsp").forward(request,response);

        return false;
    }
}
