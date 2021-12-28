package com.ncq.datingweb.controller;

import com.ncq.datingweb.dto.Response;
import com.ncq.datingweb.dto.UserDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
    @RequestMapping("home")
    public String getHome(Model model){
        model.addAttribute("title","Mabel");
        return "home";
    }
    @RequestMapping("registration")
    public String getRegistration(Model model){
        model.addAttribute("title","Mabel-Registration");
        return "registration";
    }

    @RequestMapping(value = "create", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public Response createUser(@RequestBody UserDto userDto){
        return new Response(1,userDto);
    }

    @RequestMapping("encounters")
    public String getEncounters(Model model){
        model.addAttribute("title","Mabel-Encounters");
        return "encounters";
    }

    @RequestMapping("profile")
    public String getProfile(Model model){
        model.addAttribute("title","Mabel-Profile");
        return "profile";
    }

    @RequestMapping("liked-you")
    public String getLikedYou(Model model){
        model.addAttribute("title","Mabel-Liked you!");
        return "liked-you";
    }

    @RequestMapping("message")
    public String getMessage(Model model){
        model.addAttribute("title","Mabel-Message");
        return "message";
    }
}
