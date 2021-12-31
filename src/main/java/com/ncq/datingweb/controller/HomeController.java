package com.ncq.datingweb.controller;

import com.ncq.datingweb.dto.ChangePassword;
import com.ncq.datingweb.dto.Response;
import com.ncq.datingweb.dto.UserDto;
import com.ncq.datingweb.service.CustomerUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
    @Autowired
    CustomerUserDetailService customerUserDetailService;

    @RequestMapping("home")
    public String getHome(Model model){
        model.addAttribute("title","Mabel");
        return "home";
    }

    @RequestMapping("/change_pass")
    public String changePass(Model model){
        model.addAttribute("title","Mabel-ChangePassword");
        return "change_pass";
    }


    @RequestMapping(value = "/change_password")
    @ResponseBody
    public Response changePass(@RequestBody ChangePassword changePassword){
        return customerUserDetailService.changePass(changePassword);
    }

    @RequestMapping(value = "create", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public Response createUser(@RequestBody UserDto userDto){
        customerUserDetailService.saveUser(userDto);
        return new Response(1,userDto);
    }

    @RequestMapping("encounters")
    public String getEncounters(Model model, HttpSession session){
        model.addAttribute("title","Mabel-Encounters");
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
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
