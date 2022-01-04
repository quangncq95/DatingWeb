package com.ncq.datingweb.controller;

import com.ncq.datingweb.dto.ChangePassword;
import com.ncq.datingweb.dto.ProfileDto;
import com.ncq.datingweb.dto.Response;
import com.ncq.datingweb.dto.UserAccountDto;
import com.ncq.datingweb.entities.UserAccount;
import com.ncq.datingweb.entities.UserDetailsEntities;
import com.ncq.datingweb.service.CustomerUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.security.Principal;

@Controller
public class HomeController {
    @Autowired
    CustomerUserDetailService customerUserDetailService;

    @RequestMapping("/home")
    public String getHome(Model model){
        model.addAttribute("title","Mabel");
        return "/home";
    }

//    @RequestMapping(value = "/j_spring_security_check", method = RequestMethod.POST)
//    public String check(Model model){
//        if (SecurityContextHolder.getContext().getAuthentication() != null){
//            model.addAttribute("message","Tài khoản hoặc mật khẩu không chính xác");
//        }
//        return "/home";
//    }

    @RequestMapping("/change_pass")
    public String changePass(Model model){
        model.addAttribute("title","Mabel-ChangePassword");
        return "/change_pass";
    }


    @RequestMapping(value = "/change_password")
    @ResponseBody
    public Response changePass(@RequestBody ChangePassword changePassword){
        return customerUserDetailService.changePass(changePassword);
    }

    @RequestMapping(value = "/create")
    @ResponseBody
    public Response createUser(@RequestBody UserAccountDto userAccountDto){
        UserAccount userAccount = customerUserDetailService.saveUserAccount(userAccountDto);
        SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(userAccount, userAccount.getPassword(), userAccount.getAuthorities()));
        return new Response(1,userAccountDto);
    }

    @RequestMapping("/create_profile")
    @ResponseBody
    public Response createProfile(@RequestBody ProfileDto profileDto){
        customerUserDetailService.saveUserDetails(profileDto);
        return new Response(1,profileDto);
    }

    @RequestMapping("/encounters")
    public String getEncounters(Model model, HttpSession session){
        model.addAttribute("title","Mabel-Encounters");
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        return "/encounters";
    }

    @RequestMapping("/profile")
    public String getProfile(Model model){
        model.addAttribute("title","Mabel-Profile");
        return "/profile";
    }

    @RequestMapping("/liked-you")
    public String getLikedYou(Model model){
        model.addAttribute("title","Mabel-Liked you!");
        return "/liked-you";
    }

    @RequestMapping("/message")
    public String getMessage(Model model){
        model.addAttribute("title","Mabel-Message");
        return "/message";
    }
}
