package com.mushi.controller;

import com.mushi.pojo.User;
import com.mushi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login.action",method = RequestMethod.GET)
    public String toLogin(){
        return "login";
    }

//    用户登陆
    @RequestMapping(value = "/login.action",method = RequestMethod.POST)
    public String login(String usercode, String password, Model model,HttpSession session){
        User user = userService.findUser(usercode,password);

        if (user != null){
            session.setAttribute("USER_SESSION",user);
            return "redirect:findAllCustomer.action";
        }

        model.addAttribute("msg","用户名或密码错误，请重新输入");
        return "login";
    }
}
