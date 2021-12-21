package com.ncq.datingweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping("home")
    public String getHome(){
        return "home";
    }
    @RequestMapping("registration")
    public String getRegistration(){
        return "registration";
    }

}
