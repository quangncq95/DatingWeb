package com.ncq.datingweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping("home")
    public String getHome(Model model){
        model.addAttribute("title","Truelove");
        return "home";
    }
    @RequestMapping("registration")
    public String getRegistration(Model model){
        model.addAttribute("title","Truelove-Registration");
        return "registration";
    }

    @RequestMapping("encounters")
    public String getEncounters(Model model){
        model.addAttribute("title","Truelove-Encounters");
        return "encounters";
    }

    @RequestMapping("profile")
    public String getProfile(Model model){
        model.addAttribute("title","Truelove-Profile");
        return "profile";
    }

    @RequestMapping("liked-you")
    public String getLikedYou(Model model){
        model.addAttribute("title","Truelove-Liked you!");
        return "liked-you";
    }

    @RequestMapping("message")
    public String getMessage(Model model){
        model.addAttribute("title","Truelove-Message");
        return "message";
    }
}
