package com.mushi.interceptor;

import com.mushi.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle (HttpServletRequest request, HttpServletResponse response,Object object) throws Exception{
        String url = request.getRequestURI();

//        除了登陆请求外，其他的rul进行拦截
        if (url.indexOf("/login.action")>=0){
            return true;
        }

//        获取session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("USER_SESSION");
//        判断session中是否有用户数据，如果有，返回true，继续向下执行
        if (user != null){
            return true;
        }

//        不符合条件的给出提示信息，并转发到登陆界面
        request.setAttribute("msg","您还没有登陆，先登陆");
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response,Object object,ModelAndView modelAndView) throws Exception{

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,Object handler,Exception ex) throws Exception{

    }
}
